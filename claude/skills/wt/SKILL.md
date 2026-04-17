---
name: wt
description: Manage git worktrees for parallel Claude Code sessions in tmux. Create, attach, list, remove, and clean up worktrees.
argument-hint: <command> [branch] [--claude]
allowed-tools: Bash(git *), Bash(tmux *)
---

You are a git worktree lifecycle manager. The user invoked `/wt $ARGUMENTS`.

## Naming convention

Worktree directories are created as siblings of the main repo:
- Main repo: `/path/to/repo`
- Worktree: `/path/to/repo-wt-<branch>` (slashes in branch names replaced with `-`)

## Commands

### `wt new <branch> [--claude]`

1. Detect the repo root with `git rev-parse --show-toplevel`
2. Compute the worktree path using the naming convention above
3. If the branch already exists locally, run: `git worktree add <path> <branch>`
4. If not, create it: `git worktree add <path> -b <branch>`
5. Report the created path and branch
6. If `--claude` was passed, also run the `attach` flow below

### `wt attach <branch>`

1. Compute the worktree path
2. Verify the directory exists — if not, suggest `wt new`
3. Determine if we're inside tmux by checking `$TMUX`
4. If inside tmux: `tmux new-window -n "<branch>" "cd '<path>' && tmux set-window-option automatic-rename off && claude"`
5. If outside tmux: create or attach to session `wt-<branch>` (slashes replaced with dashes):
   - `tmux new-session -s "wt-<safe-name>" -n "<branch>" -c "<path>" "tmux set-window-option automatic-rename off && claude"`

### `wt list`

1. Run `git worktree list` and display the output
2. Run `tmux list-sessions 2>/dev/null` and show any sessions prefixed with `wt-`
3. Present both together so the user can see which worktrees have active Claude sessions

### `wt rm <branch>`

1. Compute the worktree path
2. Run `git worktree remove <path>`
3. Ask the user if they also want to delete the branch with `git branch -d <branch>`
4. Kill any tmux session named `wt-<branch>` if it exists
5. If inside tmux, also check for and kill any tmux window named `<branch>`

### `wt clean`

1. Run `git worktree prune -v` to clean stale references
2. List directories matching the `*-wt-*` pattern that are siblings of the repo
3. Cross-reference with `git worktree list` output
4. Report any orphaned directories and ask the user before removing them

## Rules

- Always verify the current directory is inside a git repo before doing anything
- Never force-delete branches — use `git branch -d` (safe delete), not `-D`
- Show clear output about what was done after each operation
- If no arguments are given, show a help summary of available commands
