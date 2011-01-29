# =================================================================================
# ====== Kevin Webser Bash Settings ===============================================
# =================================================================================
#
#  $HOME/.bashrc settings for OS X
# 
#  Last modified Friday, January 1st, 2010
# 
# =================================================================================

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# ====== Lame exit script =========================================================
function _exit()        # Function to run upon exit of shell.
{
    echo -e "Hasta la vista, baby"
}
trap _exit EXIT

# Aliases
alias apache2ctl='sudo /opt/local/apache2/bin/apachectl'
alias mysqlstart='sudo mysqld_safe5 &'
alias mysqlstop='mysqladmin5 -u root -p shutdown'
alias zf='~/Development/PHP/Zend/framework/1.9.7/bin/zf.sh'

# ====== Personal Aliases =========================================================

alias ls='ls -la'
alias ..='cd ..'

# ====== Display ==================================================================

# Define how Bash prompt looks like:
# User @ Host – working dir
# export PS1='\u@\h\w$ '
# export PS1=”\u@\h\w: “

# Special ps1 command
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
PS1="[\$CurDir] \$ "

date

# Cli Colors
export CLICOLOR=1
# use gree for dir’s
export LSCOLORS=cxfxcxcxbxegecabagacac

# ====== Cool Variables ===========================================================

rp=rabidpraxis@rabidpraxis.com
rpserver=rabidpraxis@192.168.0.101
web=/opt/local/apache2/htdocs/
httpdconf=/opt/local/apache2/conf/httpd.conf
httpdvhost=/opt/local/apache2/conf/extra/httpd-vhosts.conf
hosts=/etc/hosts
