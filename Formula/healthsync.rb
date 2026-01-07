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
      sha256 "c0beae47d0e7b6d4d8191abebd1db222b5cf5787ce0e1c712955dcabbaa5dedf"
    end
    on_intel do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.0/healthsync-1.0.0-macos-x86_64.tar.gz"
      sha256 "fdd0b4861199ac2e05d226af598e60d1b3694694f806591e5b206537420fb9f0"
    end
  end

  depends_on macos: :sequoia

  def install
    bin.install "healthsync"
  end

  test do
    assert_match "healthsync", shell_output("#{bin}/healthsync --help")
  end
end
