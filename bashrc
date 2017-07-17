# Prevent duplicates in history
HISTCONTROL=ignoredups:erasedups
# Infinite history
HISTSIZE=-1
HISTFILESIZE=-1
# Don't overwrite; good for multiple bash sessions
shopt -s histappend
# Update window size after each command
shopt -s checkwinsize

export VISUAL="vim"
export EDITOR="vim"

red="\[\e[1;31m\]"
green="\[\e[1;32m\]"
blue="\[\e[1;34m\]"
white="\[\e[0;37m\]"

if [[ $(whoami) == 'root' ]]; then
    PS1="$red\u@$HOSTNAME \W \$ $white"
else
    PS1="$green\u@$HOSTNAME $blue\W $green\$ $white"
fi

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -al'
alias grep='grep --color=auto'
alias ...="cd .."
alias asd="sudo pacman -Syu"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias nethuh="ping -c 1 8.8.8.8"
alias py="python -c"

cs () {
	cd $@ && ls
}
random () {
	# Return random string of length $@ or 20.
	# Negative returns infinity.
	chars=20    # Default if not given int.
	if [[ $@ =~ ^-?[0-9]+$ ]]; then
		chars=$@
	fi
	tr -cd "[:graph:]" < /dev/random | head -c $chars
}
ssh () {
	if ! pgrep -u $USER ssh-agent > /dev/null; then
		ssh-agent > ~/.ssh-agent-thing
		eval $(<~/.ssh-agent-thing)
		ssh-add ~/.ssh/id_ed25519
	fi
	if [[ "$SSH_AGENT_PID" == "" ]]; then
		eval $(<~/.ssh-agent-thing)
	fi
	/usr/bin/ssh $@
}
ix () { 
	curl -F 'f:1=<-' ix.io 2>/dev/null | tee /dev/tty | xclip -selection c;
}
cpc () {
	# Simple C++ compiler tool
	g++ $1".cpp" -o $1".out"
	chmod 755 $1".out"
}
ear () {
	# Execute And Return
	./$1".out"
	echo "Returns: "$?
}
car () {
	cpc $1
	ear $1
}
flac2mp3 () {
	for a in *.flac; do
		ffmpeg -i "$a" -qscale:a $@ "${a[@]/%flac/mp3}"
	done
}
= () {
	calc="${@//p/+}"
	calc="${calc//x/*}"
	bc -l <<<"scale=10;$calc"
}
da () {
	xterm -e watch -tn 1 "(echo -e '\033[32mGID\t\t Name\t\t\t\t\t\t\t%\tDown\tSize\tSpeed\tUp\tS/L\tTime\033[36m'; \
	diana list| cut -c -112; echo -e '\033[37m'; diana stats)"
}
pc () {
        ps -ely|grep CMD
        ps -ely|grep $@
}
ipinfo () {
	echo -e '\nIPv4 Information:'
	curl -s ipinfo.io/`curl -s ip4.icanhazip.com`|perl -pe 's/\"//g;s/{//g;s/}//g;s/,\n/\n/g'
    echo -e '\nIPv6 Information:'
	curl -s ipinfo.io/`curl -s ip6.icanhazip.com`|perl -pe 's/\"//g;s/{//g;s/}//g;s/,\n/\n/g'
    echo
}
