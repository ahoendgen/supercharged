---
name: sync-features
description: Extract all custom features from supercharged fork git logs and update the README
disable-model-invocation: false
---

# Sync Features from Fork Git Logs

Read `repos.json` to get the list of forked repos. Each entry has a `localPath`, `branch`, and optionally a `lastCheckedCommit`.

For each repo:

1. `cd` into the local path
2. If `lastCheckedCommit` exists, run `git log --oneline <lastCheckedCommit>..<branch>` to get only new commits since the last sync
3. If `lastCheckedCommit` is missing (first run), run `git log --oneline <branch> --not main` to get all fork commits
4. If there are no new commits, skip this repo entirely — do not touch any README
5. Analyze all new commits (feat, fix, refactor, chore, style, docs, etc.) to understand the full picture of what was changed
6. Distill the commits into concise feature bullets that describe what the fork adds or changes compared to upstream. Never use em dashes (`—`) or double dashes (`--`). Use commas or colons instead.
   - Only list **significant features**: new capabilities, new integrations, or major behavioral changes. Skip small incremental improvements to existing features (e.g. minor UI tweaks, adding a single subcommand to an existing CLI, formatting changes). If new commits only contain small increments, update `lastCheckedCommit` but do not change the READMEs.
7. If a feature lives in its own subdirectory (e.g. `supercapture-transcribe/`, `SuperCapture-Alfred/`), link the bullet to that directory on GitHub: `[Feature description](https://github.com/ahoendgen/{repo}/tree/supercharged/{subdir})`

Then update **two READMEs** for repos that had new commits:

### 1. The fork's own README (in the fork repo)
- Update the **## Supercharged Features** section below the disclaimer block
- This section lists all changes in this fork compared to upstream
- Each bullet should be a short, human-readable description (not the raw commit message)
- Combine related commits into a single bullet when they describe the same feature
- Commit and push the change to the fork's supercharged branch

### 2. The supercharged collection README (this repo)
- For each project, replace the **Changes:** bullet list with the freshly extracted features
- Keep the rest of the README structure intact

After updating, save the current HEAD commit hash of each repo's supercharged branch as `lastCheckedCommit` in `repos.json` (only for repos that were processed).

Show a summary of what changed, or report that everything is up to date.
