cask "akaisds" do
  arch arm: "arm", intel: "intel"

  version "1.3.0"
  sha256 arm:   "658038f772f6b2a3e0469ead9a4cb47f15f2e1e7883ed181fa3211c54b3adabc",
         intel: "d7f2b175d2592f8adff941250c7a35304c7e41b8ab916f6b81d69d613b4f0c92"

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
