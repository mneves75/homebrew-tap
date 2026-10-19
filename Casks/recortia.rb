cask "recortia" do
  version "0.12.4"
  sha256 "c36ea76bc3e7ad83acb1074d79c2101cedf611a5e450b8f6d8315cd11b5c8710"

  url "https://github.com/mneves75/recortia/releases/download/v#{version}/Recortia-#{version}.dmg"
  name "Recortia"
  desc "Local-first screenshot tool with secure redaction and on-device OCR"
  homepage "https://github.com/mneves75/recortia"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-beta\d+)?)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Recortia.app"

  uninstall quit: "dev.mvneves.Recortia"

  zap trash: "~/Library/Preferences/dev.mvneves.Recortia.plist"
end
