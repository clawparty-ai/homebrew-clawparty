class Clawparty < Formula
  desc "Privacy-first, chat-native multi-agent platform"
  homepage "https://github.com/clawparty-ai/clawparty"
  url "https://github.com/clawparty-ai/clawparty.git", branch: "main"
  version "0.0.0"

  depends_on "cmake" => :build

  def install
    system "git", "submodule", "update", "--init", "--recursive"
    system "./build/deps.sh"
    system "./build/pipy.sh"

    bin.install "bin/ztm" => "clawparty"
    bin.install_symlink "clawparty" => "ztm"
  end

  test do
    assert_match "ZTM", shell_output("#{bin}/clawparty version")
  end
end
