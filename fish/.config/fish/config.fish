# Fish Config

# Aliases
alias clock="date +'%Y-%m-%d %H:%M:%S'"
alias rb="rm *~"
alias lock="i3lock -c 000000 -n"
alias em="emacs -nw"
alias cls="clear"

# Functions
function cheat
    curl -s cheat.sh/$argv
end
