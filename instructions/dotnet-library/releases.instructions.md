---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/dotnet-library/). Edit it there; changes made in a consuming repository are overwritten. -->

# NuGet releases

- The version release-please updates is `<Version>` in each library csproj.
- Merging the release PR creates the GitHub release; the same workflow run tests the solution on all target frameworks, then packs each released package, attaches it to its release, and pushes it to GitHub Packages and, if it is meant for NuGet.org, there too. If the tests fail, the GitHub release exists without packages: fix `main` and attach the packages by rerunning the failed jobs.
- Every package goes to GitHub Packages (`nuget.pkg.github.com/zencq`), without symbols, since GitHub Packages has no symbol server. A package goes to NuGet.org as well, with its symbols, only if its csproj sets `<PublishToNuGet>true</PublishToNuGet>`. Set it only once the repository is public, and only for the packages meant for everyone; a repository may keep others on GitHub Packages only. A NuGet.org upload can't be undone, only unlisted.
- After a release, move the entries of each released package's `PublicAPI.Unshipped.txt` into its `PublicAPI.Shipped.txt`, keeping `#nullable enable` at the top of both, so the next release starts with an empty unshipped list. A `*REMOVED*` entry instead deletes the line it names from `PublicAPI.Shipped.txt`.
