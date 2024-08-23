class PkgM4 < Formula
  # TODO: Switch to pkgconf source or merge back into pkgconf formula once migration is done
  desc "Macros to locate and use pkg-config"
  homepage "https://www.freedesktop.org/wiki/Software/pkg-config/"
  url "https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz"
  mirror "http://fresh-center.net/linux/misc/pkg-config-0.29.2.tar.gz"
  sha256 "6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591"
  license "GPL-2.0-or-later"

  livecheck do
    formula "pkg-config"
  end

  uses_from_macos "m4" => :test

  def install
    system "./configure", "--disable-host-tool",
                          "--disable-silent-rules",
                          "--with-internal-glib",
                          *std_configure_args
    system "make", "install-m4DATA"
  end

  test do
    (testpath/"test.m4").write <<~EOS
      changequote([,])
      include([#{share}/aclocal/pkg.m4])
    EOS
    assert_match "AC_DEFUN(PKG_CHECK_MODULES", shell_output("m4 --fatal-warnings test.m4")
  end
end
