cask "akaiutil-gui" do
  arch arm: "arm", intel: "intel"

  version "0.2.0"
  sha256 arm:   "dc300cebbea5c2a351d7eeeb888fca500a104aa7893039bd089381e794f2db88",
         intel: "82e5ee59339a010e5f5defbecb7d37602bf717e79ca13fd6d592aefad1ec4834"

  url "https://github.com/martincurkovic/akaiutil-gui/releases/download/v#{version}/akaiutil-GUI-macos-#{arch}.dmg"
  name "akaiutil-GUI"
  desc "GUI for browsing and editing Akai S900/S1000/S3000 sampler disk images"
  homepage "https://github.com/martincurkovic/akaiutil-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "akaiutil-GUI.app"

  caveats <<~EOS
    akaiutil-GUI is not code-signed or notarized by Apple, since it's a free,
    single-maintainer open-source project. macOS Gatekeeper will block it on
    first launch. To open it:

      1. Try to launch akaiutil-GUI from Applications (it will be blocked)
      2. Open System Settings > Privacy & Security
      3. Scroll down and click "Open Anyway" next to the akaiutil-GUI message
      4. Confirm with your password or Touch ID

    Or skip the prompt by clearing macOS's quarantine flag from Terminal:

      xattr -dr com.apple.quarantine /Applications/akaiutil-GUI.app

    It needs macOS 14.4 or newer.

    See https://github.com/martincurkovic/akaiutil-gui#download--installation for details.
  EOS
end
