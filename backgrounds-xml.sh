#!/bin/bash

#set variable

DE=budgie
ABSPATH=/usr/share/backgrounds/manjaro-$DE/

if [ -e manjaro-$DE.xml ]; then
    rm manjaro-$DE.xml
fi

# creating the head of mybackgrounds.xml
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">
<wallpapers>" > manjaro-$DE.xml

# looking for all pictures in DIRECTORY
echo "OK. Now we are creating manjaro-$DE.xml"

# This script is looking for .png and .jpg files only, but you can add here another file types. The "<options>stretched</options>" should work best for unknow sized files.
for i in $(ls *.png) $(ls *jpg); do
echo "<wallpaper>
<name>${ABSPATH}$i</name>
<filename>${ABSPATH}$i</filename>
  <options>stretched</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
    <shade_type>solid</shade_type>
</wallpaper>" >> manjaro-$DE.xml
done

# creating the bottom of mybackgrounds.xml
echo "</wallpapers>" >> manjaro-$DE.xml

echo
echo "#################################"
echo "DONE xml file created"
echo "#################################"
echo
exit 0
