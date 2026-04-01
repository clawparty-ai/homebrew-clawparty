class Clawparty < Formula
  desc "Privacy-first, chat-native multi-agent platform"
  homepage "https://github.com/clawparty-ai/clawparty"
  url "https://github.com/clawparty-ai/clawparty.git", tag: "v0.3.2"
  version "0.3.2"

  depends_on "cmake" => :build
  depends_on "node" => :build

  def install
    system "./build.sh"

    bin.install "bin/ztm"
    bin.install_symlink "ztm" => "clawparty"
  end

  test do
    assert_match "ZTM", shell_output("#{bin}/clawparty version")
  end
end
