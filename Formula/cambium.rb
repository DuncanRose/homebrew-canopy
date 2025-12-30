# typed: false
# frozen_string_literal: true

# This file was generated from Homebrew's tap generator
class Cambium < Formula
  desc "Reserved under Canopy ecosystem - pre-release / internal"
  homepage "https://github.com/DuncanRose"
  version "0.0.0-pre"
  license "MIT"

  on_macos do
    # Stub formula - pre-release / internal
  end

  def install
    # Install placeholder binary that prints reservation message
    (bin/"cambium").write <<~SHELL
      #!/bin/bash
      echo "cambium: Reserved under the Canopy ecosystem." >&2
      echo "This tool is not yet released publicly." >&2
      exit 1
    SHELL
    chmod 0755, bin/"cambium"
  end

  test do
    assert_match "reserved under the Canopy ecosystem", shell_output("#{bin}/cambium 2>&1", 1)
  end

  def caveats
    <<~EOS
      cambium: Reserved under the Canopy ecosystem.
      This tool is not yet released publicly.
    EOS
  end
end

