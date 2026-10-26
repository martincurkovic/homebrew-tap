cask "jv-studio" do
  arch arm: "arm", intel: "intel"

  version "0.1.0"
  sha256 arm:   "ab9d33511001ed3136a1a9e24b45107c788f1ba1908e10b8aaf2248d57386e01",
         intel: "7bdd6bffebd88cc5a39533a9db1eef02fe3d1d2c5dd93f0260a7f090f55bef7b"

  url "https://github.com/martincurkovic/jv-studio/releases/download/v#{version}/JV-Studio-macos-#{arch}.dmg"
  name "JV Studio"
  desc "Editor and librarian for the Roland JV-1010 sound module"
  homepage "https://github.com/martincurkovic/jv-studio"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "JV-Studio.app"

  caveats <<~EOS
    JV Studio is not code-signed or notarized by Apple, since it's a free,
    single-maintainer open-source project. macOS Gatekeeper will block it on
    first launch. To open it:

      1. Try to launch JV-Studio from Applications (it will be blocked)
      2. Open System Settings > Privacy & Security
      3. Scroll down and click "Open Anyway" next to the JV-Studio message
      4. Confirm with your password or Touch ID

    Or skip the prompt by clearing macOS's quarantine flag from Terminal:

      xattr -dr com.apple.quarantine /Applications/JV-Studio.app

    It needs macOS 14 or newer, and a MIDI interface cabled to the JV-1010.

    See https://github.com/martincurkovic/jv-studio#download--installation for details.
  EOS
end
