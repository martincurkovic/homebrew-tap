cask "akaisds" do
  arch arm: "arm", intel: "intel"

  version "1.4.1"
  sha256 arm:   "6efe059cd3b70db350fa50bfa2ae0a3a778fcf9d8dbcf7779bacbe8214683a1c",
         intel: "0f542cfd15be3840ccf422a17eb683845d64f00d02099de9afc36997345c2faf"

  url "https://github.com/martincurkovic/AKAISDS/releases/download/v#{version}/AKAISDS-macos-#{arch}.dmg"
  name "AKAISDS"
  desc "MIDI Sample Dump Standard transfer tool and editor for Akai and generic SDS-compatible samplers"
  homepage "https://github.com/martincurkovic/AKAISDS"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "AKAISDS.app"

  caveats <<~EOS
    AKAISDS is not code-signed or notarized by Apple, since it's a free,
    single-maintainer open-source project. macOS Gatekeeper will block it on
    first launch. To open it:

      1. Try to launch AKAISDS from Applications (it will be blocked)
      2. Open System Settings > Privacy & Security
      3. Scroll down and click "Open Anyway" next to the AKAISDS message
      4. Confirm with your password or Touch ID

    Or skip the prompt by clearing macOS's quarantine flag from Terminal:

      xattr -dr com.apple.quarantine /Applications/AKAISDS.app

    See https://github.com/martincurkovic/AKAISDS#disclaimer for details.
  EOS
end
