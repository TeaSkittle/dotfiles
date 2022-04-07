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

# Function
function xlist
    ls -al | grep -Ei '^[rwx-]{9}x' | awk '{print $9}' | tail -n +2
end
