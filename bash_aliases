alias gst='git status'
alias gc='git commit'
alias gca='git commit -a'
alias gm='git checkout master'
alias gp='git pull'
alias gpu='git push -u origin HEAD'
alias gitclean='git branch --merged | grep -v '^\*' | xargs -n 1 git branch -d'
alias gitvim="$EDITOR $(git ls-files -mo --exclude-standard)"

alias killswap='rm -rf ~/.local/share/nvim/swap/*'

alias cal="khal calendar now 14d"

alias todo="cat $HOME/cloud/notes/TODO.txt"
alias vitodo="$EDITOR $HOME/cloud/notes/TODO.txt"

vip() {
    $EDITOR $(which $1);
}

cap() {
    cat $(which $1);
}

# eee: easily echo env
e() {
    env | grep -i ^$1= | cut -d= -f2
}

s() {
    if [[ $1 == *"@"* ]]; then
        ssh -o stricthostkeychecking=no -o userknownhostsfile=/dev/null $@
    else
        ssh -o stricthostkeychecking=no -o userknownhostsfile=/dev/null root@$@
    fi
}

genpass() {
    if [[ $1 =~ ^[0-9]+$ ]]; then
        len=$1
    else
        len=20
    fi
    tr -dc A-Za-z0-9 </dev/urandom | head -c $len ; echo ''
}

mykey() {
    ssh-add ~/.ssh/$(hostname)
}
