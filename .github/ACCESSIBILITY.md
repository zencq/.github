# Accessibility

We want zencq projects, their documentation, and their community to be usable and welcoming for everyone, including people who use assistive technology.

Some projects are libraries without a user interface; applications built with them are responsible for the accessibility of their own interfaces. Projects with a user interface follow the user interface guidelines below as well.

## Priorities

1. **Documentation:** clear, readable, and usable with assistive technology.
2. **User interfaces, APIs, and diagnostics:** usable with keyboard and assistive technology, with clear, descriptive messages and output that doesn't depend on color, formatting, or a specific console or locale.
3. **Contribution process:** open to people with different abilities, tools, and working styles.
4. **Enabling consumers:** make it easier for dependent projects to build accessible and localizable experiences.

## Supported environments

- **Software:** the `README.md` of each repository lists the supported platforms and .NET versions.
- **Documentation:** Markdown files in each repository, read on GitHub or in a text editor. We aim for compatibility with common screen readers and browsers.
- **Community:** GitHub (Discussions, Issues, pull requests) and [Discord](https://discord.gg/nomnom-762409407488720918).

## Documentation guidelines

- Use clear, plain language, and explain terms and abbreviations.
- Use a logical heading structure and descriptive link text (not "click here").
- Provide alternative text for images and diagrams, and don't rely on color alone to convey meaning.
- Provide code samples as text, not as images.

## User interface guidelines

- Make every function usable with the keyboard alone, with a visible focus.
- Give controls names that screen readers can announce.
- Keep sufficient contrast, and don't rely on color alone to convey meaning.
- Support system text scaling and high-contrast settings.

## Library and API guidelines

- Provide clear, descriptive error messages and diagnostics.
- Don't use color, formatting, or a specific console or locale as the only way to convey meaning.
- Keep text that may be shown to users separate from logic so consumers can adapt or localize it.

## Known barriers

- **Discord:** accessibility depends on Discord's own features and limitations, which we don't control.

A repository may list further barriers in its own documentation.

## Contributor expectations

- Follow the guidelines above that apply to your change.
- Describe images and diagrams, and write meaningful link text and error messages.
- Contributions that improve accessibility, including documentation, examples, user interfaces, and API design, are welcome.
- Follow the [contributing guide](https://github.com/zencq/.github/blob/HEAD/.github/CONTRIBUTING.md) and the [code of conduct](https://github.com/zencq/.github/blob/HEAD/.github/CODE_OF_CONDUCT.md).
- Participation is asynchronous, so real-time communication is never required.

## Reporting accessibility issues

If you encounter an accessibility barrier in our documentation, software, or contribution process, open an issue or start a discussion in the affected repository. You can also ask on [Discord](https://discord.gg/nomnom-762409407488720918).

Please include:

- What you were trying to do
- The repository and the page, file, screen, or API affected
- The assistive technology or tools you used, if applicable
- Any suggested improvement

Do not include personal or sensitive information. We make a best effort to address reports promptly but don't guarantee a specific timeframe. Security vulnerabilities should go through the [security policy](https://github.com/zencq/.github/blob/HEAD/.github/SECURITY.md) instead.

## Ownership

The project maintainers (members of the Developer role on Discord) are responsible for accessibility in every zencq repository.

## Maintenance

We review this page when we make significant changes to documentation, tooling, or the contribution process, and update it as known barriers are resolved or found. Suggestions to improve it are welcome through the channels above.

## Related documents

- [Contributing](https://github.com/zencq/.github/blob/HEAD/.github/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/zencq/.github/blob/HEAD/.github/CODE_OF_CONDUCT.md)
- [Getting Help](https://github.com/zencq/.github/blob/HEAD/.github/SUPPORT.md)
- [Security Policy](https://github.com/zencq/.github/blob/HEAD/.github/SECURITY.md)
