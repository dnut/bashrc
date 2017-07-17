# bashrc
Personalized bashrc with several useful functions and aliases.

I put this at /etc/bashrc_drew in every system. I then source it into every user's ~/.bashrc, adding user-specific content underneath.

## Installation
```bash
sudo wget -O /etc/bashrc.drew https://raw.githubusercontent.com/dnut/bashrc/master/bashrc

# Uncomment this to put it at the top of your file to give your current bashrc priority in conflicts
# sed -i '1s_^_. /etc/bashrc.drew\n_' $HOME/.bashrc

# Uncomment this to put it at the bottom of your file to give my bashrc priority in conflicts.
# cat /etc/bashrc.drew >> $HOME/.bashrc
```
