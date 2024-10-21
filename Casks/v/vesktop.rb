cask "vesktop" do
  version "1.5.3"
  sha256 "71e39434748e684a826f390ceb846d52ed1886bab8b5385c5d94c377e3ac1172"
  url "https://github.com/Vencord/Vesktop/releases/download/v#{version}/Vesktop-#{version}.dmg"
  name "Vesktop"
  desc "Discord web wrapper that comes with Vencord pre-installed"
  homepage "https://github.com/Vencord/Vesktop"

  app "Vesktop.app"

  auto_updates true
  depends_on macos: ">= :catalina"
  depends_on arch: [ :x86_64, :arm64 ]
  
  livecheck do
    url "https://github.com/Vencord/Vesktop.git"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  postflight do
    system_command '/usr/bin/xattr', args: ['-d', 'com.apple.quarantine', '/Applications/Vesktop.app']
  end

  zap trash: [
    "~/Library/Application Support/VencordDesktop",
    "~/Library/Preferences/dev.vencord.desktop.plist",
    "~/Library/Saved Application State/dev.vencord.desktop.savedState"
  ]
end
