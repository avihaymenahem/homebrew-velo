cask "velo" do
  version "0.4.7"
  sha256 "558d5507d0d744e16f92bfcd31823d4ce832f5dff5642b7503bbdab97f9eb821"

  url "https://github.com/avihaymenahem/velo/releases/download/v#{version}/Velo_#{version}_universal.dmg",
      verified: "github.com/avihaymenahem/velo/"

  name "Velo"
  desc "Fast, beautiful desktop email client"
  homepage "https://github.com/avihaymenahem/velo"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Velo.app"

  caveats <<~EOS
    If the app is not notarized, macOS may block it on first launch.
    To allow it, right-click Velo.app and select "Open", or run:
      xattr -cr /Applications/Velo.app
  EOS

  zap trash: [
    "~/Library/Application Support/com.velomail.app",
    "~/Library/Caches/com.velomail.app",
    "~/Library/Preferences/com.velomail.app.plist",
    "~/Library/Saved Application State/com.velomail.app.savedState",
    "~/Library/WebKit/com.velomail.app",
  ]
end
