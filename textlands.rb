# Homebrew formula for TextLands CLI
# To use: brew tap MindFortressInc/textlands && brew install textlands

class Textlands < Formula
  desc "Play TextLands text adventures from your terminal"
  homepage "https://textlands.com"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-macos-arm64"
      sha256 "f48c8127bfc9acfced523328931c557e927f6f85493e7bee50c953850ceaaecb"
    end
    on_intel do
      url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-macos-x64"
      sha256 "31221f4f684037c6fce458ad6b2240546542245bcbe839c0e42798dc1837f251"
    end
  end

  on_linux do
    url "https://github.com/MindFortressInc/textlands-cli/releases/download/v#{version}/textlands-linux-x64"
    sha256 "aa10d6dd90af5f93282bd7515b23aa279525437802830e6b3f36d416fd1f62bb"
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
