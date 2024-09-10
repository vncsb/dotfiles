# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/vncsb/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#Powerlevel10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZLE_RPROMPT_INDENT=0

# Define default editor and vi as nvim
export VISUAL=nvim
export EDITOR=nvim
alias vi="nvim"

# Auto start tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

# Auto start tmux logging
SHOULD_LOG="${TMUX_LOGGING:-false}"
if [ ! -z $TMUX ] && [ "$SHOULD_LOG" = true ]; then
  $HOME/.ensure-tmux-logging.sh
fi

# Install asdf-vm
if [ -d "/opt/asdf-vm" ]
then
  . /opt/asdf-vm/asdf.sh
fi

# Add pip packages to path
export PATH="$HOME/.local/bin/:$PATH"

# Add cargo binaries to path
export PATH="$HOME/.cargo/bin/:$PATH"

# Aliases
alias ls="exa -l -a -h --icons --group-directories-first --time-style=long-iso"

# Case insensitive completions 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colors on completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# zsh-vi-mode plugin configuration
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

function zvm_after_init() {

  # Search history based on autocomplete 
  bindkey '^p' history-search-backward
  bindkey '^n' history-search-forward

  # Accept autocomplete
  bindkey '^ ' autosuggest-accept
}

# Setting up fzf
if command -v fzf &> /dev/null
then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'
  bindkey '^R' fzf-history-widget
fi

# Setting up zoxide
eval "$(zoxide init zsh)"
