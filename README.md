# zencq/.github

The single source of the agent instructions and the repository setup files that the zencq .NET repositories share, and the default community files of every zencq repository.

| Folder | Contents | Synced to |
| --- | --- | --- |
| `instructions/dotnet/` | Rules for every .NET repository: C# style, tests, workflows, commits, formatting and linting, target frameworks, project files, authoring instructions | `.github/instructions/shared/dotnet/` in every repository below |
| `instructions/library/` | Rules only for NuGet libraries: public API tracking, trimming and AOT, packages, releases | `.github/instructions/shared/library/` in the libraries |
| `.editorconfig` | Formatting and naming rules | the same path in every repository below |
| `.gitattributes` | LF line endings | the same path in every repository below |
| `.qlty/qlty.toml`, `.qlty/.gitignore`, `.qlty/configs/` | Qlty linters and their settings | the same paths in every repository below |

| Repository | Layers |
| --- | --- |
| `zencq/zenin-common` | dotnet, library |
| `zencq/zenin-integration-nms` | dotnet, library |
| `zencq/zenin-integration-nms-procedural` | dotnet, library |
| `zencq/nomnom` | dotnet |

## How the sync works

On every push to `main` that changes these files, `.github/workflows/sync.yml` runs [repo-file-sync-action](https://github.com/N6REJ/repo-file-sync-action) with the mapping in `.github/workflows/config/sync.yml`, and opens (or updates) one pull request in each repository whose copy differs. Files removed here are removed there too. The workflow can also be started by hand.

The action writes to the other repositories with the `SYNC_TOKEN` secret: a fine-grained personal access token owned by `zencq`, limited to the repositories above, with read and write access to **Contents** and **Pull requests**.

## Changing a shared rule

- Edit the files here, never the synced copies; the next sync overwrites them.
- Shared files hold no repository-specific names. A repository adds its own facts in its own `.github/instructions/` files, which may add to a shared topic but never contradict it. The full authoring rules are in `instructions/dotnet/instructions.instructions.md`.
- Shared setup files hold no repository-specific settings either. A repository whose layout doesn't fit them (such as tests outside `tests/`) changes its layout, not the shared file.
- To add a repository, add it to `.github/workflows/config/sync.yml` and to the table above.

## Community defaults

The files in `.github/` (besides the workflows and Dependabot) are the default community files: GitHub uses them for every public zencq repository that has no file of the same kind, so they are not synced. They hold nothing specific to one repository and link only to the shared Discord.

| File | Purpose |
| --- | --- |
| `.github/CODE_OF_CONDUCT.md` | Contributor Covenant, with reports going to the Discord moderators |
| `.github/CONTRIBUTING.md` | How to contribute a change |
| `.github/SUPPORT.md` | Where to ask for help |
| `.github/ACCESSIBILITY.md` | Accessibility goals, guidelines, and how to report barriers |
| `.github/SECURITY.md` | How to report a vulnerability privately |
| `.github/FUNDING.yml` | The sponsor button |
| `.github/pull_request_template.md` | The pull request description |
| `.github/ISSUE_TEMPLATE/` | Bug report and feature request forms, and a contact link to Discord |
| `.github/DISCUSSION_TEMPLATE/` | Forms for the General, Ideas, and Q&A discussion categories |

- A repository's own `.github/ISSUE_TEMPLATE/` or `.github/DISCUSSION_TEMPLATE/` folder replaces the whole default folder.
- A repository keeps its own version of a file only when it needs to say something specific to it. `CODEOWNERS` can't be a default and stays in each repository.
