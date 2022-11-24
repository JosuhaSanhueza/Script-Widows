@echo off
CALL:CHANGEIP
EXIT /B %ERRORLEVEL%

:CHANGEIP
set /p INPUTIP="Ingresa La IP -> "
set /p INPUTMASK="Ingresa La Mascara De Red -> "
set /P INPUTGATE="Ingrese Puerta De Enlace Predeterminada -> "
set /p INPUTDNS1="Ingrese El Primer DNS -> "
set /p INPUTDNS2="Ingrese El Segundo DNS -> "

netsh interface ip set address name="Ethernet" source=static addr=%INPUTIP% mask=%INPUTMASK% gateway=%INPUTGATE%
netsh interface ip set dnsservers "Ethernet" static %INPUTDNS1% primary
netsh interface ip add dnsservers "Ethernet" %INPUTDNS2% index=2

echo tarea realizada con exito
EXIT /B 0

 