# GitHub Automation Documentation

This document describes all automated workflows and quality checks for the avolent.io repository.

## 🤖 Automated Workflows

### 1. GitHub Pages Deployment (`deploy.yml`)

**Trigger:** Push to `main`/`master` branch or manual dispatch

Automatically deploys the website to GitHub Pages.

**Steps:**

- Checkout repository
- Configure GitHub Pages
- Upload site artifacts
- Deploy to GitHub Pages

**Permissions Required:**

- `contents: read`
- `pages: write`
- `id-token: write`

---

### 2. HTML/CSS Validation (`validate.yml`)

**Trigger:** Pull requests and pushes to `main`/`master`

Validates all HTML and CSS files to ensure standards compliance.

**Steps:**

- Checkout repository
- Run HTML5 validator with CSS support
- Generate validation summary

**Tools Used:**

- `html5validator` via GitHub Action

---

### 3. Link Checker (`link-check.yml`)

**Trigger:**

- Weekly schedule (Mondays at 9am AEDT)
- Push to `main`/`master`
- Manual dispatch

Scans all HTML and Markdown files for broken links.

**Steps:**

- Checkout repository
- Run Lychee link checker
- Create issue if broken links found

**Features:**

- Checks internal and external links
- Creates GitHub issue on failure with details
- Labels: `bug`, `documentation`

---

### 4. Semantic Release (`release.yml`)

**Trigger:** Push to `main`/`master` branch

Automatically creates releases based on conventional commit messages.

**Steps:**

- Checkout with full git history
- Setup Node.js environment
- Install semantic-release dependencies
- Analyze commits and generate release

**What it does:**

- Determines version bump based on commits
- Generates CHANGELOG.md
- Creates GitHub release
- Updates package.json version

**Commit Types:**

- `feat:` → Minor version bump (1.x.0)
- `fix:` → Patch version bump (1.0.x)
- `BREAKING CHANGE:` → Major version bump (x.0.0)
- `docs:`, `chore:`, etc. → No release

---

### 5. Renovate (`renovate.yml`)

**Trigger:**

- Weekly schedule (Mondays at 9am AEDT)
- Manual dispatch

Automatically updates dependencies and GitHub Actions.

**Configuration:** `renovate.json`

**Features:**

- Semantic commit messages
- Groups GitHub Actions updates
- Pins Actions to commit SHA for security
- Automerges non-major updates
- Requires approval for major updates
- Vulnerability alerts with security labels

**Schedule:**

- Dependency updates: Weekly on Monday
- Lock file maintenance: First day of month

---

## 📋 Commit Convention

All commits must follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `perf:` Performance improvements
- `test:` Adding or updating tests
- `chore:` Maintenance tasks
- `ci:` CI/CD changes

### Examples:

```
feat: add dark mode toggle
fix: resolve mobile navigation issue
docs: update installation instructions
chore(deps): update dependencies
```

---

## 🔒 Required Checks

All pull requests must pass:

1. ✅ HTML/CSS validation
2. ✅ Link checking
3. ✅ Conventional commit format

---

## 🛠️ Local Development

### Setup Git Hooks

Run the setup script to install pre-commit hooks:

```bash
./setup-hooks.sh
```

This adds local validation before commits to catch issues early.

---

## 📊 Workflow Status

View workflow runs and status:

- [Actions Tab](../../actions)
- [Deployments](../../deployments)
- [Releases](../../releases)

---

## 🔧 Configuration Files

- `.releaserc.json` - Semantic-release configuration
- `renovate.json` - Renovate dependency updates
- `.github/workflows/*.yml` - GitHub Actions workflows
- `package.json` - Node.js dependencies for tooling

---

## 📝 Maintenance

### Weekly Automated Tasks

- Monday 9am AEDT: Dependency updates (Renovate)
- Monday 9am AEDT: Link checking

### Monthly Automated Tasks

- 1st of month: Lock file maintenance

### On Every Push

- Deployment to GitHub Pages
- Semantic versioning and releases

---

## 🚨 Troubleshooting

### Failed Deployment

Check the [Actions tab](../../actions/workflows/deploy.yml) for deployment logs.

### Broken Links

Weekly link checks create issues automatically. Check [Issues](../../issues?q=is%3Aissue+label%3Abug%2Cdocumentation).

### Failed Validation

Run validation locally:

```bash
# HTML validation requires html5validator
pip install html5validator
html5validator --root . --also-check-css
```

### Semantic Release Not Creating Releases

Ensure commits follow conventional commit format. Use `git log` to verify recent commits.

---

## 📚 Additional Resources

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Semantic Release Documentation](https://semantic-release.gitbook.io/)
- [Renovate Documentation](https://docs.renovatebot.com/)
