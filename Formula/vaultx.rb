class Vaultx < Formula
  desc "Comprehensive Vault Cluster Status Checker"
  homepage "https://github.com/zbaban/vaultx"
  url "https://github.com/zbaban/vaultx/archive/v1.0.0.tar.gz"
  sha256 "088ddfb3e395a2a987425153193d0ed0d1c77abe5cf64595bed1cd8bf3c96be5"
  license "MIT"

  depends_on "vault"
  depends_on "jq"

  def install
    bin.install "vaultx"
  end

  test do
    assert_match "Usage: vaultx", shell_output("#{bin}/vaultx --help")
  end
end
