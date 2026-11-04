---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/dotnet/). Edit it there; changes made in a consuming repository are overwritten. -->

# Target frameworks and SDK

- Support every .NET release, LTS and STS alike, until one year after its [official end of support](https://dotnet.microsoft.com/platform/support/policy/dotnet-core). Add a new release as soon as it is GA.
- Target frameworks are set once in `Directory.Build.props` and apply to every project, tests included. Each repository lists the current target frameworks and the places to update with them in its own instructions.
- APIs newer than the oldest target framework need a fallback for the older targets.
- Always build with the latest GA .NET SDK. There is no `global.json` that pins the SDK, and every CI job installs `dotnet-version: latest`; a test matrix also installs the version it tests, for that version's runtime.
