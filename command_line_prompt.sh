# Copy into .bash_profile
cd ~/code/webmap-onxmaps/code/webmap/src

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

get_random_emoji() {
  emojis=(
    "(╯°□°）╯︵ ┻━┻"
    "(ლಠ益ಠ)ლ "
    "¯\(°_o)/¯"
    "\(• ◡ •)/"
    "( ⓧ _ ⓧ )"
    '/|\ ^._.^ /|\'
    "¯\(°_o)/¯"
    "	_(:3」∠)_"
    "¯\_(ツ)_/¯"
    "ʕ•ᴥ•ʔ"
    "(ง'̀-'́)ง"
    "(ಠ╭╮ಠ)"
    "ლ(ಠ益ಠლ)"
    "~(˘▾˘~)"
    "ᕦ(ò_óˇ)ᕤ"
    "⚆ _ ⚆"
    "(°ロ°)"
    "ಠ ~ ಠ"

  )
  echo ${emojis[$RANDOM % ${#emojis[@]} ]}
}

export PS1="\e[0;35m<3 \e[0;36m\W\e[0;33m\$(parse_git_branch) \e[0;32m\$(get_random_emoji) \e[0;37m"

alias commit="git commit -a -m"
alias push="git push"
alias develop="git checkout develop"
alias copy='git branch | grep '\''^\*'\'' | cut -d'\'' '\'' -f2 | tr -d '\''\n'\'' | pbcopy'

pull(){
  count=$(git pull | echo | grep "code/webmap/src/package-lock.json")
  if [ -z $count ]
  then
      echo "no package updates"
  else
      npm i
  fi
}
checkout(){
  git branch | grep "$1" | xargs git checkout
}
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/maria.eskro/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/maria.eskro/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/maria.eskro/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/maria.eskro/Downloads/google-cloud-sdk/completion.bash.inc'; fi
