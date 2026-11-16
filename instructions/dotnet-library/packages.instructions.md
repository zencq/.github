---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/dotnet-library/). Edit it there; changes made in a consuming repository are overwritten. -->

# NuGet packages

- Each package has its own csproj and test project, and every project is listed in the solution file.
- Shared package metadata (authors, copyright, license, repository URL, tags, symbol packages) lives in `Directory.Build.props`; per-package metadata (`Description`, `PackageReleaseNotes`), SourceLink, and the README/CHANGELOG packing live in each csproj. Preserve them unless the task says otherwise.
- Every dependency must be trim- and AOT-compatible.
- Always build with the latest GA .NET SDK. Don't add a `global.json` that pins the SDK; every CI job installs `dotnet-version: latest`, and a test matrix also installs the version it tests, for that version's runtime.
