cask "nepalkit" do
  version "1.2"
  sha256 "9c8a96ef33b3aca4978e30e244121fa15db16f41a19fd936b0aabde542123c4c"

  url "https://github.com/dibas-np/NepalKit/releases/download/#{version}/NepalKit.dmg"
  name "NepalKit"
  desc "Bikram Sambat date and Nepal Time in the menu bar"
  homepage "https://github.com/dibas-np/NepalKit"

  # NepalKit updates itself through Sparkle, which writes to /Applications — the
  # same place this cask does. Declaring it here stops `brew upgrade` from
  # reinstalling over an app Sparkle has already moved forward, which would leave
  # the installed app disagreeing with the version this cask records.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "NepalKit.app"

  # `brew generate-zap` reports these two and nothing else. The app is sandboxed,
  # so its preferences and caches live inside the container rather than in
  # ~/Library/Preferences; the sibling directory is the group's container, which
  # is where a group-scoped default would land. `SMAppService.mainApp` registers
  # the login item through the system, which the app container owns, so removing
  # it drops the login item too.
  #
  # Diagnostic reports and test-harness preferences are deliberately absent: the
  # reports are crash logs macOS and the user may want to keep, and the
  # preferences belong to the checkout rather than to the installed app.
  #
  # macOS denies a terminal access to `~/Library/Containers/*/Data` without Full
  # Disk Access, so `uninstall --zap` can report that these could not be trashed.
  # That is the OS refusing, not this stanza failing; it happens for any
  # sandboxed app.
  zap trash: [
    "~/Library/Application Scripts/com.dibas.NepalKit*",
    "~/Library/Containers/com.dibas.NepalKit*",
  ]
end
