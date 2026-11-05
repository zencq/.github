---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/library/). Edit it there; changes made in a consuming repository are overwritten. -->

# NuGet packages

- Each package has its own csproj, `README.md`, `CHANGELOG.md`, and `LICENSE` next to it, and its own test project. Every project is listed in the solution file.
- Keep package names and namespaces aligned with the repository's package naming pattern. Add new functionality to the most specific existing package; add a new package only when it does not fit an existing one.
- Packages depend on each other in one direction only; there must be no circular references.
- The package `README.md` is also the NuGet readme. It introduces the package, lists its namespaces with their main types and its external dependencies, and links to `docs/` for usage. Update it when a namespace or main type is added, removed, or renamed, or when a dependency changes.
- `docs/` is the usage guide of all packages: `docs/README.md` lists the pages and the behavior they share, and each page covers one topic with examples. Update the affected pages with public API or behavior changes. The package `README.md` links to it by absolute URL, since relative links don't work on NuGet.org.
- Shared package metadata (authors, copyright, license, repository URL, tags, symbol packages) lives in `Directory.Build.props`; per-package metadata (`Description`, `PackageReleaseNotes`), SourceLink, and the README/CHANGELOG packing live in each csproj. Preserve them unless the task says otherwise.
- Every dependency must be trim- and AOT-compatible.
- Always build with the latest GA .NET SDK. Don't add a `global.json` that pins the SDK; every CI job installs `dotnet-version: latest`, and a test matrix also installs the version it tests, for that version's runtime.
