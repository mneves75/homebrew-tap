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
      sha256 "c1a660b89bf784ef52ca8b8c7ae3c1b1f004e16397eb91194d6f85efcd163b83"
    end
    on_intel do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.0/healthsync-1.0.0-macos-x86_64.tar.gz"
      sha256 "61b6b81e4666ca572a2c626be55c7680421aa5f61aa85d53865323f52e566938"
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
