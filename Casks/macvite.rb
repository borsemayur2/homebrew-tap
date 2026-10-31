cask "macvite" do
  version "1.0.0"
  sha256 "2d64c0a5ed4fbcc964c28b31c179c42b7429991c84810a817fbabf05f555e7e7"

  url "https://macvite.app/MacVite-#{version}.dmg"
  name "MacVite"
  desc "Lightning-fast Dock app switcher using Option + 1..9"
  homepage "https://macvite.app/"

  livecheck do
    url "https://macvite.app/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MacVite.app"
  binary "#{appdir}/MacVite.app/Contents/MacOS/MacVite", target: "macvite"

  uninstall quit: "app.macvite.MacVite"

  zap trash: [
    "~/Library/Application Support/MacVite",
    "~/Library/Logs/MacVite.log",
    "~/Library/Preferences/app.macvite.MacVite.plist",
  ]
end
