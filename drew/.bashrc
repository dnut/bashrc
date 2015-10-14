# Copyright Drew Nutter, GPL3
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors for prompt, first is default
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
PS1='\[\e[1;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[0;37m\]'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias splivpn='sudo openvpn /etc/openvpn/east-split.ovpn &'
alias eth='sudo sh /home/drew/scripts/eth'
alias asd='sudo pacman -Syu'
alias ...='cd ..'
alias ix="curl -F 'f:1=<-' ix.io 2>/dev/null | tee /dev/tty | xclip -selection c"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias cdmusic="cd /media/sam/DATA/_Music/Compilation"
alias cdfilm="cd /media/hit/DATA/Video/Film"
alias cdtv="cd /media/hit/DATA/Video/TV"
alias nethuh='ping -c 1 8.8.8.8'
alias ovstatus="terminator -e 'watch --color systemctl status openvpn@airvpn'&"


function updatevid {
	rm -rf /home/drew/Video/TV && mkdir /home/drew/Video/TV
	rm -rf /home/drew/Video/Film && mkdir /home/drew/Video/Film
	ln -s /drv/vid/TV/* /home/drew/Video/TV
	ln -s /drv/wd/Video/TV/* /home/drew/Video/TV
	ln -s /drv/vid/Film/* /home/drew/Video/Film
	ln -s /drv/wd/Video/Film/* /home/drew/Video/Film
}
function da {
	xterm -e watch -tn 1 "(echo -e '\033[32mGID\t\t Name\t\t\t\t\t\t\t%\tDown\tSize\tSpeed\tUp\tS/L\tTime\033[36m'; \
	diana list| cut -c -112; echo -e '\033[37m'; diana stats)"
}
function pc {
        ps -ely|grep CMD
        ps -ely|grep $@
}
function ipinfo {
	curl -s ipinfo.io/`curl -s icanhazip.com`|perl -pe 's/\"//g;s/{//g;s/}//g;s/,\n/\n/g'
	echo
}
function linux {
        run=$(uname -r)
        inst=$(pacman -Q linux-lqx)
	latest=$(package-query --aur-url https://aur4.archlinux.org -A linux-lqx | awk '{print $1,$2}')
        echo "Running: $run"
        echo "Installed: $inst"
	echo "Latest: $latest"
}
function mestart {
	sudo echo good
	sudo sh /home/drew/scripts/eth &
	startx
}
function texit {
	pdflatex $1
	evince `echo $1 | awk 'BEGIN{FS=".";OFS="."} {
		if (NF > 1) {
			$NF=""
			print $0 "pdf"
		} else {
			print $0,"pdf"
		}
	}'`&
}
function xelatexit {
        xelatex $1
        evince `echo $1 | awk 'BEGIN{FS=".";OFS="."} {
                if (NF > 1) {
                        $NF=""
                        print $0 "pdf"
                } else {
                        print $0,"pdf"
                }
        }'`&
}
