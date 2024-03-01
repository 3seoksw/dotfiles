# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "esc/conda-zsh-completion"
plug "romkatv/powerlevel10k"
#plug "jeffreytse/zsh-vi-mode"

# zsh Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bold,underline"

# LunarVim
export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$HOME/.local/share/lunarvim"}"
export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$HOME/.config/lvim"}"
export LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-"$HOME/.cache/lvim"}"
export LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$HOME/.local/share/lunarvim/lvim"}"


# PATH Variables
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.local/bin/lvim:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/ARM/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/Users/kws/anaconda3/bin:$PATH"

#export CXX="/Applications/ARM/bin/arm-none-eabi-g++"
export OPENAI_API_KEY=""

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

# Jekyll

# Java Project Creation Alias
function mymvn() {
  local project_name="$1"
  local group_name="$2"
    if [ -z "$group_name" ]; then
      echo "Usage: javaproj PROJECT-NAME GROUP-NAME"
      return 1
    fi

    mvn archetype:generate -DgroupId="$group_name" -DartifactId="$project_name" -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
}


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
# <<< conda initialize <<<

alias t2m="python3 $HOME/Documents/github/latex-mathjax/main.py"
