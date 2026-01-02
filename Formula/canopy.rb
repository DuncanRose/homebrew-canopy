# typed: false
# frozen_string_literal: true

# Canopy - Developer Tool Coordination Platform
# Unified platform for coordinating developer tools across machines
class Canopy < Formula
  desc "Developer Tool Coordination Platform"
  homepage "https://github.com/DuncanRose/canopy"
  url "https://github.com/DuncanRose/canopy/archive/refs/heads/main.zip"
  version "0.1.0"
  license "MIT"
  head "https://github.com/DuncanRose/canopy.git", branch: "main"

  # Cambium (AI governance) is included by default
  depends_on "cambium"
  
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    
    system "go", "build", "-ldflags", "-s -w", "-o", "canopy", "."
    bin.install "canopy"
  end

  test do
    assert_match "Developer Tool Coordination Layer", shell_output("#{bin}/canopy --help", 0)
  end

  def caveats
    <<~EOS
      Canopy is installed! Cambium (AI governance) is included.

      Get started:
      1. Create a policy file:
         mkdir -p .canopy
         curl -o .canopy/policy.yaml \\
           https://raw.githubusercontent.com/DuncanRose/cambium/main/templates/startup-balanced.yaml

      2. Start AI governance:
         cambium proxy start
         export OPENAI_BASE_URL="http://localhost:8080/v1"

      3. Install additional apps (optional):
         brew install xylem petiole

      See https://github.com/DuncanRose/canopy for full documentation.
    EOS
  end
end

