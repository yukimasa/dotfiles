# インストールしたコマンドを認識させる
zstyle ":completion:*:commands" rehash 1

#
# Prezto
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# プロンプトテーマの設定
autoload -Uz promptinit
promptinit
prompt pure # テーマ指定

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'

#
# Homebrew
#

eval "$(/opt/homebrew/bin/brew shellenv)"

#
# zsh-completions
#

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  # 補完ライブラリ読み込み
  autoload -Uz compinit && compinit
fi

#
# PATH
#

export PATH="/usr/local/opt/gettext/bin:$PATH"

typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)
eval "$(anyenv init -)"

#
# エイリアス
#

# exaをインストールしておく "brew install exa"
if [[ $(command -v exa) ]]; then
  alias ls='exa --time-style=long-iso -g --icons'
  alias ll='ls --git --time-style=long-iso -gl'
  alias la='ls --git --time-style=long-iso -agl'
  alias lt='exa -T -L 3 -a -I "node_modules|vendor|.git|.cache" --icons'
  alias lta='exa -T -a -I "node_modules|vendor|.git|.cache" --color=always --icons | less -r'
  alias l='clear && ls'
fi

# batをインストールしておく "brew install bat"
if [[ $(command -v bat) ]]; then
	alias cat='bat'
fi
