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
      sha256 "4f435d3b3a7db0d0949cfb04246a2e39ac7cdf6c0ac48ac2bc2fdd5fb26850a8"
    end
    on_intel do
      url "https://github.com/mneves75/ai-health-sync-ios/releases/download/v1.0.0/healthsync-1.0.0-macos-x86_64.tar.gz"
      sha256 "27e1194b833a5b388eac506b854366ab3030ce5370c955202cf2537ad3df468c"
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
