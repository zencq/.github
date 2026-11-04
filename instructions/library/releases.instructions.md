---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/library/). Edit it there; changes made in a consuming repository are overwritten. -->

# Releases

- Releases are automated with release-please, which keeps a release PR open with the next version and changelog. Each package has an entry, keyed by its path, in `release-please-config.json` and `.release-please-manifest.json`; a new package needs both.
- Release-please assigns a commit to a package by the files it changes under the package path, not by its scope. Only `feat`, `fix`, `perf`, `revert`, and `deps` commits, and breaking changes (`!`) of any type, create a release. Pre-1.0 rules apply: `feat` bumps the patch version.
- Release-please updates `<Version>` in each library csproj and its `CHANGELOG.md`, so don't edit them by hand.
- Merging the release PR creates the GitHub release; the same workflow run tests the solution on all target frameworks, then packs each released package, attaches it to its release, and pushes it to NuGet.org. If the tests fail, the GitHub release exists without packages: fix `main` and attach the packages by rerunning the failed jobs.
- After a release, move the entries of each released package's `PublicAPI.Unshipped.txt` into its `PublicAPI.Shipped.txt`, keeping `#nullable enable` at the top of both, so the next release starts with an empty unshipped list. A `*REMOVED*` entry instead deletes the line it names from `PublicAPI.Shipped.txt`.
