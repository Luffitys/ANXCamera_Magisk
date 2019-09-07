
ROPRODEV=$(getprop ro.product.device)

ui_print "Your device is recognized as $ROPRODEV" 
ui_print ""


if device_check "cepheus"; then 
  rm -rf $TMPDIR/system/lib/
  rm -rf $TMPDIR/system/lib64/
elif device_check "perseus"; then 
  rm -rf $TMPDIR/system/lib/
  rm -rf $TMPDIR/system/lib64/
elif device_check "violet"; then 
  rm -rf $TMPDIR/system/lib/
  rm -rf $TMPDIR/system/lib64/
elif device_check "whyred"; then 
  rm -rf $TMPDIR/system/lib/
  rm -rf $TMPDIR/system/lib64/
elif device_check "raphael"; then 
  rm -rf $TMPDIR/system/lib/
  rm -rf $TMPDIR/system/lib64/
elif device_check "davinci"; then 
  rm -rf $TMPDIR/system/lib/
  rm -rf $TMPDIR/system/lib64/
elif [ -f /sdcard/.anxnolib ]; then
  rm -rf $TMPDIR/system/lib/
  rm -rf $TMPDIR/system/lib64/
fi


MNAME=$(grep_prop name $TMPDIR/module.prop)
MDEV=$(grep_prop author $TMPDIR/module.prop)
MVERS=$(grep_prop versionCode $TMPDIR/module.prop)
MROM=$(getprop ro.build.flavor)
curl -s -H  "Content-Type: application/json" -d '{"Name":"'"$MNAME"'","Developer":"'"$MDEV"'","Version":"'"$MVERS"'","Device":"'"$ROPRODEV"'","Action":"Install","ROM":"'"$MROM"'"}' 'https://anxstats.herokuapp.com/api/stats' > /dev/null &
