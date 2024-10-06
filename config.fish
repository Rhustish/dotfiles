set -g fish_greeting
set -x ANDROID_HOME /home/rhust/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/platform-tools
if status is-interactive
    starship init fish | source
    cat $HOME/.cache/wal/sequences
end

# List Directory
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
abbr pacman 'sudo pacman'
abbr purge "sudo pacman -Sc && yay -Yc && paccache -rk0 && rm -fr ~/.cache/yay/*"
abbr ya "yazi"
abbr  tcp "cd $HOME/Programming/HowToAll/CPP/ && nvim temp.cpp"
#user
alias :q="exit"
alias yeet="sudo pacman -Rncsuv"
alias h="Hyprland"
alias vi="nvim"
alias vim="nvim"

# Created by `pipx` on 2024-10-01 21:21:54
set PATH $PATH /home/rhust/.local/bin
