alias gst='git status'
alias gc='git commit'
alias gca='git commit -a'
alias gm='git checkout master'
alias gp='git pull'
alias gpu='git push -u origin HEAD'
alias gitclean='git branch --merged | grep -v '^\*' | xargs -n 1 git branch -d'
alias gitvim='vim $(git ls-files -mo --exclude-standard)'

alias dc='docker-compose'
alias drmv='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias drmc='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias drmi='docker rmi $(docker images -a --filter=dangling=true -q)'
alias drma="drmv && drmc && drmi"

alias serve="ls -la; hostname -I | cut -f 1 -d ' '; python2 -m SimpleHTTPServer"
