if tty > /dev/null
then
    echo "Hello Ali from bashrc"
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    
    # Permit usage of vim commands in the terminal
    set -o vi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
    esac

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt
    
    export PS1="local: \W $ "
    #export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;49;31'
    
    alias ll='ls -l'
    alias la='ls -a'
    alias l='ls'
    alias more='more -N -G'
    alias grep='grep -E --color=auto'
    alias cp='cp -p'
    alias scp='scp -p'
fi
