color_prompt=yes

############### source
if [ -d ~/.shell_source ]; then
     source .shell_source/defaults
     source .shell_source/functions
     source .shell_source/exports
     source .shell_source/alias
     source .shell_source/prompt
     #source .shell _source /git
fi

############ welcome mesage
echo "Hardware Information:"
echo -e "\033[32m sensors \033[0m"
sensors # Needs: 'sudo apt-get install lm-sensors'

echo -e "\033[32m uptime \033[0m"
uptime # Needs: 'sudo apt-get install lsscsi'


echo -e "\033[32m lsscsi \033[0m"
lsscsi

echo -e "\033[32m free \033[0m"
free -m


if [ -x "`which inxi 2>&1`" ]; then
    inxi -IpRS -v0 -c5
fi

# keychain saved your ssh activity, after reboot need one enter password (need install keychain) 
eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/keys/1_id $HOME/.ssh/keys/05_id $HOME/.ssh/keys/123_id)
source $HOME/.keychain/$HOSTNAME-sh

#use ssh ident insted keychain (need install ssh-ident)
#alias ssh="/usr/bin/ssh-ident"


#comment ------------------------------
#if [[ $- != *i* ]] ; then
#       return
#fi

#if [ -z "$PS1" ]; then
#	return
#fi
