# Disable fish greeting
set fish_greeting

# Custom prompt
function fish_prompt
    printf '%s%s%s λ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

# Aliases
alias clock="date +'%Y-%m-%d %H:%M:%S'"
alias rb="rm *~"
alias cls="clear"
alias masscp="rsync -ah --progress"
alias cisco="sudo screen /dev/ttyUSB0"
alias reload="source ~/.config/fish/config.fish"
alias em="emacs -nw"
alias xlist="ls -al | grep -Ei '^[rwx-]{9}x' | cut -c 43-"
alias sx="startx"

# Functions
function owncat -d "Neatly print out file permissions"
    echo -n "Owner: "; ls -l $argv | awk '{print $3}'
    echo -n "Group: "; ls -l $argv | awk '{print $4}'
    echo -n "r/w/x: "; ls -l $argv | awk '{print $1}' | sed 's/#\\.//'
    echo "Octal: "; stat -c '%a %n' $argv | awk '{print $1}'
end
