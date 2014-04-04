# create directories for an ExtJS App
# USAGE: ./extJsMvcFolders <destinationFolder> <ProjectName>
# OPTIONS --create-ext

function usage() {
	echo -e "\033[33mUSAGE: $0 <destination> <ProjectName> [options]\033[0m"
	echo -e "\033[033m[OPTIONS]: --create-ext <extjsFolder> to copy the extJS source to your destination\033[0m"
	echo -e "\033[33mEXAMPLE: $0 /path/to/Desktop myProject --create-ext /path/to/my/extjs\033[0m"
	exit 1
}

# call usage function if there are less than two parameters
[[ $# -lt 2 ]] && usage

destination=$1
projName=$2
option=$3
extPath=$4 # Path to your extJS source
optionExt=0


if [ "$3" == "--create-ext" ]
	then
		optionExt=1
fi


function create(){
	cd $destination
	mkdir $projName
	cd $projName
	mkdir app
	mkdir app/controller
	mkdir app/model
	mkdir app/store
	mkdir app/view
	mkdir data

	echo "creating files"
	echo "<!--index.html -->" >> index.html
	echo "//app.js" >> app.js
}

function copyExt() {
	echo "copy ext source"
	mkdir $destination$projName/extjs
	cp -r $extPath $destination$projName/extjs
	echo "done."
}


if [ -d "$destination$projName" ]
	then
		echo "$destination$projName already exists."
		usage
	else
		echo "creating folders"
		create

		if [ $optionExt -eq 1 ]
			then
				copyExt
			else
				echo "done."
		fi

fi

