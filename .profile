# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    end 
end

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    # Unsupported use of '='. In fish, please use 'set PATH "$HOME/bin:$PATH"'.
    set PATH "$HOME/bin:$PATH"
end

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    set PATH "$HOME/.local/bin:$PATH"
end

