# dotfiles (chezmoi source)

chezmoi manages the **bootstrap and wiring** for agent skills — not the skill
bodies themselves. The skills live in a separate repo (`agent-skills`) that this
repo knows how to clone and keep fresh.

## What chezmoi does here

| Piece | Source path | Result |
|---|---|---|
| Prompt for your skills repo URL | `.chezmoi.toml.tmpl` | stored once as `skillsRepo` |
| Clone the skills repo | `run_once_before_10-clone-skills.sh.tmpl` | `~/src/agent-skills` |
| Point the agent at it | `dot_claude/symlink_skills.tmpl` | `~/.claude/skills` → `~/src/agent-skills/skills` |
| Freshness (Linux) | `dot_config/systemd/user/*` | `agent-skills-sync.timer` (daily + on boot) |
| Freshness (macOS) | `Library/LaunchAgents/com.agentskills.sync.plist.tmpl` | launchd agent (daily + at login) |
| Enable the unit | `run_onchange_after_20-install-sync-units.sh.tmpl` | per-OS |
| Manual pull | `dot_local/bin/executable_skills-sync` | `skills-sync` on `PATH` |

`.chezmoiignore` keeps the launchd plist off Linux and the systemd units off macOS,
so the same repo applies cleanly on both.

## First run on any machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"          # or: brew install chezmoi
chezmoi init --apply <your-github-username>    # prompts once for the skills repo URL
```

That clones this repo, asks for your `agent-skills` URL, clones that too, creates
the symlink, and enables the sync timer/agent.

## Changing the agent skills directory

If your agent loads skills from somewhere other than `~/.claude/skills`, edit
`dot_claude/symlink_skills.tmpl`'s location (rename the parent dir) or repoint the
target, then `chezmoi apply`.

## Note on the sandboxed GPU box

The symlink target (`~/src/agent-skills/skills`) must be **inside the bwrap mount
tree**, or it resolves to nothing inside the sandbox. Either keep the clone under a
bind-mounted path, or add a `--ro-bind ~/src/agent-skills ~/src/agent-skills` to the
sandbox invocation. It works fine outside the sandbox, so this failure is easy to miss.
