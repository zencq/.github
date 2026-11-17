# zencq/.github

The default community files of every zencq repository, and the source of the agent instructions and repository setup files that the zencq repositories share (see [the docs](docs/README.md)).

## Community defaults

The files in `.github/` (besides the workflows and Dependabot) are the default community files: GitHub uses them for every public zencq repository that has no file of the same kind. They hold nothing specific to one repository: they link only to the shared Discord and to each other by absolute URL (`https://github.com/zencq/.github/blob/HEAD/.github/...`), because relative links would resolve inside the repository that shows them.

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

A repository's own `.github/ISSUE_TEMPLATE/` or `.github/DISCUSSION_TEMPLATE/` folder replaces the whole default folder. A repository keeps its own version of a file only when it needs to say something specific to it. `CODEOWNERS` can't be a default and stays in each repository.

## AI assistance

This project is developed with AI coding agents (such as Claude Code and GitHub Copilot). They work from the instructions in `.github/instructions/`. A maintainer reviews, tests, and approves every change before it is merged, and is responsible for it.

## License

The files in this repository are licensed under [MIT-0](LICENSE), except `.github/CODE_OF_CONDUCT.md`, which is adapted from the Contributor Covenant and licensed under CC BY-SA 4.0, as its attribution section says.
