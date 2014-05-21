#!/bin/sh

declare -A DEPS=(
    ["rvm"]="Follow instructions at http://rvm.io/rvm/install"
    ["jsctags"]="required for vim Tagbar plugin 'git clone https://github.com/faceleg/doctorjs.git', 'git submodule update --init --recursive', and 'sudo make install'."
)

declare -A MAC_DEPS=(
    ["brew"]="Follow instructions at https://github.com/Homebrew/homebrew/wiki/Installation"
    ["ack"]="required for vim ack.vim plugin 'brew install ack'"
    ["mvim"]="'brew install macvim --override-system-vim', and 'brew linkapps'"
    ["git"]="How can this be? 'brew install git'"
    ["ctags"]="required for vim Tagbar plugin 'brew install ctags-exuberant'"
)


missing=()

__check_dep_list () {
    [[ -z "$1" ]] && list="DEPS" || list="${1}_DEPS"

    for dep in $(eval echo "\${!$list[@]}") ; do
        if (! eval "command -v $dep >/dev/null 2>&1") ; then
            missing+=("Can't find \"$dep\" $(eval echo "\${$list["$dep"]}")")
        fi
    done
}

__print_misses () {
    if [ ${#missing[@]} -ne 0 ]; then
        printf "\nScheiße! Missing programs!"
        printf "\n===========================\n"

        for miss in "${missing[@]}"; do echo "$miss" ; done

        printf "\n"
    fi
}

run_install_list_check () {
    # *nix
    __check_dep_list

    # OS X
    if [[ $OSTYPE == darwin* ]] ; then __check_dep_list 'MAC' ; fi

    # Linux
    #if [[ $OSTYPE == linux-gnu ]] ; then __check_dep_list 'LINUX' ; fi

    __print_misses
}
