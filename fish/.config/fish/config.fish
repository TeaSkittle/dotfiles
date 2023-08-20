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

# Functions (will eventually move to own function files)
function owncat -d "Neatly print out file permissions"
    echo -n "Owner: "; ls -l $argv | awk '{print $3}'
    echo -n "Group: "; ls -l $argv | awk '{print $4}'
    echo -n "r/w/x: "; ls -l $argv | awk '{print $1}' | sed 's/#\\.//'
    echo "Octal: "; stat -c '%a %n' $argv | awk '{print $1}'
end

function zippo -d "Extract common compression formats"
    if test -f $argv
        switch $argv
            case '*.tar.bz2'
                tar xjf $argv
            case '*.tar.gz'
                tar xzf $argv
            case '*.bz2'
                bunzip2 $argv
            case '*.rar'
                rar x $argv
            case '*.gz'
                gunzip $argv
            case '*.tar'
                tar xvf $argv
            case '*.tbz2'
                tar xjf $argv
            case '*.tgz'
                tar xzf $argv
            case '*.zip'
                unzip $argv
            case '*.Z'
                uncompress $argv
            case '*.7z'
                7za x $argv
            case '*.xz'
                xz -d $argv
            case '*'
                echo $argv cannot be extracted via zippo
        end
    end
end
