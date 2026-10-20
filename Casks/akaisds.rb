cask "akaisds" do
  arch arm: "arm", intel: "intel"

  version "1.4.0"
  sha256 arm:   "66cc2c39a3418f3069ad65d6614d05d48197dc18f75cdc0d735b7629ea64d52c",
         intel: "0665abf001238dfc410882cf5122fd3c1dd045411ee55f839f17a6dbe6bfe264"

  url "https://github.com/martincurkovic/AKAISDS/releases/download/v#{version}/AKAISDS-macos-#{arch}.dmg"
  name "AKAISDS"
  desc "MIDI Sample Dump Standard transfer tool and editor for Akai and generic SDS-compatible samplers"
  homepage "https://github.com/martincurkovic/AKAISDS"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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
