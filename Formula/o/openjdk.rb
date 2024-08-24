class Openjdk < Formula
  desc "Development kit for the Java programming language"
  homepage "https://openjdk.java.net/"
  url "https://github.com/openjdk/jdk23u/archive/refs/tags/jdk-23+37.tar.gz"
  version "23"
  sha256 "5c3fc2bc6aed4dd2c9d5be9d5a72354932a63473cad816314f87b29ceaa185eb"
  license "GPL-2.0-only" => { with: "Classpath-exception-2.0" }

  livecheck do
    url :stable
    regex(/^jdk[._-]v?(\d+(?:\.\d+)*)-ga$/i)
  end

  bottle do
    sha256 cellar: :any, arm64_sonoma:   "a358fe408c5c64524cabed4da75a1d16175ebedc0477ef3870e3db75a0800302"
    sha256 cellar: :any, arm64_ventura:  "08278518189b954b7e2abe25283ef2a50b7de0a4e0bde6fbb890066aa7568dbd"
    sha256 cellar: :any, arm64_monterey: "10c80312e091cbc90ce66a61da051f0320f96752aeefa4aafdae3a402ba8b738"
    sha256 cellar: :any, sonoma:         "9f84e386dcc5dca1ecdab63724b6dffc967e8a212ef4673d981ec60b733ce43b"
    sha256 cellar: :any, ventura:        "b73fa3f093d1153afa5baf376346521d7cc863fe679287b7abf57a180aa7a651"
    sha256 cellar: :any, monterey:       "84795b272691e9ee02b9a0bb9fba35552c1ae8d3b977be2468dc71e57aa4e42f"
    sha256               x86_64_linux:   "8493873d21bcda50b1cf5644a2e7582fddf1ac6936ed23e1d2c6ada6d10ee7eb"
  end

  keg_only :shadowed_by_macos

  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  depends_on xcode: :build
  depends_on "giflib"
  depends_on "harfbuzz"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "little-cms2"
  depends_on macos: :catalina

  uses_from_macos "cups"
  uses_from_macos "unzip"
  uses_from_macos "zip"
  uses_from_macos "zlib"

  on_linux do
    depends_on "alsa-lib"
    depends_on "fontconfig"
    depends_on "freetype"
    depends_on "libx11"
    depends_on "libxext"
    depends_on "libxi"
    depends_on "libxrandr"
    depends_on "libxrender"
    depends_on "libxt"
    depends_on "libxtst"
  end

  fails_with gcc: "5"

  # From https://jdk.java.net/archive/
  resource "boot-jdk" do
    on_macos do
      on_arm do
        url "https://download.java.net/java/GA/jdk22.0.2/c9ecb94cd31b495da20a27d4581645e8/9/GPL/openjdk-22.0.2_macos-aarch64_bin.tar.gz"
        sha256 "3dab98730234e1a87aec14bcb8171d2cae101e96ff4eed1dab96abbb08e843fd"
      end
      on_intel do
        url "https://download.java.net/java/GA/jdk22.0.2/c9ecb94cd31b495da20a27d4581645e8/9/GPL/openjdk-22.0.2_macos-x64_bin.tar.gz"
        sha256 "e8b3ec7a7077711223d31156e771f11723cd7af31c2017f1bd2eda20855940fb"
      end
    end
    on_linux do
      on_arm do
        url "https://download.java.net/java/GA/jdk22.0.2/c9ecb94cd31b495da20a27d4581645e8/9/GPL/openjdk-22.0.2_linux-aarch64_bin.tar.gz"
        sha256 "25fba2bd5585e1e9923134dc827f2bd5a2beaca3d242ae00b7e68c152faf7ba6"
      end
      on_intel do
        url "https://download.java.net/java/GA/jdk22.0.2/c9ecb94cd31b495da20a27d4581645e8/9/GPL/openjdk-22.0.2_linux-x64_bin.tar.gz"
        sha256 "41536f115668308ecf4eba92aaf6acaeb0936225828b741efd83b6173ba82963"
      end
    end
  end

  # Fix build with `--with-harfbuzz=system`.
  # https://github.com/openjdk/jdk/pull/19739
  patch do
    url "https://github.com/openjdk/jdk/commit/ba5a4670b8ad86fefb41a939752754bf36aac9dc.patch?full_index=1"
    sha256 "ff6c66f3fa81bef3fb18e88196c520cfa867aa5d57ebf26574635723b4d06d16"
  end

  def install
    boot_jdk = buildpath/"boot-jdk"
    resource("boot-jdk").stage boot_jdk
    boot_jdk /= "Contents/Home" if OS.mac?
    java_options = ENV.delete("_JAVA_OPTIONS")

    args = %W[
      --disable-warnings-as-errors
      --with-boot-jdk-jvmargs=#{java_options}
      --with-boot-jdk=#{boot_jdk}
      --with-debug-level=release
      --with-jvm-variants=server
      --with-native-debug-symbols=none
      --with-vendor-bug-url=#{tap.issues_url}
      --with-vendor-name=#{tap.user}
      --with-vendor-url=#{tap.issues_url}
      --with-vendor-version-string=#{tap.user}
      --with-vendor-vm-bug-url=#{tap.issues_url}
      --with-version-build=#{revision}
      --without-version-opt
      --without-version-pre
      --with-giflib=system
      --with-harfbuzz=system
      --with-lcms=system
      --with-libjpeg=system
      --with-libpng=system
      --with-zlib=system
    ]

    ldflags = %W[
      -Wl,-rpath,#{loader_path.gsub("$", "\\$$")}
      -Wl,-rpath,#{loader_path.gsub("$", "\\$$")}/server
    ]
    args += if OS.mac?
      ldflags << "-headerpad_max_install_names"

      %W[
        --enable-dtrace
        --with-sysroot=#{MacOS.sdk_path}
      ]
    else
      %W[
        --with-x=#{HOMEBREW_PREFIX}
        --with-cups=#{HOMEBREW_PREFIX}
        --with-fontconfig=#{HOMEBREW_PREFIX}
        --with-freetype=system
        --with-stdc++lib=dynamic
      ]
    end
    args << "--with-extra-ldflags=#{ldflags.join(" ")}"

    system "bash", "configure", *args

    ENV["MAKEFLAGS"] = "JOBS=#{ENV.make_jobs}"
    system "make", "images"

    jdk = libexec
    if OS.mac?
      libexec.install Dir["build/*/images/jdk-bundle/*"].first => "openjdk.jdk"
      jdk /= "openjdk.jdk/Contents/Home"
    else
      libexec.install Dir["build/linux-*-server-release/images/jdk/*"]
    end

    bin.install_symlink Dir[jdk/"bin/*"]
    include.install_symlink Dir[jdk/"include/*.h"]
    include.install_symlink Dir[jdk/"include"/OS.kernel_name.downcase/"*.h"]
    man1.install_symlink Dir[jdk/"man/man1/*"]
  end

  def caveats
    on_macos do
      <<~EOS
        For the system Java wrappers to find this JDK, symlink it with
          sudo ln -sfn #{opt_libexec}/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
      EOS
    end
  end

  test do
    (testpath/"HelloWorld.java").write <<~EOS
      class HelloWorld {
        public static void main(String args[]) {
          System.out.println("Hello, world!");
        }
      }
    EOS

    system bin/"javac", "HelloWorld.java"

    assert_match "Hello, world!", shell_output("#{bin}/java HelloWorld")
  end
end
