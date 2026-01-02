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
      Cambium is installed! Get started:

      1. Create a policy file:
         mkdir -p .canopy
         curl -o .canopy/policy.yaml \\
           https://raw.githubusercontent.com/DuncanRose/cambium/main/templates/startup-balanced.yaml

      2. Start the proxy:
         cambium proxy start

      3. Configure your tools:
         export OPENAI_BASE_URL="http://localhost:8080/v1"

      Cambium is part of the Canopy ecosystem.
      See https://github.com/DuncanRose/cambium for full documentation.
    EOS
  end
end
