# AGENTS.md

This repository is the source of the agent instructions and repository setup files that the zencq repositories share; `docs/README.md` explains the layers, the sync, and the scripts. The files in `instructions/` are not instructions for this repository: they are synced into the others. The common ones below still apply here, and this repository's own instructions live in `.github/instructions/`.

Always read the files that apply to everything: [commands.instructions.md](.github/instructions/commands.instructions.md), [changes.instructions.md](instructions/common/changes.instructions.md), [commits.instructions.md](instructions/common/commits.instructions.md), [dependabot.instructions.md](instructions/common/dependabot.instructions.md), [names.instructions.md](instructions/common/names.instructions.md), and [qlty.instructions.md](instructions/common/qlty.instructions.md). Read the others when you work on the files they apply to:

| File | Applies to |
| --- | --- |
| [commands.instructions.md](.github/instructions/commands.instructions.md) | everything (Qlty, the editorconfig script, starting the sync by hand) |
| [common/changes.instructions.md](instructions/common/changes.instructions.md) | everything (scope of changes) |
| [common/commits.instructions.md](instructions/common/commits.instructions.md) | everything (Conventional Commits, branch names) |
| [common/dependabot.instructions.md](instructions/common/dependabot.instructions.md) | everything (Dependabot entries, groups, commit prefixes) |
| [common/names.instructions.md](instructions/common/names.instructions.md) | everything (repository names in lowercase) |
| [common/qlty.instructions.md](instructions/common/qlty.instructions.md) | everything (Qlty configuration and commands) |
| [common/workflows.instructions.md](instructions/common/workflows.instructions.md) | `.github/workflows/**` (permissions, action pinning, timeouts, concurrency) |
| [common/instructions.instructions.md](instructions/common/instructions.instructions.md) | `instructions/**`, `.github/instructions/**`, `AGENTS.md`, `CLAUDE.md` (authoring the shared and repository instructions) |
