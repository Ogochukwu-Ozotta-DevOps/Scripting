#!/bin/bash      
#author		: Ogochukwu Ozotta
#CopyRights     : Ogochukwu Ozotta
#Contact        : +1 832 206 4158
#Purpose 	: CREATING SSHKEYS IN THE GITHUB VIA AUTOMATION
echo "Enter your GitHub Personal Access Token (PAT):"
read token
#echo $token >token.txt
#cat token.txt
cat ~/.ssh/id_rsa.pub
#if condition to validate weather ssh keys are already present or not
if [ $? -eq 0 ]
then
	echo "SSH Keys are already present..."
else	
echo "SSH Keys are are not present..., Create the sshkeys using ssh-keygen command"
ssh-keygen -t rsa
echo "Key successfully generated"
fi
sshkey=`cat ~/.ssh/id_rsa.pub`
if [ $? -eq 0 ]
then
then
echo "Copying the key to GitHub account"
curl  -X POST -H "Accept: application/vnd.github+json" -H "Authorization: token $token" -d "{\"title\": \"SSHKEY\",\"key\": \"$sshkey\"}"   https://api.github.com/user/keys
if [ $? -eq 0 ]
then
echo "Successfully copied the token to GitHub"
exit 0
else
echo "Failed"
exit 1
fi
else
echo "Failure in generating the key"
exit 1
fi

