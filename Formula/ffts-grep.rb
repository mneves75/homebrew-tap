# typed: false
# frozen_string_literal: true

# Copyright 2026 Marcus Neves
# SPDX-License-Identifier: Apache-2.0

class FftsGrep < Formula
  desc "Fast full-text search file indexer using SQLite FTS5"
  homepage "https://github.com/mneves75/ffts-grep"
  url "https://github.com/mneves75/ffts-grep/archive/refs/tags/v0.11.4.tar.gz"
  sha256 "45fe605521699ddc51299b188fe29fb1d883eefd3d17c7b83aec729b0e506d8d"
  license "Apache-2.0"
  head "https://github.com/mneves75/ffts-grep.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    cd "rust-fts5-indexer" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    # Test version output
    assert_match "ffts-grep", shell_output("#{bin}/ffts-grep --version")

    # Test actual search functionality
    (testpath/"hello.txt").write("Hello World from ffts-grep test!")
    system bin/"ffts-grep", "init", "--project-dir", testpath
    output = shell_output("#{bin}/ffts-grep search --project-dir #{testpath} Hello")
    assert_match "hello.txt", output
  end
end
