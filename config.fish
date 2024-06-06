set -g fish_greeting

if status is-interactive
    starship init fish | source
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

#user

alias yeet="sudo pacman -Rncsuv"
alias h="Hyprland"
alias vi="nvim"
alias vim="nvim"
