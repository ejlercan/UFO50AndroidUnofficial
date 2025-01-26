@echo off

for /f %%i in ('.\bin\adb devices^|findstr /e "device"') do (
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 mkdir /sdcard/UFO50Backup"
	.\bin\adb.exe -s %%i push .\save\save1.ufo /sdcard/UFO50Backup/
	.\bin\adb.exe -s %%i push .\save\save2.ufo /sdcard/UFO50Backup/
	.\bin\adb.exe -s %%i push .\save\save3.ufo /sdcard/UFO50Backup/
	.\bin\adb.exe -s %%i push .\save\account.ufo /sdcard/UFO50Backup/
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/save1.ufo /data/data/com.unofficial.ufo50/files/"
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/save2.ufo /data/data/com.unofficial.ufo50/files/"
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/save3.ufo /data/data/com.unofficial.ufo50/files/"
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /sdcard/UFO50Backup/account.ufo /data/data/com.unofficial.ufo50/files/"
)