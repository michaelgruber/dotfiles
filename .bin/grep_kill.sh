grep_kill () {
    processes=$(ps -e | grep "$@" | grep -v grep)

    if [ "$processes" == '' ]; then
        echo "No processes matching $@."
    else
        hit_list="$(echo "$processes" | awk '{print $1}' )"

       echo "$hit_list" | xargs kill -9
        __announce_slain "$processes"
    fi
}

__announce_slain () {
    slain="$(echo "$1" | awk '{ if ($5) { print $5 } else { print $4 } }' )"

    echo "KILLED:"
    echo "$(echo "$slain" | awk -F/ '{print $NF}' )"
}
