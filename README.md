# bashrc
Personalized bashrc with several useful functions and aliases.

I put this at /etc/bashrc_drew in every system. I then source it into every user's ~/.bashrc, adding user or system specific or overriding content underneath.

## Installation
```bash
wget -O /etc/bashrc.drew https://raw.githubusercontent.com/dnut/bashrc/master/bashrc
sed -i '1s_^_. /etc/bashrc.drew\n_' $HOME/.bashrc
```
