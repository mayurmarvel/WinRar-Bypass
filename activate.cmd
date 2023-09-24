@echo off

:: Use PowerShell to display the ASCII art logo from the "logo.txt" file in the script directory
powershell -command "Get-Content '%~dp0logo.txt' | Out-Host"


:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please run it as an administrator.
    pause
    exit /b 1
)

:: Simulate a loading progress bar for 3 seconds
for /l %%i in (1,1,30) do (
    <nul set /p ".=."
    ping -n 1 127.0.0.1 >nul
)

(
echo RAR registration data
echo WinRAR
echo Unlimited Company License
echo UID=4b914fb772c8376bf571
echo 6412212250f5711ad072cf351cfa39e2851192daf8a362681bbb1d
echo cd48da1d14d995f0bbf960fce6cb5ffde62890079861be57638717
echo 7131ced835ed65cc743d9777f2ea71a8e32c7e593cf66794343565
echo b41bcf56929486b8bcdac33d50ecf773996052598f1f556defffbd
echo 982fbe71e93df6b6346c37a3890f3c7edc65d7f5455470d13d1190
echo 6e6fb824bcf25f155547b5fc41901ad58c0992f570be1cf5608ba9
echo aef69d48c864bcd72d15163897773d314187f6a9af350808719796
) > "rarreg.key"

:: Move the rarreg.key file to "C:\Program Files\WinRAR"
move "rarreg.key" "C:\Program Files\WinRAR" 2>nul

if %errorlevel% equ 0 (
    echo.
    echo Activated Successfully
) else (
    echo.
    echo Failed to move the file. Access is denied.
)

pause
