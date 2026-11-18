cask "typemouse" do
  version "0.1.0"
  sha256 "726b1fa71aa91de937efe7df60e62c2c4904eb590c732890f906abce01c1a99e"

  url "https://github.com/fsargent/typemouse/releases/download/v#{version}/TypeMouse-#{version}.zip"
  name "TypeMouse"
  desc "Keyboard clicking and window switching"
  homepage "https://github.com/fsargent/typemouse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "TypeMouse.app"

  # Release builds have an ad-hoc signature, not a Developer ID, so Gatekeeper would block the
  # first launch. Remove the download quarantine instead.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/TypeMouse.app"],
        writable_paths: ["TypeMouse.app"],
        writable_base:  :appdir
  end

  # Quitting TypeMouse also removes its Caps Lock remap, if that setting is on.
  uninstall quit: "dev.fsargent.typemouse"

  zap trash: [
    "~/.config/typemouse",
    "~/Library/Logs/TypeMouse",
    "~/Library/Preferences/dev.fsargent.typemouse.plist",
  ]

  caveats <<~EOS
    TypeMouse needs Accessibility permission:
      System Settings > Privacy & Security > Accessibility

    Release builds have an ad-hoc signature. After each upgrade, macOS sees a new app.
    Remove TypeMouse from the Accessibility list, then turn it on again.
  EOS
end
