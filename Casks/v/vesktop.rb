cask "vesktop" do
  version "0.4.4"
  sha256 on_arch_conditional arm: "c9f772bd5f2a6d04290c86850c0bd0984904ccb9fbc1998fac04b737aabbe9d5",
    intel: "0c14ef9a6681093fa58f6ee8aa9432f3395602870bee2251af8497481b782575",
    x86_64: "0c14ef9a6681093fa58f6ee8aa9432f3395602870bee2251af8497481b782575"

  url on_arch_conditional arm: "https://github.com/Vencord/Vesktop/releases/download/v#{version}/Vesktop-#{version}-arm64.dmg",
    intel: "https://github.com/Vencord/Vesktop/releases/download/v#{version}/Vesktop-#{version}.dmg",
    x86_64: "https://github.com/Vencord/Vesktop/releases/download/v#{version}/Vesktop-#{version}.dmg"
  
  name "Vesktop"
  desc "Discord web wrapper that comes with Vencord pre-installed"
  homepage "https://github.com/Vencord/Vesktop"

  app "Vesktop.app"

  auto_updates true
  depends_on macos: ">= 10.15"
  depends_on arch: [:intel :x86_64 :arm64 ]
  
  livecheck do
    url "https://github.com/Vencord/Vesktop.git"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  zap :trash: [
    "~/Library/Application Support/VencordDesktop",
    "~/Library/Preferences/dev.vencord.desktop.plist",
    "~/Library/Saved Application State/dev.vencord.desktop.savedState"
  ]
  
  caveats <<~EOS
    To take Vesktop out of quarantine and run it, execute the following command:
      xattr -d com.apple.quarantine /Applications/Vesktop.app
  EOS
end
