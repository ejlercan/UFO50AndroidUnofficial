@echo off

REM Make sure that we actually have game files first
if not exist ".\ufo50\data.win" (
	echo Place your UFO 50 game files in the ufo50 folder first!
	pause
	exit /b 1
)

: PREP
REM Clean up from any previous runs
@del UFO50Wrapper.apk
@del com.unofficial.ufo50.zip
@rmdir /s /q assets
@mkdir assets

REM Copy required assets
echo Preparing assets...
robocopy /e /nfl .\ufo50\ext .\assets\ext
copy .\ufo50\ext .\assets\
copy .\ufo50\*.dat .\assets\
copy .\ufo50\options.ini .\assets\
copy .\ufo50\data.win .\assets\game.droid
copy .\base\AndroidWrapper2024.8.0.216_VM_debug.apk UFO50Wrapper.apk

REM Clean wrapper apk
echo Preparing wrapper...
.\bin\aapt remove -f -v UFO50Wrapper.apk assets/options.ini
.\bin\aapt remove -f -v UFO50Wrapper.apk assets/game.droid

: JAVA
REM Download Java, if needed
if exist ".\bin\java\bin\java.exe" (
  goto PACK
)

REM Clean up whatever currently exists for Java
if exist ".\bin\java\" (
  @rmdir /S /Q ".\bin\java"
)

echo Downloading java...
powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://corretto.aws/downloads/resources/21.0.2.13.1/amazon-corretto-21.0.2.13.1-windows-x64-jdk.zip' -OutFile '.\jdk.zip'"

echo Extracting java...
powershell Expand-Archive ".\jdk.zip" -DestinationPath "."

echo Cleaning up...
move ".\jdk21.0.2_13" ".\bin\java"
del ".\jdk.zip"

: PACK
REM Add game assets to base wrapper APK
echo Building wrapper...
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup1.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup10.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup11.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup12.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup13.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup14.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup15.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup16.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup17.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup18.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup19.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup2.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup20.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup21.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup22.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup23.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup24.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup25.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup26.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup27.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup28.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup29.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup3.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup30.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup31.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup32.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup33.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup34.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup35.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup36.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup37.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup38.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup39.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup4.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup40.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup41.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup43.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup44.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup45.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup46.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup47.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup48.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup49.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup5.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup50.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup51.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup52.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup53.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup6.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup7.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup8.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/audiogroup9.dat
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/0_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/10_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/11_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/12_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/13_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/14_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/15_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/16_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/17_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/18_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/19_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/1_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/20_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/21_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/22_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/23_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/24_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/25_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/26_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/27_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/28_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/29_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/2_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/30_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/31_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/32_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/33_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/34_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/35_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/36_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/37_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/38_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/39_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/3_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/40_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/41_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/42_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/43_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/44_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/45_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/46_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/47_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/48_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/49_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/4_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/50_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/5_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/6_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/7_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/8_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/9_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/0_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/10_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/11_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/12_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/13_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/14_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/15_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/16_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/17_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/18_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/19_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/1_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/20_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/21_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/22_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/23_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/24_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/25_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/26_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/27_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/28_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/29_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/2_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/30_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/31_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/32_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/33_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/34_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/35_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/36_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/37_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/38_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/39_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/3_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/40_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/41_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/42_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/43_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/44_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/45_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/46_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/47_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/48_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/49_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/4_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/50_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/5_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/6_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/7_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/8_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/FRENCH/9_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/0_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/10_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/11_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/12_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/13_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/14_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/15_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/16_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/17_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/18_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/19_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/1_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/20_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/21_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/22_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/23_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/24_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/25_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/26_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/27_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/28_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/29_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/2_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/30_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/31_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/32_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/33_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/34_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/35_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/36_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/37_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/38_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/39_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/3_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/40_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/41_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/42_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/43_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/44_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/45_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/46_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/47_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/48_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/49_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/4_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/50_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/5_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/6_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/7_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/8_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/GERMAN/9_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/0_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/10_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/11_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/12_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/13_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/14_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/15_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/16_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/17_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/18_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/19_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/1_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/20_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/21_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/22_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/23_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/24_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/25_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/26_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/27_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/28_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/29_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/2_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/30_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/31_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/32_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/33_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/34_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/35_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/36_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/37_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/38_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/39_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/3_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/40_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/41_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/42_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/43_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/44_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/45_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/46_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/47_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/48_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/49_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/4_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/50_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/5_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/6_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/7_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/8_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/9_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/0_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/10_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/11_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/12_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/13_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/14_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/15_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/16_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/17_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/18_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/19_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/1_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/20_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/21_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/22_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/23_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/24_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/25_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/26_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/27_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/28_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/29_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/2_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/30_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/31_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/32_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/33_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/34_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/35_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/36_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/37_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/38_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/39_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/3_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/40_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/41_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/42_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/43_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/44_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/45_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/46_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/47_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/48_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/49_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/4_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/50_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/5_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/6_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/7_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/8_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/9_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/0_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/10_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/11_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/12_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/13_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/14_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/15_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/16_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/17_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/18_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/19_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/1_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/20_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/21_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/22_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/23_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/24_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/25_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/26_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/27_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/28_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/29_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/2_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/30_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/31_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/32_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/33_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/34_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/35_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/36_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/37_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/38_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/39_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/3_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/40_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/41_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/42_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/43_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/44_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/45_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/46_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/47_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/48_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/49_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/4_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/50_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/5_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/6_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/7_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/8_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/ext/SPANISH/9_Text.json
.\bin\aapt add -f -v UFO50Wrapper.apk assets/options.ini
.\bin\aapt add -f -v UFO50Wrapper.apk assets/game.droid

: BUILD
REM Zipalign and sign APK
echo Building APK...
.\bin\zipalign.exe -p -f -v 4 UFO50Wrapper.apk com.unofficial.ufo50.zipalign.apk
.\bin\java\bin\java.exe -jar .\bin\apksigner.jar sign --key .\base\testkey.pk8 --cert .\base\testkey.x509.pem --out com.unofficial.ufo50.apk com.unofficial.ufo50.zipalign.apk

: CLEAN
REM Clean up
echo Cleaning up...
del com.unofficial.ufo50.zipalign.apk
del com.unofficial.ufo50.apk.idsig
del UFO50Wrapper.apk
rmdir /s /q assets

echo Done! Have fun.
pause