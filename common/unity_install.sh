ROPRODEV=$(getprop ro.product.device)
MVERS=$(grep_prop versionCode $TMPDIR/module.prop)

ui_print ""
ui_print "     ─────────────────────────────────────"
ui_print "                 [ANXCamera v$MVERS]"
ui_print "        Your device is recognized as `toupper $ROPRODEV`" 
ui_print ""
ui_print "                Created by Luffitys,"
ui_print "                       AEonAX,"
ui_print "             CodeElixir and Abhishek987"
ui_print "     ─────────────────────────────────────"
ui_print ""
ui_print ""
ui_print ""


if device_check "davinci" || device_check "raphael" || device_check "davinciin" || device_check "raphaelin" || device_check "cepheus" || device_check "perseus" || device_check "violet" || device_check "whyred"; then
	rm -rf $MODPATH/system/lib/libcameraservice.so
	rm -rf $MODPATH/system/lib64/libcameraservice.so
fi


MNAME=$(grep_prop name $TMPDIR/module.prop)
MDEV=$(grep_prop author $TMPDIR/module.prop)
MROM=$(getprop ro.build.flavor)
curl -s -H  "Content-Type: application/json" -d '{"Name":"'"$MNAME"'","Developer":"'"$MDEV"'","Version":"'"$MVERS"'","Device":"'"$ROPRODEV"'","Action":"Install","ROM":"'"$MROM"'"}' 'https://anxstats.herokuapp.com/api/stats' > /dev/null &
