alias gst='git status'
alias gc='git commit'
alias gd='git diff'
alias gca='git commit -a'
alias gm='git checkout master 2>/dev/null || git checkout main'
alias gp='git pull -p'
alias gpu='git push -u origin HEAD'
alias gitclean='git branch --merged | grep -v '^\*' | xargs -n 1 git branch -d'

alias killswap='rm -rf ~/.local/share/nvim/swap/*'

alias dc='docker-compose'
alias drmv='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias drmc='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias drmi='docker rmi $(docker images -a --filter=dangling=true -q)'
alias drma="drmv && drmc && drmi"

alias cal="khal calendar now 14d"

alias todo="cat $HOME/cloud/notes/TODO.txt"
alias vitodo="$EDITOR $HOME/cloud/notes/TODO.txt"
alias f="feh --scale-down --auto-zoom $@"

add() {
    awk '{sum+=$1} END {print sum}' $@
}

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

gitvim() {
    git ls-files -mo --exclude-standard | xargs $EDITOR
}
