# Open Neovim config
alias nvimconfig='cd ~/.config/nvim/ && nvim .'

alias cr="cargo run"
alias ct="cargo test"

# ssh into UT lab computers
alias utcs1="ssh nathanb@hayek.cs.utexas.edu"
alias utcs2="ssh nathanb@descartes.cs.utexas.edu"

# Open zshrc config
function z() {
  if [[ $1 == "r" ]]; then
      eval "source ~/.zshrc"
  else
      eval "nvim ~/.zshrc"
  fi
}

# Open jupyter notebook shortcut
function nb() {
    if [[ $1 == "new" ]]; then
        python -c "import json; data = {'cells': [], 'metadata': {}, 'nbformat': 4, 'nbformat_minor': 4}; f = open('$2.ipynb', 'w'); json.dump(data, f); f.close()"
        jupyter notebook $2.ipynb
    else
        jupyter notebook $1
    fi
}

# Open project
function cdf() {
  if [[ $# -eq 1 ]]; then
      selected=$1
  else
      selected=$(find ~/Code ~/Code/archive ~/Notes -mindepth 1 -maxdepth 1 -type d | fzf)
  fi

  if [[ -z $selected ]]; then
      return
  fi

  cd "$selected"
}

# Makes shell beautiful
eval "$(starship init zsh)"

# Prints art to console on startup
neofetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nathanbarry/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nathanbarry/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/nathanbarry/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nathanbarry/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
export PATH="$PATH:/usr/local/bin/code"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
