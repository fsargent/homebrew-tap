# fsargent/homebrew-tap

Homebrew casks by Felix Sargent.

## TypeMouse

[TypeMouse](https://github.com/fsargent/typemouse) lets you click and switch windows on macOS with only the keyboard.

```sh
brew tap fsargent/tap
brew trust --tap fsargent/tap
brew install --cask typemouse
```

Homebrew loads casks from other taps only after you trust the tap. `brew trust` records that choice.

After you install it, grant Accessibility permission in System Settings > Privacy & Security > Accessibility.

Release builds have an ad-hoc signature, not an Apple Developer ID.
After each upgrade, macOS sees a new app. Remove TypeMouse from the Accessibility list, then turn it on again.

## Updates

Each TypeMouse release updates the version and checksum in `Casks/typemouse.rb`.
The TypeMouse release workflow pushes the change with a deploy key that can write only to this repo.

If that step fails, run the `Update TypeMouse` workflow by hand:
`gh workflow run update-typemouse.yml --repo fsargent/homebrew-tap`
