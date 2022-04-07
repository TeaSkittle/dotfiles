# Fish Config

# Disable fish greeting
set fish_greeting

# Custom prompt
function fish_prompt
    printf '%s%s%s λ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

# Aliases
alias clock="date +'%Y-%m-%d %H:%M:%S'"
alias rb="rm *~"
alias lock="i3lock -c 000000 -n"
alias em="emacs -nw"
alias cls="clear"
alias masscp="rsync -ah --progress"

# Functions
function cheat 
    curl -s cheat.sh/$argv
end

function scr 
    ~/.scripts/$argv[1] $argv[2]
end

function "lscr" 
    ls ~/.scripts/
end

function xlist -d "List executable files"
    set_color green
    tput bold
    ls -al | grep -Ei '^[rwx-]{9}x' | awk '{print $9}'
    tput sgr0
    set_color normal
end

