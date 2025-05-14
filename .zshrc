# ssh into UT lab computers
alias utcs1="ssh nathanb@hayek.cs.utexas.edu"
alias utcs2="ssh nathanb@descartes.cs.utexas.edu"

# New daily note
function daily() {
    cd ~/Notes/daily
    if [ ! -e "$(date +"%Y-%m-%d").md" ]; then
        echo "# $(date +"%Y-%m-%d")" > "$(date +"%Y-%m-%d").md"
        echo "File created successfully."
    fi
    nvim "$(date +"%Y-%m-%d").md"
}

# Open jupyter notebook shortcut
function nb() {
    local file="${1%.ipynb}.ipynb"

    if [[ -z "$1" ]]; then
        echo "Usage: nb <notebook_name>"
        return 1
    fi

    if [[ ! -f "$file" ]]; then
        python -c "import json; data = {'cells': [], 'metadata': {}, 'nbformat': 4, 'nbformat_minor': 4}; open('$file', 'w').write(json.dumps(data))"
    fi

    jupyter notebook "$file"
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

# Path stuff
export PATH="$PATH:/usr/local/bin/code"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
