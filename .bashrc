#
# .bashrc (rev. 1.1)
#
# This file is read for every bash started except login-shell:s
# (see .bash_profile)
#
# Warning!
#   Errors introduced in this file might prevent you from logging in.
#   Make sure you test changes before you logout.
#


#
# PATH-settings should be done only once so check for the presence
# of our MYPATHSETUP variabel.
#
if [ ${MYPATHSETUP:-no} != yes ]
then
  #
  # Modules - manage user environment and software packages
  #
  # Warning!
  # Different applications can have incompatible environment requirements,
  # loading multiple application modules is likely to lead to problems.
  #
  #if [ -n "${MODULESHOME}" ]
  #then
  #  module load sge    # Load Sun Grid Engine
  #  module load tomcat # Load Apache Tomcat (JavaEE)
  #fi
  
  #
  # Other direct PATH settings
  #
  #export PATH="${HOME}/bin:${PATH}"
  #export MANPATH="${MANPATH}:/usr/hacks/man"
  
  # Don't add the PATH:s again
  export MYPATHSETUP=yes
fi

#
# Non-interactive shells does not have a prompt so we can end the
# configuration here.
# Do not modify PATH:s beyond this line
#
[ -z "${PS1}" ] && return

#
# Set prompt (but only if we are interactive)
#
# Symbol Displayed Value (for a full list see man-page)
#   \!   History number of current command
#   \#   Command number of current command
#   \d   Current date
#   \h   Host name
#   \n   Newline
#   \s   Shell name
#   \t   Current time
#   \u   User name
#   \W   Current working directory
#   \w   Current working directory (full path)
#
# [ -n "${PS1}" ] && export PS1="\h> "     #  "hostname> " (This is the default)
# [ -n "${PS1}" ] && export PS1="\h:\W> "  #  "hostname:directory> "
# [ -n "${PS1}" ] && export PS1="% "       #  "% "

#
# Use the window title as an extended prompt containing hostname and
# working directory.
# The window name is set to $SHELL @ $HOSTNAME:$PWD
#
[ -f /it/etc/shell/prompts/bash_homeastilde ] && . /it/etc/shell/prompts/bash_homeastilde
#[ -f /it/etc/shell/prompts/bash_normalhome ] && . /it/etc/shell/prompts/bash_normalhome

#
# Some convenient shortcuts
# (either from separate file or the fallbacks in this file)
#
if [ -f ${HOME}/.bash_aliases ]
then
  . ${HOME}/.bash_aliases
else
  # Fallbacks ...
  [ -x /it/sw/gnutools/bin/ls ] && alias ll="/it/sw/gnutools/bin/ls -lFL --color=auto"
  [ -x /it/sw/gnutools/bin/dir ] && alias dir="/it/sw/gnutools/bin/dir -F --color=auto"
  #alias ls="ls -F"

  # Ask before action is performed
  #alias cp="cp -i"
  #alias mv="mv -i"
  #alias rm="rm -i"

  # More human form
  #alias df="df -h"
  #alias du="du -h"

  # Commands not included in the standard path ...
  [ -x /usr/sbin/ping ] && alias ping="/usr/sbin/ping -s"
fi

#disable the stupid-fuck-ass C-s
stty -ixon

# fetch .files from git repo, quietly
git pull >/dev/null 2>&1 &
