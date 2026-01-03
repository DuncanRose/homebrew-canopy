# typed: false
# frozen_string_literal: true

# Cambium - AI Governance Runtime
# Prevents AI cost overruns with local proxy and policy enforcement
class Cambium < Formula
  desc "AI Governance Runtime - Prevent AI cost overruns"
  homepage "https://github.com/DuncanRose/cambium"
  url "https://github.com/DuncanRose/cambium/archive/refs/heads/main.zip"
  version "0.1.0"
  license "MIT"
  head "https://github.com/DuncanRose/cambium.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    
    system "go", "build", "-ldflags", "-s -w", "-o", "cambium", "."
    bin.install "cambium"
  end

  test do
    assert_match "Policy Evolution & Governance Runtime", shell_output("#{bin}/cambium --help", 0)
  end

  def caveats
    <<~EOS
      Cambium is installed! 

      🚀 Quick Start (Zero-Touch Teams Setup):
        cambium setup --teams

      This will:
        • Check/activate Team Edition license
        • Collect all API keys interactively
        • Configure virtual engineering team
        • Generate complete policy
        • Verify everything works
        • Auto-configure Cursor/VS Code

      📚 Other Setup Options:
        cambium setup --wizard    # Interactive setup (free tier)
        cambium setup --free-tier # Free tier only
        cambium setup --cursor    # Cursor IDE specific

      📖 Documentation: https://github.com/DuncanRose/cambium
    EOS
  end
end
