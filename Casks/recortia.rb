cask "recortia" do
  version "0.9.0-beta4"
  sha256 "8dd90dc83dca64f3b7a2627daa595df0f7b5b149f5522de3f943be2a17b48c07"

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
