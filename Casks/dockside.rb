cask "dockside" do
  version "0.2.1-beta"
  sha256 "3c0c0c336336f461842ab65c747c3e0a8c237c959934eea46eb8311f7499eda1"

  url "https://github.com/shreyansa98/Dockside/releases/download/v#{version}/Dockside-#{version}.dmg"
  name "Dockside"
  desc "Smart second dock with live widgets and Claude built in"
  homepage "https://github.com/shreyansa98/Dockside"

  livecheck do
    url "https://github.com/shreyansa98/Dockside.git"
    regex(/^v?(\d+(?:\.\d+)+(?:-beta)?)$/i)
  end

  depends_on macos: :sonoma

  app "Dockside.app"

  zap trash: [
    "~/Library/Application Support/Dockside",
    "~/Library/Preferences/app.dockside.mac.plist",
    "~/Music/Dockside Memos",
  ]

  caveats <<~EOS
    Dockside is in public beta and isn't notarized by Apple yet.
    If macOS says it can't verify Dockside on first launch, run:
      xattr -dr com.apple.quarantine #{appdir}/Dockside.app
  EOS
end
