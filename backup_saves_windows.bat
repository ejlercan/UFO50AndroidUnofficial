@echo off

for /f %%i in ('.\bin\adb devices^|findstr /e "device"') do (
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 mkdir /sdcard/UFO50Backup"
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/save1.ufo /sdcard/UFO50Backup/"
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/save2.ufo /sdcard/UFO50Backup/"
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/save3.ufo /sdcard/UFO50Backup/"
	.\bin\adb.exe -s %%i shell "run-as com.unofficial.ufo50 cp -f /data/data/com.unofficial.ufo50/files/account.ufo /sdcard/UFO50Backup/"
	.\bin\adb.exe -s %%i pull /sdcard/UFO50Backup/save1.ufo .\save\
	.\bin\adb.exe -s %%i pull /sdcard/UFO50Backup/save2.ufo .\save\
	.\bin\adb.exe -s %%i pull /sdcard/UFO50Backup/save3.ufo .\save\
	.\bin\adb.exe -s %%i pull /sdcard/UFO50Backup/account.ufo .\save\
)