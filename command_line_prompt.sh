# Copy into .bash_profile

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
  )
  echo ${emojis[$RANDOM % ${#emojis[@]} ]}
}

export PS1="\e[0;35m\t \e[0;36m\W\e[0;33m\$(parse_git_branch) \e[0;32m\$(get_random_emoji) \e[0;37m"