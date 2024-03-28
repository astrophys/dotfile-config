if tty > /dev/null
then
    echo "Hello Ali from bashrc"
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    
    # Permit usage of vim commands in the terminal
    set -o vi
    
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
