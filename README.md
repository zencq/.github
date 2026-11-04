# zencq/.github

The single source of the agent instructions and the `.editorconfig` that the zencq .NET repositories share.

| Folder | Contents | Synced to |
| --- | --- | --- |
| `instructions/dotnet/` | Rules for every .NET repository: C# style, tests, workflows, commits, formatting and linting, target frameworks, project files, authoring instructions | `.github/instructions/shared/dotnet/` in every repository below |
| `instructions/library/` | Rules only for NuGet libraries: public API tracking, trimming and AOT, packages, releases | `.github/instructions/shared/library/` in the libraries |
| `.editorconfig` | Formatting and naming rules | `.editorconfig` in every repository below |

| Repository | Layers |
| --- | --- |
| `zencq/zenin-common` | dotnet, library |
| `zencq/zenin-integration-nms` | dotnet, library |
| `zencq/zenin-integration-nms-procedural` | dotnet, library |
| `zencq/nomnom` | dotnet |

## How the sync works

On every push to `main` that changes these files, `.github/workflows/sync.yml` runs [repo-file-sync-action](https://github.com/BetaHuhn/repo-file-sync-action) with the mapping in `.github/sync.yml`, and opens (or updates) one pull request in each repository whose copy differs. Files removed here are removed there too. The workflow can also be started by hand.

The action writes to the other repositories with the `SYNC_TOKEN` secret: a fine-grained personal access token owned by `zencq`, limited to the repositories above, with read and write access to **Contents** and **Pull requests**.

## Changing a shared rule

- Edit the files here, never the synced copies; the next sync overwrites them.
- Shared files hold no repository-specific names. A repository adds its own facts in its own `.github/instructions/` files, which may add to a shared topic but never contradict it. The full authoring rules are in `instructions/dotnet/instructions.instructions.md`.
- To add a repository, add it to `.github/sync.yml` and to the table above.
