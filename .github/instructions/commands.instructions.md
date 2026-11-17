---
applyTo: "**"
---

# Commands

- Lint with Qlty; `qlty.instructions.md` has the commands. This repository has no build and no tests.
- Regenerate the Modern C# template part of `.editorconfig` when the template has a new version. The script keeps everything from the `#### zencq additions ####` marker on and needs the .NET SDK:

  ```sh
  .github/workflows/scripts/update-editorconfig.sh
  ```

- Start the sync by hand, or with the files that repositories keep as their own replaced too:

  ```sh
  gh workflow run sync-shared-resources.yml
  gh workflow run sync-shared-resources.yml -f replace-kept-files=true
  ```
