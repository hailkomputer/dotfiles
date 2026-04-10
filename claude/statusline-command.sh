#!/usr/bin/env bash
# Claude Code status line — styled after Starship Catppuccin Mocha

input=$(cat)

# Catppuccin Mocha palette (ANSI 256-color approximations via truecolor)
TEAL='\033[38;2;148;226;213m'
LAVENDER='\033[38;2;180;190;254m'
MAUVE='\033[38;2;203;166;247m'
MAROON='\033[38;2;235;160;172m'
PEACH='\033[38;2;250;179;135m'
SUBTEXT1='\033[38;2;186;194;222m'
GREEN='\033[38;2;166;227;161m'
YELLOW='\033[38;2;249;226;175m'
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

# user in teal bold
line="${line}${BOLD}${TEAL}${user}${RESET}"

# directory in lavender bold
line="${line} ${BOLD}${LAVENDER}${truncated_dir}${RESET}"

# git branch in mauve bold, status in maroon
if [ -n "$branch" ]; then
  line="${line} ${BOLD}${MAUVE}${branch}${RESET}"
  if [ -n "$git_status_str" ]; then
    line="${line}${BOLD}${MAROON}${git_status_str}${RESET}"
  fi
fi

# model in subtext1
if [ -n "$model" ]; then
  line="${line} ${SUBTEXT1}${model}${RESET}"
fi

# context remaining
if [ -n "$remaining" ]; then
  # color: green if >50%, yellow if 20-50%, peach/red if <20%
  pct=$(printf '%.0f' "$remaining")
  if [ "$pct" -gt 50 ]; then
    ctx_color="$GREEN"
  elif [ "$pct" -gt 20 ]; then
    ctx_color="$YELLOW"
  else
    ctx_color="$PEACH"
  fi
  line="${line} ${ctx_color}ctx:${pct}%${RESET}"
fi

printf "%b\n" "$line"
