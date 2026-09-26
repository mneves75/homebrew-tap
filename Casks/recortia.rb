cask "recortia" do
  version "0.9.0-beta3"
  sha256 "62bb78e0371a1b07c8285d5aa53dca256a0368ea77113d8a0e2be2a0f3647749"

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
