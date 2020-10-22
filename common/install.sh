MODULEVERSION=$(grep_prop versionCode $TMPDIR/module.prop)
DEVICENAME=$(getprop ro.product.vendor.device)
ANDROIDVERSION=$(getprop ro.system.build.version.release)
ROMNAME=$(getprop ro.build.flavor)


ui_print " "
ui_print " "
ui_print "   ───────────────────────────────────"
ui_print "           ANXCamera Version: $MODULEVERSION"
ui_print "           Device: `toupper $DEVICENAME`"
ui_print "           Android Version: v$ANDROIDVERSION"
ui_print "           ROM: $ROMNAME"

# Android Version Check
if [ $ANDROIDVERSION != 11 ]; then
ui_print " "
ui_print "           Android 10 (Q) is discontinued!"
ui_print "           Latest Q version is v190!"
ui_print " "
ui_print "           Installation will be aborted!"
ui_print "   ───────────────────────────────────"
ui_print " "
abort
fi

# Miui Check
if [ -f "/system/app/miui/miui.apk" ]; then
ui_print " "
ui_print "   !       Miui is NOT supported!           !"
ui_print " "
abort
fi

ui_print " "
ui_print "           Created by Luffitys"
ui_print "           AEonAX, Noid, Wolf"
ui_print "           and many others!"
ui_print "   ───────────────────────────────────"
ui_print " "
ui_print " "
