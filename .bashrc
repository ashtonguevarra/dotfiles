#
# ~/.bashrc
#

# If not running interactively, don't do anything

## Custom Terminal Displays by Ashton :))
# figlet -f DeltaCorpsPriest1 Ashton
  pokemon-colorscripts --no-title --name eiscue
# figlet -f "red_phoenix.flf" "Ashton" -k
# fastfetch

[[ $- != *i* ]] && return

alias nap='systemctl suspend'
alias die='shutdown now'
alias rm='rm -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\d \W]\$ '

export PATH=$PATH:/home/ashton/.spicetify
echo "PATH=$PATH:~/.config/rofi/scripts" >> ~/.profile

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init bash)"

# set an ad-hoc GUI timer
timer() {
  local N=$1; shift

  (sleep $N && zenity --info --title="Time's Up" --text="${*:-BING}") &
  echo "timer set for $N"
}
