@echo off

set devid=DEVICEIDHERE

.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 mkdir /sdcard/UFO50Backup"
.\bin\adb.exe -s %devid% push .\save\upload\save1.ufo /sdcard/UFO50Backup/
.\bin\adb.exe -s %devid% push .\save\upload\save2.ufo /sdcard/UFO50Backup/
.\bin\adb.exe -s %devid% push .\save\upload\save3.ufo /sdcard/UFO50Backup/
.\bin\adb.exe -s %devid% push .\save\upload\account.ufo /sdcard/UFO50Backup/
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/save1.ufo /data/data/com.unofficial.ufo50/files/"
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/save2.ufo /data/data/com.unofficial.ufo50/files/"
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/save3.ufo /data/data/com.unofficial.ufo50/files/"
.\bin\adb.exe -s %devid% shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/account.ufo /data/data/com.unofficial.ufo50/files/"