@echo off

set devid=DEVICEIDHERE

.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 mkdir /sdcard/UFO50Backup"
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/save1.ufo /sdcard/UFO50Backup/"
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/save2.ufo /sdcard/UFO50Backup/"
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/save3.ufo /sdcard/UFO50Backup/"
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/account.ufo /sdcard/UFO50Backup/"
.\bin\adb.exe -s %devid% pull /sdcard/UFO50Backup/save1.ufo .\save\download\
.\bin\adb.exe -s %devid% pull /sdcard/UFO50Backup/save2.ufo .\save\download\
.\bin\adb.exe -s %devid% pull /sdcard/UFO50Backup/save3.ufo .\save\download\
.\bin\adb.exe -s %devid% pull /sdcard/UFO50Backup/account.ufo .\save\download\