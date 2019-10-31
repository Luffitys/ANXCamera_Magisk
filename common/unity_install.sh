DEVICENAME=$(getprop ro.product.device)
MODULEVERSION=$(grep_prop versionCode $TMPDIR/module.prop)
ANDROIDVERSION=$(getprop ro.system.build.version.release)

ui_print " "
ui_print "     ─────────────────────────────────────"
ui_print "                 [ANXCamera v$MODULEVERSION]"
ui_print "         Your device is recognized as `toupper $DEVICENAME`"
ui_print "                 Android Version $ANDROIDVERSION!"
#Android Version Check
if [ $ANDROIDVERSION != 10 ]; then
	ui_print " "
	ui_print "           Android 9 (Pie) is discontinued!"
	ui_print "             Latest Pie version is v151!"
	ui_print "            Please download above instead!"
	ui_print " "
	ui_print "            Installation will be aborted!"
	ui_print "     ─────────────────────────────────────"
	abort
fi
# Miui Check
if [ -f /system/app/miui/miui.apk ]; then
	ui_print " "
	ui_print "                 Miui ROM detected!"
	ui_print "               Miui is NOT supported!"
	#ui_print " "
	#ui_print "            Installation will be aborted!"
	ui_print "     ─────────────────────────────────────"
	#abort
fi
ui_print " "
ui_print "                Created by Luffitys,"
ui_print "                       AEonAX,"
ui_print "               CodeElixir, Abhishek987"
ui_print "                     Wolf, Noid"
ui_print "            and many other great people"
ui_print "     ─────────────────────────────────────"
ui_print " "

# Device Check
#if [ $(getprop ro.product.device) == davinci ] || [ $(getprop ro.product.device) == davinciin ] || [ $(getprop ro.product.device) == raphael ] || [ $(getprop ro.product.device) == raphaelin ] || [ $(getprop ro.product.device) == cepheus ] || [ $(getprop ro.product.device) == perseus ] || [ $(getprop ro.product.device) == violet ] || [ $(getprop ro.product.device) == whyred ]; then
	#rm $MODPATH/system/lib/libcameraservice.so
	#rm $MODPATH/system/lib64/libcameraservice.so
#fi


MODULENAME=$(grep_prop name $TMPDIR/module.prop)
MODULEDEVELOPER=$(grep_prop author $TMPDIR/module.prop)
ROMNAME=$(getprop ro.build.flavor)
curl -s -H  "Content-Type: application/json" -d '{"Name":"'"$MODULENAME"'","Developer":"'"$MODULEDEVELOPER"'","Version":"'"$MODULEVERSION"'","Android Version":"'"$ANDROIDVERSION"'","Device":"'"$DEVICENAME"'","Action":"Install","ROM":"'"$ROMNAME"'"}' 'https://anxstats.herokuapp.com/api/stats' > /dev/null &
