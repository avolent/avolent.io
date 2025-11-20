# avolent.io
## My GitHub Page

A personal portfolio website showcasing my projects, skills, and yearly learning goals.

Built with HTML, CSS, and vanilla JavaScript using the LaTeX.css framework for a clean, academic-style design.

**Live Site:** [avolent.io](https://avolent.io)

## Features
- Dark mode toggle with localStorage persistence
- Responsive design
- Yearly learning goals tracker
- Project showcase
- Professional skills and certifications

## Deployment
Automatically deployed to GitHub Pages via GitHub Actions on every push to the main branch.

## Quality & Automation
- **HTML/CSS Validation:** Automated checks on every PR
- **Link Checking:** Weekly scans for broken links
- **Semantic Versioning:** Enforced conventional commits
- **Automated Releases:** Semantic-release creates versions and changelogs
- **Dependency Updates:** Self-hosted Renovate runs weekly
- **Local Git Hooks:** Pre-commit validation

See [.github/README.md](.github/README.md) for detailed automation documentation.

## Contributing
This project follows strict [Semantic Versioning](https://semver.org/) and [Conventional Commits](https://www.conventionalcommits.org/).

**Setup git hooks for local validation:**
```bash
./setup-hooks.sh
```

All commits and PR titles must follow this format:
```
<type>[optional scope]: <description>
```

Examples: `feat: add feature`, `fix: resolve bug`, `docs: update readme`

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.
