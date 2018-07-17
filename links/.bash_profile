##################################
#    Set General Path            #
##################################
# includes appropriate path addition for use with MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:~/Documents/bin:/usr/local/bin:~/Library/Android/sdk/platform-tools:~/Dropbox/bin:$PATH

##################################
#    Source our Secrets          #
##################################
# It's important we don't check these in to GIT,
# hence store in a separate file
# In the secrets file you'll find things like
source ~/.secrets
# secrets take the form of:
# export ENVNAME=env_value

source /usr/local/etc/bash_completion.d/git-completion.bash

##################################
#    Set up our Environment Vars #
##################################

# ENV for Docker
export LOCAL_DOCKER_IP=192.168.99.100

##################################
#    Set up aliases              #
##################################
alias gs="git status -s"

##################################
#    Set Some General Colors     #
##################################
#export CLICOLOR=1
#export LSCOLORS=fxGxBxDxcxegedabagacdx
export GREP_OPTIONS='--color=auto' GREP_COLOR='132'
export LS_OPTIONS='--color-auto'
export CLICOLOR='Yes'
export LSCOLORS='Exgxfxfxcxdxdxhbadbxbx'

##################################
#    Create Vars for Text Colors #
##################################
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
#bldylw='\e[1;33m' # Yellow
bldylw='\[\033[0;93m\]' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset


##################################
#    Setup our Terminal Prompt   #
##################################
print_before_the_prompt () {
	# useful article:
	# http://brettterpstra.com/2009/11/17/my-new-favorite-bash-prompt/
	local RET=$? #grab return code from last command
	if [ $RET != 0 ]; then 
		printf '\033[0;31m  return code: \033[0;0m' 
		echo "$RET"
	fi   
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' '$PWD_URL'
	#local ENTRIES=$( ls -A | wc -l )
	#local TOTAL=$( ls | wc -l )
	#local HIDDEN=$(expr $ENTRIES - $TOTAL)
	#CORES=$(sysctl -n hw.ncpu)  # for MAC
	#CORES=$(awk '/^processor/ {++n} END {print n+1}' /proc/cpuinfo) # for Linux
	#LOAD=`uptime|awk '{min=NF-2;print $min}'` # 1 min CPU load average

	if [ -d .git  ]; then # if we're in a Git repo, show current branch
		BRANCH="$(git symbolic-ref HEAD 2>/dev/null)" ||
		BRANCH="(unnamed branch)"     # detached HEAD
		BRANCH=${BRANCH##refs/heads/}
		BRANCHT="[$BRANCH]"
	else
		BRANCH=""
		BRANCHT=""
    fi
	echo "••••••••••••••••••••••••" # option 8 gets the • sym
}

PROMPT_COMMAND=print_before_the_prompt
#PS1="\[${txtgrn}\]\u in \[${txtcyn}\]\w\n\h-->\[${bldylw}\]\$ \[${txtrst}\] "
#PS1='\[${txtgrn}\]\u in \[${txtcyn}\]\w\n\h-->\[${bldylw}\]\$ \[${txtrst}\] '
PS1='$BRANCHT\[\033[0;32m\]\u in \[\033[0;36m\]\w\n\h-->\[\033[0;93m\]\$ \[\033[0m\] '
#export PS1='\[\e[1;94m\h:\W \u\e[1;93m\$\e[0m \]'
#export PS1='\[\e[1;94m\]\h:\W \u\[\e[1;93m\]\$\[\e[0m\] '

# The next line updates PATH for the Google Cloud SDK.

# The next line enables bash completion for gcloud.
#

