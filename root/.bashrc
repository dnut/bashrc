alias eth='sh /home/drew/scripts/eth'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias splivpn='openvpn /etc/openvpn/east-split.ovpn &'
alias asd='pacman -Syu'
alias ...='cd ..'
alias ix="curl -F 'f:1=<-' ix.io 2>/dev/null | tee /dev/tty | xclip -selection c"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias cdmusic="cd /media/sam/DATA/_Music/Compilation"
alias cdfilm="cd /media/hit/DATA/Video/Film"
alias cdtv="cd /media/hit/DATA/Video/TV"
alias net?='ping -c 1 8.8.8.8'

function sysdall {
        systemctl start $1
        systemctl enable $1
        systemctl status $1
}

function pc {
        ps -ely|grep CMD
        ps -ely|grep $@
}
function sysdall {
        systemctl start $1
        systemctl enable $1
        systemctl status $1
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




#PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
PS1='\[\e[1;31m\]\u\[\e[m\] \[\e[1;31m\]\W\[\e[m\] \[\e[1;31m\]\$\[\e[m\] \[\e[0;37m\]'
