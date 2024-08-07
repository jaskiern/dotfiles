alias ls='ls -F --color'

setopt prompt_subst

autoload -Uz add-zsh-hook vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' (%b%u%c)'

setopt PROMPT_SUBST
autoload -U colors && colors
PROMPT='%{$fg[green]%}@%m%{$reset_color%}:%{$fg[blue]%}${PWD/#$HOME/~}%{$fg[red]%}${vcs_info_msg_0_} %{$fg[yellow]%}%#%{$reset_color%} '

