cask "dockside" do
  version "0.2.0-beta"
  sha256 "53c864d2e52d5ef5e000ee6de7b2381f2572eb48a5bddbf50524bb2304867476"

  url "https://github.com/shreyansa98/Dockside/releases/download/v#{version}/Dockside-#{version}.dmg"
  name "Dockside"
  desc "Smart second dock with live widgets and Claude built in"
  homepage "https://github.com/shreyansa98/Dockside"

  livecheck do
    url "https://github.com/shreyansa98/Dockside.git"
    regex(/^v?(\d+(?:\.\d+)+(?:-beta)?)$/i)
  end

  depends_on macos: ">= :sonoma"

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
