source "https://rubygems.org"

gem "fastlane", ">= 2.220.0"
gem "cocoapods"

# Pin activesupport to a patched version to avoid CVE-2023-22796 and
# CVE-2023-38037. Constrained to < 8.0 because CocoaPods 1.x requires
# activesupport < 8; upgrading past 7.x breaks `pod install`.
gem "activesupport", ">= 6.1.7.5", "< 8.0"
