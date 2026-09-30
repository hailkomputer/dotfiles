#!/usr/bin/env bash
# Claude Code status line — Rose Pine

input=$(cat)

# Rose Pine via the terminal's ANSI palette, so colors follow the terminal's
# light/dark theme (ghostty maps these to Rose Pine / Rose Pine Dawn)
LOVE='\033[31m'
PINE='\033[32m'
GOLD='\033[33m'
FOAM='\033[34m'
IRIS='\033[35m'
ROSE='\033[36m'
MUTED='\033[90m'
BOLD='\033[1m'
RESET='\033[0m'

user=$(whoami)
dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
[ -z "$dir" ] && dir=$(pwd)

# Truncate directory to last 4 components (mirrors starship truncation_length=4)
truncated_dir=$(echo "$dir" | awk -F'/' '{
  n=NF; start=n-3; if(start<1) start=1;
  out="";
  for(i=start;i<=n;i++) { if(out!="") out=out"/"; out=out$i }
  print out
}')

# Git branch and status
branch=""
git_status_str=""
if git_dir=$(GIT_OPTIONAL_LOCKS=0 git -C "$dir" rev-parse --git-dir 2>/dev/null); then
  branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$dir" symbolic-ref --short HEAD 2>/dev/null || GIT_OPTIONAL_LOCKS=0 git -C "$dir" rev-parse --short HEAD 2>/dev/null)
  porcelain=$(GIT_OPTIONAL_LOCKS=0 git -C "$dir" status --porcelain 2>/dev/null)
  if [ -n "$porcelain" ]; then
    git_status_str="*"
  fi
fi

# Model
model=$(echo "$input" | jq -r '.model.display_name // empty')

# Context remaining
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Build the line
line=""

# user in foam bold
line="${line}${BOLD}${FOAM}${user}${RESET}"

# directory in iris bold
line="${line} ${BOLD}${IRIS}${truncated_dir}${RESET}"

# git branch in rose bold, status in love
if [ -n "$branch" ]; then
  line="${line} ${BOLD}${ROSE}${branch}${RESET}"
  if [ -n "$git_status_str" ]; then
    line="${line}${BOLD}${LOVE}${git_status_str}${RESET}"
  fi
fi

# model in muted
if [ -n "$model" ]; then
  line="${line} ${MUTED}${model}${RESET}"
fi

# context remaining
if [ -n "$remaining" ]; then
  # color: pine if >50%, gold if 20-50%, love if <20%
  pct=$(printf '%.0f' "$remaining")
  if [ "$pct" -gt 50 ]; then
    ctx_color="$PINE"
  elif [ "$pct" -gt 20 ]; then
    ctx_color="$GOLD"
  else
    ctx_color="$LOVE"
  fi
  line="${line} ${ctx_color}ctx:${pct}%${RESET}"
fi

printf "%b\n" "$line"
