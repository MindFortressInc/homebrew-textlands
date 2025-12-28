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
      sha256 "e95543ccc125004b0e56a66caa70b3a70a1965bf795d4e666fa4815f602e6d22"
    end
    on_intel do
      url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-macos-x64"
      sha256 "a2294d415c4ab1dfa6fd34443b6a2953382c2d12b5c5b1cbb52bb86229b6c0d2"
    end
  end

  on_linux do
    url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-linux-x64"
    sha256 "2d4b9663c26d312c27b13c3285dc0d6b3875a3d871e65eafb0a1c0a4ec1aa482"
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
