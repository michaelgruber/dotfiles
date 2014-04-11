__processes=''

__grep_process () {
    __processes=$(ps -e | grep "$@" | grep -v grep)

    if [ "$__processes" == '' ]; then
        echo "No processes matching $@."
        return 1
    else
        return 0
    fi
}

__announce () {
    slain="$(echo "$1" | awk '{ if ($5) { print $1, $5 } else { print $1, $4 } }' )"

    echo "$(echo "$slain" | awk -F/ '{ print $1, $NF }' )"
}

grep_kill () {
    if __grep_process $@; then
       hit_list="$(echo "$__processes" | awk '{print $1}' )"

       echo "$hit_list" | xargs kill -9

       echo "KILLED"
        __announce "$__processes"
    fi
}

grep_process_list () {
    if __grep_process $@; then
        echo "PROCESSES:"
        __announce "$__processes"
    fi
}
