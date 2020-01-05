# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Sets ~/.local/bin to path recursive
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# Sets go and rust paths
export PATH="$PATH:$HOME/go/bin:$HOME/.cargo/bin"
export EDITOR="nvim"
export TERMINAL="kitty"
export VAGRANT_DEFAULT_PROVBIDER="libvirt"
export GDK_SCALE=1
export ELM_SCALE=1
