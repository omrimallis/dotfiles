alias ll='ls -la'

# fzf
eval "$(fzf --zsh)"

# completions
fpath=(~/.zsh $fpath)

zstyle ':completion:*:*:git:*' script ~/.zsh/.git-completion.bash

autoload -Uz compinit && compinit

# git intrgration for the prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'

# prompt
PROMPT="%B%F{green}%n@%m%f%b:%B%F{cyan}%~%f%b$ "

# add macvim to path
PATH="/Applications/MacVim.app/Contents/bin:$PATH"
# add versionless 'python' and 'pip' to path
PATH="$(brew --prefix python)/libexec/bin:$PATH"
