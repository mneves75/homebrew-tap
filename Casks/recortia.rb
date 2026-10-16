cask "recortia" do
  version "0.12.2-beta1"
  sha256 "8b28f6df380c62dbe955a46184008f1fb1354dd6036c06721218aaacbbb4a942"

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
