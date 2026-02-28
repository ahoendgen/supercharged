---
name: sync-features
description: Extract all custom features from supercharged fork git logs and update the README
disable-model-invocation: false
allowed-tools: Bash(git *), Read, Edit, Glob
---

# Sync Features from Fork Git Logs

Read `repos.json` to get the list of forked repos. Each entry has a `localPath`, `branch`, and optionally a `lastCheckedCommit`.

For each repo:

1. `cd` into the local path
2. If `lastCheckedCommit` exists, run `git log --oneline <lastCheckedCommit>..<branch>` to get only new commits since the last sync
3. If `lastCheckedCommit` is missing (first run), run `git log --oneline <branch> --not main` to get all fork commits
4. If there are no new commits, skip this repo entirely — do not touch its README section
5. Analyze all new commits (feat, fix, refactor, chore, style, docs, etc.) to understand the full picture of what was changed
6. Distill the commits into concise feature bullets that describe what the fork adds or changes compared to upstream

Then update the `README.md` only for repos that had new commits:
- For each project, replace the **Added features:** bullet list with the freshly extracted features
- Keep the rest of the README structure intact
- Each feature bullet should be a short, human-readable description (not the raw commit message)
- Combine related commits into a single bullet when they describe the same feature

After updating, save the current HEAD commit hash of each repo's supercharged branch as `lastCheckedCommit` in `repos.json` (only for repos that were processed).

Show a summary of what changed, or report that everything is up to date.
