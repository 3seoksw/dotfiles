# Zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "esc/conda-zsh-completion"
#plug "jeffreytse/zsh-vi-mode"

# zsh Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bold,underline"

# Homebrew Setup
if [[ $(uname -m) == 'arm64' ]]; then
    BREWPATH=/opt/homebrew/bin
else
    BREWPATH=/usr/local/bin
fi
export PATH=$BREWPATH:$PATH

# PATH Variables
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.local/bin/lvim:$PATH"
export PATH="/Applications/ARM/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/Users/kws/anaconda3/bin:$PATH"

export OPENAI_API_KEY=""
export VISUAL="/opt/homebrew/bin/nvim"
export EDITOR="/opt/homebrew/bin/nvim"

# aliases
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias la='ls -a'
alias psql='/Applications/Postgres.app/Contents/Versions/15/bin/psql -p5432'
alias h2='/Applications/h2/bin/h2.sh'
alias gptcli="python3 $HOME/Documents/github/gptcli/src/gptcli.py"
alias icloud="cd /Users/kws/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.1.2

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kws/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kws/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kws/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kws/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda config --set changeps1 False
# <<< conda initialize <<<

alias t2m="python3 $HOME/Documents/github/latex-mathjax/main.py"

eval "$(starship init zsh)"
