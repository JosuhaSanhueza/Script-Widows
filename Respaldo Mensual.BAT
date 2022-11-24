@echo off
set drive=D:\Backup
SET dateNtime="%date:~0,2%-%date:~3,2%-%date:~6,6%_%time:~0,2%-%time:~3,2%"
set backupcmd=xcopy /s /c /d /e /h /i /r /k /y /Q

echo Haciendo un respaldo completo de mis datos de usuario...

%backupcmd% "%USERPROFILE%\Desktop\LO MAS USADO" "%computername%\%dateNtime%" >"D:Backup\log_%dateNtime%.log"

echo Respaldo completo, tu respaldo esta hecho en %drive%
echo Presione una tecla para salir



