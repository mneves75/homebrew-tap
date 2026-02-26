# typed: false
# frozen_string_literal: true

# Copyright 2026 Marcus Neves
# SPDX-License-Identifier: Apache-2.0

class Healthsync < Formula
  desc "Secure sync of Apple HealthKit data between iPhone and Mac"
  homepage "https://github.com/mneves75/ai-health-sync-ios"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.0/healthsync-1.0.0-macos-arm64.tar.gz"
      sha256 "7340a71710cca698cfa090bed3c3314ddae4eea69a496080f0790e2a87f788a6"
    end
    on_intel do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.0/healthsync-1.0.0-macos-x86_64.tar.gz"
      sha256 "9fff32cf2583942cbd341230d14b6140a787c0358d524714251c7c1c43d3abaa"
    end
  end

  depends_on macos: :sequoia

  def install
    bin.install "healthsync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/healthsync --version")
  end
end
