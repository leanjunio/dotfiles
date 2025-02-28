# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zconfig="nvim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Example aliases
alias zconfig="nvim ~/.zshrc"
alias rez="source ~/.zshrc"
alias mine="sudo chown -R ljunio ."
alias iconfig="nvim ~/.config/i3/config"
alias rboot="sudo systemctl reboot"

# Labnetik Aliases
alias clab="cd /home/ljunio/Documents/work/gyro/labnetik-project/master"
alias initdb="yarn initialize-db"
alias gsetup="yarn install && yarn pull-dev-secrets"
alias dup="docker-compose -f docker-compose.dev.yml up --build"
alias ddown="docker-compose -f docker-compose.dev.yml down"
alias dbuild="docker-compose -f docker-compose.dev.yml build"
alias dlogs="docker-compose logs --follow"
alias lci="yarn run-ci-checks"

function drun {
  docker_file=$(find -maxdepth 1 -name "docker-compose*")
  docker-compose -f ${docker_file} up --build
}

function dstop {
  docker-compose stop
}

function dprune {
  docker system prune
  docker volume prune
}

# setups the SSL for local development
function cert {
  mkcert -install
  cd apps/server/src/assets/ssl
  mkcert localhost
  cd -
}

# alias ohmyzsh="mate ~/.oh-my-zsh"

# Git functions
function gnt {
  git worktree add ../${1} -b ${2}
}

function gclean {
  git branch --merged main | grep -v '^[ *]*main$' | xargs git branch -d
}

function gwt {
  git worktree add ../${1} ${2}
}

function mep {
  git config --local user.name "Lean Junio"
  git config --local user.email "leanjunio@live.com"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Git stuff
function gpt {
  git remote set-url origin github.com-leanjunio:leanjunio/${1}.git
}

function gap {
  git remote add origin git@github.com-leanjunio:leanjunio/${1}.git
}

function gcp {
  git clone git@github.com-leanjunio:leanjunio/${1}.git ${2}
}

# Transfers the staging data into the mongo container dev is running in
# TODO: update this to fetch from staging database
function seedlocal {
  docker_id=$(docker ps | grep 'mongo' | cut -f 1 -d ' ')

  if [ -z "$docker_id" ]
  then
    echo "No mongo container found!"
  else
    docker cp ~/Documents/work/gyro/staging-data/. ${docker_id}:/staging-data

    cd ~/Documents/work/gyro/staging-data
    files=(*)
    for file in "${files[@]}"; do
      echo "Importing ${file}"
      docker exec -d ${docker_id} mongoimport -d labnetic -c ${file%.*} --type json --file /staging-data/${file} --jsonArray
    done
  fi
}

function work {
  clab
  tmux new-session -d -s "labnetic"
  tmux send-keys -t labnetic.0 "dup" Enter
  tmux split-window
  tmux send-keys -t labnetic.1 "code ." Enter
  tmux attach -t labnetic
}

alias cmine="cd ~/Documents/personal"

alias kconfig="nvim ~/.config/kitty/kitty.conf"

