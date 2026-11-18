# fsargent/homebrew-tap

Homebrew casks by Felix Sargent.

## TypeMouse

[TypeMouse](https://github.com/fsargent/typemouse) lets you click and switch windows on macOS with only the keyboard.

```sh
brew install --cask fsargent/tap/typemouse
```

After you install it, grant Accessibility permission in System Settings > Privacy & Security > Accessibility.

Release builds have an ad-hoc signature, not an Apple Developer ID.
After each upgrade, macOS sees a new app. Remove TypeMouse from the Accessibility list, then turn it on again.

## Updates

The `Update TypeMouse` workflow checks for a new TypeMouse release every 6 hours.
When it finds one, it updates the version and checksum in `Casks/typemouse.rb`.
