source "https://rubygems.org"

gem "fastlane", ">= 2.220.0"
gem "cocoapods"

# Pin activesupport to a patched version to avoid CVE-2023-22796
# (ReDoS in String#underscore). Transitive dependency of fastlane.
gem "activesupport", ">= 6.1.7.5"
