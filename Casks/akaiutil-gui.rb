cask "akaiutil-gui" do
  arch arm: "arm", intel: "intel"

  version "0.3.0"
  sha256 arm:   "a0179d2fc70c12cc60abdfc8b2ae2e28f59839cb98f38815ca9344f06e50ffc3",
         intel: "0e81b9855d6f4f8a1dd51fc27cb437ecbfacbc4aa1935b78b0659d60b2448adc"

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
