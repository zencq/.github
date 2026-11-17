# Shared layers

The agent instructions and repository setup files that the zencq repositories share. Each repository gets the layers that fit it.

## Instructions

| Folder | Contents |
| --- | --- |
| `instructions/common/` | Rules for every repository, whatever its language: commits and branches, scope of changes, license, Dependabot, repository names, GitHub Actions workflows, authoring instructions |
| `instructions/qlty/` | Rules for every repository with code, which gets the Qlty configuration: what Qlty checks and the commands to run it |
| `instructions/dotnet/` | Rules for every .NET repository: C# style, tests, formatting and linting, target frameworks, project files |
| `instructions/library/` | Rules for every library, whatever its language: packages, their readme and docs, public API compatibility, releases with release-please |
| `instructions/dotnet-library/` | Rules only for NuGet libraries: package metadata, public API tracking, trimming and AOT, publishing to GitHub Packages and NuGet.org |
| `instructions/docker/` | Rules for repositories that deploy with Docker: stack folders, the shared `proxy` network and the Cloudflare Tunnel, `.env` handling, images, health checks, Postgres upgrades |

## Setup files

| File | Contents |
| --- | --- |
| `.gitattributes` | Line endings for every repository: LF, and CRLF for `.cmd` and `.bat` |
| `.editorconfig` | Formatting and naming rules for every .NET repository |
| `.qlty/` | Qlty linters and their settings for every repository with code |

## Changing a shared rule

- Edit the files here, never the copies in other repositories.
- Shared files hold no repository-specific names. A repository adds its own facts in its own `.github/instructions/` files, which may add to a shared topic but never contradict it. The full authoring rules are in `instructions/common/instructions.instructions.md`.
- Shared setup files hold no repository-specific settings either. A repository whose layout doesn't fit them (such as tests outside `tests/`) changes its layout, not the shared file.
- This repository is public, so its docs and community files name no target repository; only the sync config lists them.

## How the sync works

On every push to `main` that changes the shared files, `.github/workflows/sync.yml` runs [repo-file-sync-action](https://github.com/N6REJ/repo-file-sync-action). It reads `.github/workflows/config/sync.yml`, which maps each layer and setup file to the repositories that get it, and opens (or updates) one pull request in each repository whose copy differs. Files removed here are removed there too. The workflow can also be started by hand.

- The action writes to the other repositories with the `SYNC_TOKEN` secret: a fine-grained personal access token limited to the target repositories, with read and write access to **Contents** and **Pull requests**.
- An entry with `replace: false` creates the file once and then leaves it to the repository, for a repository that keeps its own `.qlty/qlty.toml`. To roll out a changed file to these repositories too, start the workflow by hand with **Replace kept files** ticked, then carry each repository's additions over in its sync pull request.
- To add a repository, add it to the groups of its layers in `.github/workflows/config/sync.yml` and give `SYNC_TOKEN` access to it.

## Scripts

`scripts/update-editorconfig.sh` regenerates the Modern C# template part of `.editorconfig` and keeps everything from the `#### zencq additions ####` marker on. It needs the .NET SDK:

```sh
scripts/update-editorconfig.sh
```
