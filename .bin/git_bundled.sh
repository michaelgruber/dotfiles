#!/bin/sh

function git_bundled () {
    DEST='~/Dropbox/Git\ Backups/'
    REPO=$(basename "`git rev-parse --show-toplevel`")

    eval "git bundle create "${DEST}${REPO}.bundle" --all"
}
