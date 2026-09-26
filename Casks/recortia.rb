cask "recortia" do
  version "0.9.0-beta2"
  sha256 "0e8eff9d274861aefa5a4710eb00e7c04f84c675f28baa60dd02856907122043"

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
