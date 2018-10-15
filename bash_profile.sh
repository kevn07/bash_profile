# Define some colours
RESET="\[\033[0m\]"
RED="\[\033[31;1m\]"
GREEN="\[\033[0m\]"
BLUE="\[\033[34m\]"
YELLOW="\[\033[38;5;142m\]"

complete -C '/Users/P779589/Library/Python/2.7/bin/aws_completer' aws

export HISTCONTROL=ignoreboth:erasedups

git_prompt=/Applications/Xcode-10.0.app/Contents/Developer/usr/share/git-core/git-prompt.sh
[[ -r $git_prompt ]] && source $git_prompt
git_complete=/Applications/Xcode-10.0.app/Contents/Developer/usr/share/git-core/git-completion.bash
[[ -r $git_complete ]] && source $git_complete

PS1="${BLUE}\u${RESET}@\h:${RED}\W ${YELLOW}\$(__git_ps1 '(%s)')${RESET}$ "

# Custom Functions
if [ -f ~/.custom_functions ]; then
  source ~/.custom_functions
fi

PATH=$PATH:/Users/P779589/Documents/Software/apache-maven-3.3.9/bin/
PATH=$PATH:/Users/P779589/Documents/Software/packer-1.1.2
PATH=$PATH:/Users/P779589/Documents/Software/kubectl-v1.8.5
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/Users/P779589/Library/Python/2.7/bin

alias pipupgradeall="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
