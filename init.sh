#!/bin/zsh

# ####################################################################################
# Do use #!/bin/zsh NOT #!/bin/sh as the executing shell of this shell script.
# otherwise it will cause the following problem:
# ~/.oh-my-zsh/oh-my-zsh.sh: line 12: autoload: command not found
# ~/.oh-my-zsh/oh-my-zsh.sh: line 31: syntax error near unexpected token `('
# ~/.oh-my-zsh/oh-my-zsh.sh: line 31: `for config_file ($ZSH/lib/*.zsh); do'
# ####################################################################################

# symbol link to ~/.zshrc
shortcut=~/.zshrc
if [ -L $shortcut ]; then
  rm $shortcut
fi
ln -s ~/.my-zshrc/zshrc $shortcut

# reload config
source $shortcut
