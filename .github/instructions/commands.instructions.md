---
applyTo: "**"
---

# Commands

- Lint with Qlty; `qlty.instructions.md` has the commands. This repository has no build and no tests.
- Regenerate the layer indexes (`instructions/<layer>/README.md`) after adding, renaming, or removing a file in `instructions/`, or changing its `applyTo` or headings, and commit them with the change. The sync checks them first and stops when they are out of date:

  ```sh
  .github/workflows/scripts/update-indexes.sh
  ```

- Regenerate the Modern C# template part of `.editorconfig` when the template has a new version. The script keeps everything from the `#### zencq additions ####` marker on and needs the .NET SDK:

  ```sh
  .github/workflows/scripts/update-editorconfig.sh
  ```

- Start the sync by hand, or with the files that repositories keep as their own replaced too:

  ```sh
  gh workflow run sync-shared-resources.yml
  gh workflow run sync-shared-resources.yml -f replace-kept-files=true
  ```
