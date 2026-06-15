# space
ui_print " "

# var
UID=`id -u`
[ ! "$UID" ] && UID=0

# optionals
OPTIONALS=/data/media/"$UID"/optionals.prop
if [ ! -f $OPTIONALS ]; then
  touch $OPTIONALS
fi

# debug
if [ "`grep_prop debug.log $OPTIONALS`" == 1 ]; then
  ui_print "- The install log will contain detailed information"
  set -x
  ui_print " "
fi

# info
MODVER=`grep_prop version $MODPATH/module.prop`
MODVERCODE=`grep_prop versionCode $MODPATH/module.prop`
ui_print " ID=$MODID"
ui_print " Version=$MODVER"
ui_print " VersionCode=$MODVERCODE"
if [ "$KSU" == true ]; then
  ui_print " KSUVersion=$KSU_VER"
  ui_print " KSUVersionCode=$KSU_VER_CODE"
  ui_print " KSUKernelVersionCode=$KSU_KERNEL_VER_CODE"
else
  ui_print " MagiskVersion=$MAGISK_VER"
  ui_print " MagiskVersionCode=$MAGISK_VER_CODE"
fi
ui_print " "

# info
NAME=bmr-pfsd.sh
FILE=$MODPATH/$NAME
DIR=/data/adb/post-fs-data.d
ui_print "- This is not a module,"
ui_print "  so this will not remain in module list."
ui_print "  Installing $NAME to $DIR/"
ui_print "  with the correct permissions (0755)..."
ui_print " "

# copy
mkdir -p $DIR
cp -f $FILE $DIR
chmod 0755 $DIR/$NAME

# exit
ui_print "- Done"
ui_print "- If you want to uninstall, just delete"
ui_print "  $DIR/$NAME file."
rm -rf /data/adb/modules*/$MODID
exit





