# typed: false
# frozen_string_literal: true

# Copyright 2026 Marcus Neves
# SPDX-License-Identifier: Apache-2.0

class CfToolkit < Formula
  desc "Multi-account Cloudflare Wrangler with locks against wrong-account deploys"
  homepage "https://github.com/mneves75/cf-toolkit"
  url "https://github.com/mneves75/cf-toolkit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9091f4cb763262a5845e7cfc0f0443c305ac978cd215838298c81d4c3ce6a88b"
  license "Apache-2.0"

  depends_on :macos # tokens live in the macOS login Keychain via the `security` CLI
  depends_on "node" # cf-* scripts use node to parse JSONC configs and API responses

  def install
    bin.install "cf-register-account", "cf-init-project", "cf-guard", "cf-toolkit"
  end

  def caveats
    <<~EOS
      cf-toolkit's auto-load-on-cd flow needs direnv:
        brew install direnv
        echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc && exec zsh

      Then, per account and per project:
        cf-toolkit register-account <label>
        cf-toolkit init-project <label> <account-id>   # run inside the project
    EOS
  end

  test do
    assert_match "cf-toolkit 1.0.0", shell_output("#{bin}/cf-toolkit version")
    output = shell_output("#{bin}/cf-toolkit init-project 'bad;rm' deadbeef 2>&1", 2)
    assert_match "account-label must match", output
  end
end
