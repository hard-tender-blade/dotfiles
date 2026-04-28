#!/usr/bin/env bash
page_size=$(vm_stat | awk '/page size of/ {print $8}')
[ -z "$page_size" ] && page_size=4096
active=$(vm_stat | awk '/Pages active/ {print $3}' | tr -d .)
wired=$(vm_stat | awk '/Pages wired/  {print $4}' | tr -d .)
compressed=$(vm_stat | awk '/Pages occupied/ {print $5}' | tr -d .)
free=$(vm_stat | awk '/Pages free/ {print $3}' | tr -d .)
inactive=$(vm_stat | awk '/Pages inactive/ {print $3}' | tr -d .)
spec=$(vm_stat | awk '/Pages speculative/ {print $3}' | tr -d .)
used=$((active + wired + compressed))
total=$((used + free + inactive + spec))
pct=$((used * 100 / total))
sketchybar --set "$NAME" label="${pct}%"