echo off
set dateNtime="%date:~0,2%-%date:~3,2%-%date:~6,6%_%time:~0,2%-%time:~3,2%"

ROBOCOPY "%userprofile%\Desktop\LO MAS USADO" D:\Backup\%computername%\%date%_%time:~0,2%-%time:~3,2% /E /V /TEE /MT:24 /LOG:%dateNtime%.log

robocopy "%userprofile%\Desktop" D:\Backup\Logs *.log /mov

goto end