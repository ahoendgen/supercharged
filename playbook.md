# Supercharged Fork Playbook

Step-by-step guide for setting up a new supercharged fork. Run through these steps in the fork's repo.

## Prerequisites

- The upstream repo is already forked to `ahoendgen/{repo-name}` on GitHub
- The repo is cloned locally to `~/projects/opensource/{repo-name}`

## Steps

### 1. Create the supercharged branch

```bash
git checkout -b supercharged
```

### 2. Set up VS Code Peacock color

Run `./list-peacock-colors.sh` to see which colors are already in use, then pick a distinct color for the new project:

```bash
mkdir -p .vscode
echo '{ "peacock.color": "#XXXXXX" }' > .vscode/settings.json
```

### 3. Rebrand the app

Ask the user:

- Naming: **Super{Name}**, **{Name} Supercharged**, or something else?
- Color scheme / theme preference?

Then rename the app so it can be installed side-by-side with the upstream version. This typically involves:

- App name / product name
- App icons — propose an icon concept to the user (e.g. original icon with supercharged color scheme, lightning bolt overlay, or a fresh take on the original). Ask the user to create it (e.g. via an image generator or manually) and provide the file.
- Bundle ID / package name if applicable
- Window titles, tray/menu bar labels
- Color theme (default preference: blue `#50afd1` / yellow `#d0b843` — use a distinct color to tell them apart visually)

The goal is to make it obvious which version is running when both are installed.

### 3. Disable upstream update checker

If the app has an auto-update mechanism, disable or redirect it. This fork follows its own release cycle.

### 4. Add the fork disclaimer to the README

Copy the template from `~/projects/opensource/supercharged/project-disclaimer.md` and place it at the top of the project's README. Replace the placeholders:

- `{Name}` → the original project name
- `{Original}` → the original project name (for display)
- `{upstream-url}` → URL of the upstream repo

### 5. Add a "Supercharged Features" section to the README

Below the disclaimer, add a section listing the changes made in this fork. Example:

```markdown
## Supercharged Features

Features added in this fork on top of upstream {Original}:

- **Feature A** — description
- **Feature B** — description
```

Update this section as new features are added.

### 6. Register in the supercharged collection

Add the new fork to `~/projects/opensource/supercharged/repos.json`:

```json
{
  "name": "Super{Name}",
  "repo": "https://github.com/ahoendgen/{repo-name}",
  "upstream": "https://github.com/{upstream-owner}/{repo-name}",
  "branch": "supercharged",
  "localPath": "~/projects/opensource/{repo-name}"
}
```

### 7. Update the supercharged README

Add a new project section to `~/projects/opensource/supercharged/README.md` following the existing format:

- Copy the app icon to `assets/` in the supercharged repo
- Add a heading with icon, name, and link to the supercharged branch
- One-liner describing the upstream project
- **Changes:** bullet list (or run `/sync-features` to generate it)

### 8. Commit and push

```bash
git add -A
git commit -m "refactor: rebrand to Super{Name} for supercharged fork"
git push -u origin supercharged
```

Then commit and push the supercharged collection repo as well.

### 9. Sync features

Run `/sync-features` in the supercharged collection repo to extract all changes from the git log and update the README automatically.
