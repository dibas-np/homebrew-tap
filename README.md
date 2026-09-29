# homebrew-tap

Homebrew cask for [NepalKit](https://github.com/dibas-np/NepalKit), the macOS
menu-bar utility for Bikram Sambat dates and Nepal Time.

## Install

```
brew install --cask dibas-np/tap/nepalkit
```

Use that fully qualified form rather than `brew tap` followed by
`brew install nepalkit`. Since Homebrew 6.0.0 a non-official tap is not trusted
by default, and only the fully qualified name grants trust to the one cask being
installed. The two-step form fails unless the cask is trusted first:

```
brew trust --cask dibas-np/tap/nepalkit
```

NepalKit requires macOS 26 or later on Apple Silicon. It updates itself through
Sparkle, so `brew upgrade` will not move it forward — that is declared with
`auto_updates true` rather than left to fight the two installers over
`/Applications`.

To remove it, including the login item and all settings:

```
brew uninstall --zap nepalkit
```

macOS protects the contents of `~/Library/Containers` from any terminal without
Full Disk Access, so the zap step may report that two container directories
could not be trashed. That is the OS refusing, not Homebrew failing: the same
happens for any sandboxed app. Run the uninstall from a terminal with Full Disk
Access to remove them, or delete them from Finder.

## About the version in this cask

The version tracks the GitHub release tag, and the cask is updated by hand after
each release. NepalKit's own release notes are at
[the releases page](https://github.com/dibas-np/NepalKit/releases).
