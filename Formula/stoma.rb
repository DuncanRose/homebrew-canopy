# typed: false
# frozen_string_literal: true

# This file was generated from Homebrew's tap generator
class Stoma < Formula
  desc "AI Execution Governor Runtime - Reserved under Canopy ecosystem"
  homepage "https://github.com/DuncanRose/stoma"
  version "0.0.0-pre"
  license "MIT"

  on_macos do
    # Stub formula - pre-release / internal
  end

  def install
    # Install placeholder binary that prints reservation message
    (bin/"stoma").write <<~SHELL
      #!/bin/bash
      echo "stoma: Reserved under the Canopy ecosystem." >&2
      echo "This tool is not yet released publicly." >&2
      exit 1
    SHELL
    chmod 0755, bin/"stoma"
  end

  test do
    assert_match "reserved under the Canopy ecosystem", shell_output("#{bin}/stoma 2>&1", 1)
  end

  def caveats
    <<~EOS
      stoma: Reserved under the Canopy ecosystem.
      This tool is not yet released publicly.
    EOS
  end
end
