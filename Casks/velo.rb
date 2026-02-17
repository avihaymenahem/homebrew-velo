cask "velo" do
  version "0.3.12"
  sha256 "6a5649588852eaf4cb79691b9e23d9d46940b1d7ed7623711b7a6cdd5e5ddaa4"

  url "https://github.com/avihaymenahem/velo/releases/download/v#{version}/Velo_#{version}_universal.dmg",
      verified: "github.com/avihaymenahem/velo/"

  name "Velo"
  desc "Fast, beautiful desktop email client"
  homepage "https://github.com/avihaymenahem/velo"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :high_sierra"

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
