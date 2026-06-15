# Broken Modules Remover Magisk Script

## Descriptions
- This is not a module, so this will not remain in module list.
- Installs bmr-pfsd.sh to /data/adb/post-fs-data.d with the correct permissions (0755).
- bmr-pfsd.sh is a script that checks modules folder SE context in /data/adb/modules/. If it doesn't match u:object_r:system_file:s0, then the script will remove the module by creating an empty 'remove' file to the module folder.
- Why is this script needed? In Magisk, when device bootloops, all folders and files SE context in /data/adb/modules/ some how are changed to u:object_r:adb_data_file:s0 which causes data corruption if modules contains APK file and causes the module to not work properly due to the wrong SE context. So, removing the broken modules before that happens is the right thing to do.

## Changelog

v0.1
- Initial release

## Requirements
Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide & Download Link
- Install this script https://devuploads.com/tv5hs19ug59y via Magisk app or KernelSU app or Kitsune Mask app or Apatch app or via Recovery if Magisk or Kitsune Mask is installed.
- If you want to uninstall, just delete /data/adb/post-fs-data.d/bmr-pfsd.sh file.

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- https://t.me/androidryukimodsdiscussions
- You can contribute ideas about this script here: https://t.me/androidappsportdevelopment

## Sponsors
- https://t.me/ryukinotes/25





