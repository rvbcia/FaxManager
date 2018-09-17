#!/bin/bash
#@author Dagmara Ryba

#check if user need some help
if [ $1 == '--help' ] ; then

	printf "This script will prepare you a list of fax numbers depends on the country code.\nAll you need to do is enter $ ./faxmanager.sh <country code> in the same path as your .txt with fax numbers.\nIMPORTANT! File with fax numbers has to be renamed with fax.txt before you use the script."


#check if user enter correct country code
elif ! [[ $1 == ^[0-9]+$ ]] ; then
  
	#replace incorrect characters
	sed -i 's/+/00/' fax.txt
    sed -i 's/(/ /' fax.txt
    sed -i 's/)/ /' fax.txt

  if [ $1 == 0048 ] ; then
    
    sed -n '/0048/p' fax.txt >> PL.txt
    echo "Your fax numbers are in PL.txt"

  elif [ $1 == 0049 ] ; then

    sed -n '/0049/p' fax.txt >> DE.txt
    echo "Your fax numbers are in DE.txt"

  elif [ $1 == 0049 ] ; then

  	sed -n '/0043/p' fax.txt >> AT.txt
    echo "Your fax numbers are in AT.txt"

  else
    echo "Error" 	

  fi

elif ! [[ $1 =~ ^[0-9]+$ ]] ; then

	echo "error: You have to enter country code. Use $ ./faxmanager.sh --help for more informations"

else
  	echo "error: Use $ ./faxmanager.sh --help for more informations"

fi
