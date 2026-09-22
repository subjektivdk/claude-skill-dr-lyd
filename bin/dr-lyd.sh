#!/bin/bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: dr-lyd.sh <play <slug>|stop|status|list>

  play <slug>  Start playing the given DR channel (slug from 'list').
  stop         Stop playback.
  status       Show what's playing now (slug<TAB>title, or "stopped").
  list         List known channels as slug<TAB>title lines.
USAGE
}

[[ $# -ge 1 ]] || { usage >&2; exit 1; }

case "$1" in
  play)
    [[ $# -eq 2 ]] || { usage >&2; exit 1; }
    omarchy-shell subjektivdk.dr-lyd play "$2"
    ;;
  stop)
    omarchy-shell subjektivdk.dr-lyd stop
    ;;
  status)
    omarchy-shell subjektivdk.dr-lyd status
    ;;
  list)
    omarchy-shell subjektivdk.dr-lyd list
    ;;
  -h|--help)
    usage
    ;;
  *)
    usage >&2
    exit 1
    ;;
esac
