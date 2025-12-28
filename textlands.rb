# Homebrew formula for TextLands CLI
# To use: brew tap MindFortressInc/textlands && brew install textlands

class Textlands < Formula
  desc "Play TextLands text adventures from your terminal"
  homepage "https://textlands.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-macos-arm64"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    end
    on_intel do
      url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-macos-x64"
      sha256 "PLACEHOLDER_SHA256_X64"
    end
  end

  on_linux do
    url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-linux-x64"
    sha256 "PLACEHOLDER_SHA256_LINUX"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "textlands-macos-arm64" => "textlands"
      else
        bin.install "textlands-macos-x64" => "textlands"
      end
    else
      bin.install "textlands-linux-x64" => "textlands"
    end
  end

  test do
    assert_match "TextLands CLI", shell_output("#{bin}/textlands version")
  end
end
