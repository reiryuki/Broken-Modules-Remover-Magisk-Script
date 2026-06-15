#!/system/bin/sh

#mount
mount -o rw,remount /data

# log
DIR=/data/adb/logs
mkdir -p $DIR
exec 2>$DIR/bmr-pfsd.log
set -x

# check
MODS_DIR='/data/adb/modules'
if [ -d "$MODS_DIR" ]; then
  for mod in "$MODS_DIR"/*; do
    if [ -d "$mod" ]; then
      context=$(ls -Zd "$mod" | cut -d ' ' -f 1)
      if [ "$context" != "u:object_r:system_file:s0" ]; then
        touch "$mod/remove"
      fi
    fi
  done
fi


