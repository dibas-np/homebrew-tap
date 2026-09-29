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

  # The app is sandboxed, so its defaults and caches live inside the container
  # rather than in ~/Library/Preferences. The container is the whole footprint:
  # `SMAppService.mainApp` registers the login item through the system, which
  # this directory owns, so removing it also drops the login item.
  zap trash: "~/Library/Containers/com.dibas.NepalKit.NepalKit"
end
