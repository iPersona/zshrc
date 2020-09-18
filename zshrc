#" Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	git 
	brew 
	npm 
	node 
	zsh-autosuggestions
	d
	history-substring-search
	zsh-syntax-highlighting
    zsh-z
)

source $ZSH/oh-my-zsh.sh

# User configuration



###################################################
#
#		    路径设置
#
###################################################

export PATH="/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/iPersona/Documents/dev/android/android-sdk-macosx/tools:/Users/iPersona/Documents/dev/android/android-ndk-r8b"
# export MANPATH="/usr/local/man:$MANPATH"

###################
#   GIT 全局代理
###################
export http_proxy=http://127.0.0.1:1087
export https_proxy=$http_proxy

##########
#   GO
##########
export GOROOT="$(brew --prefix golang)/libexec"
export GOPATH=$HOME/Documents/dev/go
export GOBIN=$GOPATH/bin

#############
#    Rust
#############
CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$CARGO_HOME/bin
# 设置环境变量 RUSTUP_DIST_SERVER(用于更新 toolchain)
#export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
# 以及 RUSTUP_update_ROOT(用于更新 rustup)
#export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
#export RUST_SRC_PATH=$HOME/.rustup/toolchainu/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

#############
#   Python
#############
#export PYENV_ROOR="$HOME/.pyenv"
#export PATH=$PYENV_ROOT/shims:$PATH
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
# For compilers to find zlib you may need to set:
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl/include"

# 临时使用清华源来安装
alias pip3="pip install -i https://pypi.tuna.tsinghua.edu.cn/simple" 

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

###############
#  MY TOOLS
###############
MY_TOOLS=$HOME/Documents/dev/bin
export PATH=$PATH:$MY_TOOLS

# 启用 256 color mode
export TERM="screen-256color"
alias tmux="tmux -2"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}


#################################
#           常用别名
#################################
alias ll="lsd -la"

#################################
#
# NVM (Node Version Manager)
#
#################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


##########################################################
#
#                     常用指令简化
#
##########################################################
# Docker
docker_up_error() {
  docker logs --tail 50 --follow --timestamps $1 
}

alpine_ssh() {
  docker run -it $1 /bin/sh
}

# Rust
rup() {
  proxychains4 rustup update
}

# 修复 cargo blocking waiting for file lock on package cache
fix_cargo_hung() {
  rm ~/.cargo/.package-cache
}

# Proxychains4
edit_proxychains4_cfg() {
  vim /usr/local/etc/proxychains.conf
}

# Homebrew
# 参考[Homebrew/Linuxbrew 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)
brew_switch_tsinghua() {
    # brew 程序本身，Homebrew/Linuxbrew 相同
    git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

    # 以下针对 mac OS 系统上的 Homebrew
    git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
    git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
    git -C "$(brew --repo homebrew/cask-drivers)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git

    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    
    # 更换后测试工作是否正常
    brew update
}

brew_switch_official() {
    # brew 程序本身，Homebrew/Linuxbrew 相同
    git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git
    
    # 以下针对 mac OS 系统上的 Homebrew
    git -C "$(brew --repo homebrew/core)" remote set-url origin https://github.com/Homebrew/homebrew-core.git
    git -C "$(brew --repo homebrew/cask)" remote set-url origin https://github.com/Homebrew/homebrew-cask.git
    git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://github.com/Homebrew/homebrew-cask-fonts.git
    git -C "$(brew --repo homebrew/cask-drivers)" remote set-url origin https://github.com/Homebrew/homebrew-cask-drivers.git

    # 恢复变量，也可以直接注释掉
    export HOMEBREW_BOTTLE_DOMAIN=https://homebrew.bintray.com
}

########################
#        NeoVIM
########################
# 全部使用NeoVIM
alias vim="nvim"
alias vi="nvim"

# Config NeoVim
cfg_nvim() {
  nvim ~/.config/nvim/init.vim   
}

# 输出 python 相关log
# export NVIM_PYTHON_LOG_FILE=$HOME/Downloads/nvim_py_log


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
