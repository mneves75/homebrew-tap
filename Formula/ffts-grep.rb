# typed: false
# frozen_string_literal: true

# Copyright 2026 Marcus Neves
# SPDX-License-Identifier: Apache-2.0

class FftsGrep < Formula
  desc "Fast full-text search file indexer using SQLite FTS5"
  homepage "https://github.com/mneves75/ffts-grep"
  url "https://github.com/mneves75/ffts-grep/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "dc3de24fea3544fa566ab4fc483a5df5a6c266dc72c1c9371c297f31fce9a6ce"
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
