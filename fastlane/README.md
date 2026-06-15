fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios screenshots

```sh
[bundle exec] fastlane ios screenshots
```

Capture App Store screenshots for all devices and locales, then frame them

### ios deploy

```sh
[bundle exec] fastlane ios deploy
```

Build and deploy to TestFlight

----


## Android

### android screenshots

```sh
[bundle exec] fastlane android screenshots
```

Capture Play Store screenshots for phone and tablet, then frame them

### android deploy

```sh
[bundle exec] fastlane android deploy
```

Build and deploy to Play Store internal track

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
