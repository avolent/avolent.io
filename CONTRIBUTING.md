# Contributing to avolent.io

Thank you for your interest in contributing to this project! This document outlines the guidelines and conventions we follow.

## Setup Git Hooks (Recommended)

Before making commits, it's **highly recommended** to set up local git hooks for immediate validation:

```bash
./setup-hooks.sh
```

This will:

- Configure git to use the `.githooks` directory
- Enable local commit message validation
- Catch formatting issues **before** you push

The hook validates:

- ✅ Conventional commit format
- ✅ Lowercase type
- ✅ Lowercase subject start
- ✅ No period at end of subject
- ✅ Max header length (100 chars)

**Without hooks:** Validation happens on GitHub after push (slower feedback)
**With hooks:** Validation happens locally before commit (instant feedback)

## Semantic Versioning & Conventional Commits

This project strictly follows [Semantic Versioning](https://semver.org/) and [Conventional Commits](https://www.conventionalcommits.org/) specifications.

### Commit Message Format

All commit messages MUST follow this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Commit Types

| Type       | Description                                               | Version Bump  |
| ---------- | --------------------------------------------------------- | ------------- |
| `feat`     | A new feature                                             | MINOR (0.x.0) |
| `fix`      | A bug fix                                                 | PATCH (0.0.x) |
| `docs`     | Documentation only changes                                | PATCH         |
| `style`    | Changes that don't affect code meaning (formatting, etc.) | PATCH         |
| `refactor` | Code change that neither fixes a bug nor adds a feature   | PATCH         |
| `perf`     | Performance improvement                                   | PATCH         |
| `test`     | Adding or updating tests                                  | PATCH         |
| `build`    | Changes to build system or dependencies                   | PATCH         |
| `ci`       | Changes to CI configuration files and scripts             | PATCH         |
| `chore`    | Other changes that don't modify src or test files         | No release    |
| `revert`   | Reverts a previous commit                                 | PATCH         |

### Examples

#### Good Commit Messages ✅

```bash
feat: add dark mode toggle to navigation
fix: correct broken link in footer
docs: update README with installation instructions
style: format CSS according to prettier rules
refactor: simplify dark mode toggle logic
perf: optimize image loading
test: add unit tests for dark mode functionality
build: update GitHub Actions to v4
ci: add semantic versioning checks
chore: update .gitignore
```

#### Bad Commit Messages ❌

```bash
Update stuff                    # No type prefix
FIX: broken link               # Type in uppercase
feat Add feature               # Missing colon
feat: Add New Feature.         # Subject starts with uppercase and ends with period
fixed the bug                  # Wrong tense and no type
```

### Commit Message Rules

1. **Type must be lowercase** (e.g., `feat`, not `FEAT` or `Feat`)
2. **Subject must not start with uppercase** (e.g., `add feature`, not `Add feature`)
3. **Subject must not end with a period**
4. **Header max length: 100 characters**
5. **Body max line length: 200 characters**
6. **Use imperative mood** (e.g., "add", not "added" or "adds")

### Pull Request Titles

PR titles MUST also follow the conventional commit format:

```
feat: add new feature description
fix: resolve issue with navigation
docs: update contributing guidelines
```

### Scopes (Optional)

You can optionally add a scope to provide additional context:

```bash
feat(navigation): add breadcrumb component
fix(css): correct button alignment
docs(readme): add badge for build status
ci(workflows): add HTML validation
```

## Automated Checks

This repository has automated checks that will validate:

1. **PR Titles** - Must follow conventional commit format
2. **Commit Messages** - All commits in a PR must follow the format
3. **HTML Validation** - All HTML must be valid HTML5
4. **Link Checking** - No broken links allowed

All checks must pass before a PR can be merged.

## Workflow

1. Fork the repository
2. Create a new branch: `git checkout -b feat/your-feature-name`
3. Make your changes
4. Commit with semantic versioning: `git commit -m "feat: your feature description"`
5. Push to your fork: `git push origin feat/your-feature-name`
6. Open a Pull Request with a semantic title

## Questions?

If you have questions about these guidelines, please open an issue for discussion.

## Resources

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Commitlint](https://commitlint.js.org/)
