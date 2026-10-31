cask "akaisds" do
  arch arm: "arm", intel: "intel"

  version "1.4.2"
  sha256 arm:   "41a375c174b97c7fb493e2ad14ea04243d2a8b0f6be9bce0ab06b3500396dcec",
         intel: "e96572ba9b9f16033c4f49e791a33504a0e2d9c79264ceaec3f6dea19e3e65f7"

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
