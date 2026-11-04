---
applyTo: "**/*.cs,**/PublicAPI.*.txt"
---

<!-- Synced from zencq/.github (instructions/library/). Edit it there; changes made in a consuming repository are overwritten. -->

# Public API

## Compatibility

- Avoid unnecessary public API churn, and keep binary and source compatibility in mind for package consumers.
- Add public API only for a current need of the `Zenin` framework or its consumers; every public member is a compatibility commitment. Keep everything else `internal` or `private`.

## Documentation

- Public APIs have XML documentation, which is packed with each library (`GenerateDocumentationFile`). A missing comment (CS1591) fails the build. When adding or changing one, write or update it in the style of the existing docs.

## Tracking

- The public API of each library is listed in its `PublicAPI.Shipped.txt` and `PublicAPI.Unshipped.txt`, and the build fails on any public member that isn't listed there (RS0016) or listed but gone (RS0017). Record each change in `PublicAPI.Unshipped.txt` in the same commit, so API changes show in the diff.
- The `dotnet format ... analyzers --diagnostics RS0016 RS0017` command (see `commands.instructions.md`) adds the missing members and removes the unshipped ones that are gone. One run doesn't always cover every project: run it again until the build reports no RS0016 or RS0017.
- For a member gone from `PublicAPI.Shipped.txt`, such as a changed signature, the command adds nothing: add its line to `PublicAPI.Unshipped.txt` yourself, prefixed with `*REMOVED*`.
- A new package starts with empty `PublicAPI.Shipped.txt` and `PublicAPI.Unshipped.txt` files that contain only `#nullable enable`.
