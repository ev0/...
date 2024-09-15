# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias ls='ls -ahF'

g2='ev0'
alias g2ac='g2cu && git add . && git commit'
alias g2acp='g2cu && git add . && git commit -m '\''a'\'' && git push'
alias g2acr='g2cu && git add . && git commit -m '\''a'\'' && git rebase --root'
alias g2c='g2cu && git commit'

alias g2init='sh -c '\''cd ~/git/2 && mkdir "$1" && cd "$1" && git init && git config user.name $g2 && git config user.email $g2 && touch a && git add . && git commit -m "Init" && git remote add origin git@github-2:ev0/"$1".git && git branch -M main && git push -u origin main'\'' _'

alias g2p='g1cu && git push'
alias g2pf='g2cu && git push -f'
alias g2r="g2cu && git rebase -i --root"

alias gs="git status"
alias gr="git rebase -i --root"
alias gd="git diff"
alias gpf="git push --force"
