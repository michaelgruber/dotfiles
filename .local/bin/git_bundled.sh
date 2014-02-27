#!/bin/sh
DEST=~/Dropbox/Git\ Backups/
REPO=$(basename "`git rev-parse --show-toplevel`")
 
(git bundle create "${DEST}${REPO}.bundle" --all)
