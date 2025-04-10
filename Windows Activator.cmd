@echo off
title Windows Activation Tool
color 0A

echo [INFO] Detecting your Windows edition...

for /f "tokens=3" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID 2^>nul') do set edition=%%i

echo [INFO] Detected Edition: %edition%

set key=

if /i "%edition%"=="Professional" set key=W269N-WFGWX-YVC9B-4J6C9-T83GX
if /i "%edition%"=="ProfessionalN" set key=MH37W-N47XK-V7XM9-C7227-GCQG9
if /i "%edition%"=="Home" set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
if /i "%edition%"=="HomeN" set key=3KHY7-WNT83-DGQKR-F7HPR-844BM
if /i "%edition%"=="CoreSingleLanguage" set key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
if /i "%edition%"=="CoreCountrySpecific" set key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
if /i "%edition%"=="Education" set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
if /i "%edition%"=="EducationN" set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
if /i "%edition%"=="Enterprise" set key=NPPR9-FWDCX-D2C8J-H872K-2YT43
if /i "%edition%"=="EnterpriseN" set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4

if "%key%"=="" (
    echo [ERROR] This script does not support your edition: %edition%
    pause
    exit /b
)

echo [INFO] Installing appropriate product key...
slmgr /ipk %key%
timeout /t 3 >nul

echo [INFO] Setting KMS server...
slmgr /skms kms8.msguides.com
timeout /t 3 >nul

echo [INFO] Activating Windows...
slmgr /ato
timeout /t 3 >nul

echo.
echo [SUCCESS] Done! Your Windows has been successfully activated!
pause
exit
