---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/dotnet-library/). Edit it there; changes made in a consuming repository are overwritten. -->

# NuGet releases

- The version release-please updates is `<Version>` in each library csproj.
- Merging the release PR creates the GitHub release; the same workflow run tests the solution on all target frameworks, then packs each released package, attaches it to its release, and pushes it to NuGet.org. If the tests fail, the GitHub release exists without packages: fix `main` and attach the packages by rerunning the failed jobs.
- After a release, move the entries of each released package's `PublicAPI.Unshipped.txt` into its `PublicAPI.Shipped.txt`, keeping `#nullable enable` at the top of both, so the next release starts with an empty unshipped list. A `*REMOVED*` entry instead deletes the line it names from `PublicAPI.Shipped.txt`.
