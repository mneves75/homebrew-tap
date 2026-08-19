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
      sha256 "7aed2c68617231ef835e538e0c8479e7a29fd2d67c20c8e236157b9b0082367a"
    end
    on_intel do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.0/healthsync-1.0.0-macos-x86_64.tar.gz"
      sha256 "986c20817aa5b251d7b8660e259b70058a2c0ec7f3e15f973d6c17888c7183c8"
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
