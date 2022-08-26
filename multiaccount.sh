~#/bin.sh
input="users.csv"
while IFS=',' read -r loginname name
do
	echo "Adding $loginname......"
useradd -c "$name" -d /home/$loginname -m $loginname
done <"$input"
echo $?


#NB create a .csv file with the user names
#victort, Victor Tobenna
#ogoo, Ogo Ozotta
