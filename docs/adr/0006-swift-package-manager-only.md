# 6. Swift Package Manager only, no CocoaPods

- Status: accepted
- Date: 2026-10-24 (decided 2026-06-15)

## Context
Flutter supports Swift Package Manager (SPM) for iOS and macOS plugins as an alternative to CocoaPods. A single CocoaPods-only
plugin brings back a Podfile, a `Pods` project and a second dependency manager to build, cache and keep secure in CI.

## Decision
iOS and macOS use SPM exclusively; the CocoaPods integration was removed in June 2026. Before adding a Flutter package, check that its
`ios/` or `darwin/` directory has a `Package.swift`. A package that ships only a `.podspec` is not used: find an SPM-capable
alternative or implement the feature natively. Known CocoaPods-only packages to avoid: `alarm`, `flutter_fgbg`.

## Consequences
- A shorter, faster iOS build and one dependency manager.
- The choice of plugins is narrower; some features need a native implementation.
