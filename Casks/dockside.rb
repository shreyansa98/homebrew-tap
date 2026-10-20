cask "dockside" do
  version "0.2.2-beta"
  sha256 "ed336a61a05151e3bf816d4d9d9313fa26adb567a2796ef7ecc44d80b6246a29"

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
