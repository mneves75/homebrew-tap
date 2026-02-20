# typed: false
# frozen_string_literal: true

# Copyright 2026 Marcus Neves
# SPDX-License-Identifier: Apache-2.0

class Healthsync < Formula
  desc "Secure sync of Apple HealthKit data between iPhone and Mac"
  homepage "https://github.com/mneves75/ai-health-sync-ios"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.1/healthsync-1.0.1-macos-arm64.tar.gz"
      sha256 "336c6738d034ed8b0b0fedb56881c77f6eee6337b2dbc983639c6623febc8cb7"
    end
    on_intel do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.1/healthsync-1.0.1-macos-x86_64.tar.gz"
      sha256 "07a0a74205b688c95657276f6306fa923c45e598236f7ae8a98f3ea7b251144a"
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
