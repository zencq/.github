---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/library/). Edit it there; changes made in a consuming repository are overwritten. -->

# Releases

- Releases are automated with release-please, which keeps a release PR open with the next version and changelog. Each package has an entry, keyed by its path, in `release-please-config.json` and `.release-please-manifest.json`; a new package needs both.
- Release-please assigns a commit to a package by the files it changes under the package path, not by its scope. Only `feat`, `fix`, `perf`, `revert`, and `deps` commits, and breaking changes (`!`) of any type, create a release. Pre-1.0 rules apply: `feat` bumps the patch version.
- Release-please updates each package's version and its `CHANGELOG.md`, so don't edit them by hand.
