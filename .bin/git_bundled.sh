#!/bin/sh
DEST='~/Dropbox/Git\ Backups/'
REPO=$(basename "`git rev-parse --show-toplevel`")

eval "git bundle create "${DEST}${REPO}.bundle" --all"
