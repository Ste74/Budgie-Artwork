#!/bin/bash

#set variable

DE=budgie
DIRECTORY=/home/$USER/Github/Budgie-Artwork/
ABSPATH=/usr/share/backgrounds/manjaro-$DE/

clear
echo "#################################"
echo "This script makes all pictures in selected custom directory"
echo "available as your system-wide $DE wallpapers." 
echo "It reads/lists all pictures in selected directory and creates manjaro-$DE.xml file in ~/.local/share/gnome-background-properties/."
echo "USAGE: Make this script executable (chmod +x backgrounds.sh) and execute it (./backgrounds.sh or ./backgrounds.sh )." 
echo "#################################"
echo
# if doesn't exists creating directory ~/.local/share/gnome-background-properties
mkdir -p ~/.local/share/gnome-background-properties

echo
if [ ! -d $DIRECTORY ]
then
    echo "Directory $DIRECTORY doesnot exists"
    echo "You have to start the Script again."	
    exit
fi

echo "You selected $DIRECTORY:"
ls $DIRECTORY > lspictures.txt
cat lspictures.txt
echo

#check if mybackground.xml already exist

if [ -e manjaro-$DE.xml ]
then
    rm manjaro-$DE.xml
fi

# creating the head of mybackgrounds.xml
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">
<wallpapers>" > manjaro-$DE.xml

# looking for all pictures in DIRECTORY
echo "OK. Now we are creating manjaro-$DE.xml"

# This script is looking for .png and .jpg files only, but you can add here another file types. The "<options>stretched</options>" should work best for unknow sized files.
for i in $DIRECTORY*.jpg $DIRECTORY*.png; do
echo "<wallpaper>
<name>$i</name>
<filename>$i</filename>
  <options>stretched</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
    <shade_type>solid</shade_type>
  </wallpaper>" >> manjaro-$DE.xml
done

# creating the bottom of mybackgrounds.xml
echo "</wallpapers>" >> manjaro-$DE.xml

# Change <name>/path_to/picture</name> to <name>picture</name> and move mybackgrounds.xml  to ~/.local/share/gnome-background-properties/.
# if you like to copy mybackgrounds.xml to ~/.local/mybackgrounds.xml as well
sed "s|${DIRECTORY}|${ABSPATH}|g" manjaro-$DE.xml > ~/.local/share/gnome-background-properties/manjaro-$DE.xml

#Move again in Original path and clean all
mv ~/.local/share/gnome-background-properties/manjaro-$DE.xml ${DIRECTORY}manjaro-$DE.xml
rm lspictures.txt
echo
echo "#################################"
echo "DONE xml file created"
echo "#################################"
echo
exit 0
