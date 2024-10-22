cask "swiftguard" do
  version "0.0.2"
  sha256 "0c52d08e5bb899bef4325bb9d47127d41b57f58e0d80c1f2fbb2adc78e449978"
  url "https://github.com/Lennolium/swiftGuard/releases/download/v#{version}/swiftGuard.dmg"
  name "swiftGuard"
  desc "Anti-forensic macOS tray application designed to safeguard your system by monitoring USB ports."
  homepage "https://github.com/Lennolium/swiftGuard"

  app "swiftGuard.app"

  auto_updates true
  depends_on macos: ">= :el_capitan"
  depends_on arch: [ :x86_64, :arm64 ]
  
  livecheck do
    url "https://github.com/Lennolium/swiftGuard.git"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  postflight do
    system_command '/usr/bin/xattr', args: ['-d', 'com.apple.quarantine', '/Applications/swiftGuard.app']
  end

  zap trash: [
    "~/Library/Preferences/swiftguard",
    "~/Library/LaunchAgents/dev.lennolium.swiftguard.plist",
    "~/Library/Integrity/swiftguard/RELEASE_KEY.asc",
    "~/Library/Logs/swiftguard/swiftguard.log"
  ]
end
