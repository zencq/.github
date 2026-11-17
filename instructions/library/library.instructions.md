---
applyTo: "**"
---

<!-- Synced from zencq/.github (instructions/library/). Edit it there; changes made in a consuming repository are overwritten. -->

# Packages

- Each package has its own `README.md`, `CHANGELOG.md`, and `LICENSE` (see `license.instructions.md`) next to its project file, and its own tests.
- Keep package names and namespaces aligned with the repository's package naming pattern. Add new functionality to the most specific existing package; add a new package only when it does not fit an existing one.
- Packages depend on each other in one direction only; there must be no circular references.
- The package `README.md` is also the readme on the package registry. It introduces the package, lists its namespaces with their main types and its external dependencies, and links to `docs/` for usage. Update it when a namespace or main type is added, removed, or renamed, or when a dependency changes.
- `docs/` is the usage guide of all packages: `docs/README.md` lists the pages and the behavior they share, and each page covers one topic with examples. A public API change updates the affected pages too, even without a change in behavior. The package `README.md` links to it by absolute URL, since relative links don't work on package registries.
