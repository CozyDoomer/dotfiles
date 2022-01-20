set -U fish_greeting ""

export VISUAL="vscodium"
export EDITOR="lvim"
export BROWSER="firefox"

export timestamp_timeout=60
export timestamp_type=global

source ~/.cache/wal/colors.fish

# Use rg instead of ag / ack / grep for fzf (much faster)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --color=16'

# Required to make gpg-agent work in cases like git commit
export GPG_TTY=(tty)

# Add color to man pages
set -x -U LESS_TERMCAP_md (printf "\e[01;31m")
set -x -U LESS_TERMCAP_me (printf "\e[0m")
set -x -U LESS_TERMCAP_se (printf "\e[0m")
set -x -U LESS_TERMCAP_so (printf "\e[01;44;30m")
set -x -U LESS_TERMCAP_ue (printf "\e[0m")
set -x -U LESS_TERMCAP_us (printf "\e[01;32m")

# Always use the default keybindings in fish
fish_default_key_bindings

alias nvim="lvim"
alias ssh="kitty +kitten ssh"

# Use exa as a drop-in replacement for ls and tree (faster, more colors, etc.)
alias ls="exa --group-directories-first"
alias tree="exa --group-directories-first --long --tree -I 'node_modules|lib|.git'"
alias discord='discord --no-sandbox'

# Abbreviations are aliases that expand
if not set -q set_abbr
    set -U set_abbr
    abbr g git
    abbr ga "git add"
    abbr gaa "git add --all"
    abbr gap "git add --patch"
    abbr gb "git branch --verbose" # List all branches
    abbr gc "git commit -m"
    abbr gca "git commit --amend"
    abbr gco "git checkout"
    abbr gd "git diff" # Show all file changes not staged yet
    abbr gds "git diff --staged" # Show changes staged but not committed
    abbr gi "git init"
    abbr gl "git log --oneline --decorate --all --graph -n 10"
    abbr gm "git merge"
    abbr gp "git push" # Push your commits to a remote server
    abbr gr "git reset HEAD~" # Undo the last commit but keep changed files
    abbr gre "git remote --verbose" # List all remotes
    abbr grh "git reset HEAD"
    abbr grr "git reset --hard HEAD~" # Remove the last commit and all changes with it
    abbr gs "git status"
    abbr gt "git tag"
    abbr gts "git tag -s"

    abbr dl youtube-dl
    abbr copy "xclip -sel clip <" # Easily copy the contents of any file
    abbr dog "pygmentize -g" # "dog" is a colorful version of cat
    abbr cf "tput reset" # Clear the terminal completely

    abbr b "feh --bg-fill" # Change the background
    abbr c clear # Because 5 letters is too much
    abbr e exit
    abbr l "ls -l"
    abbr T tree
    abbr r ranger
    abbr lv lvim
end

function bwl
  export BW_SESSION=(bw unlock --raw)
end

function bwp
  bw get password $argv | xclip -sel clip
end

function bwu
  bw get username $argv | xclip -sel clip
end

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/cozy/miniconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
