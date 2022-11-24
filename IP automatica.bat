title Cambio De IP
mode con cols=46 lines=10
color b

:Menu

@echo off

cls

echo Cambio de IP Automatica
echo.

echo 1. IP Entel
echo 2. IP Claro
echo 3. DHCP (Defecto)
echo 4. Salir

set /p var=

if %var%==1 goto :Primero
if %var%==2 goto :Segundo
if %var%==3 goto :Tercero
if %var%==4 goto exit
if %var% GTR 4 echo Error Opcion Ingresada No Valida
Pause>Nul
goto :Menu

:Primero

cls
color b
Echo Cambiando a IP Entel
netsh interface ip set address name="Ethernet" source=static addr=10.0.60.36 mask=255.255.255.128  10.0.60.1
netsh interface ip set dnsservers "Ethernet" static 10.8.134.45 primary
netsh interface ip add dnsservers "Ethernet" 10.8.134.35 index=2
Echo IP Cambiada Con Exito
Echo Presione una tecla para volver al menu
Pause>Nul
goto :Menu

:Segundo

cls
color b
Echo Cambiando a IP Claro
netsh interface ip set address name="Ethernet" source=static addr=192.168.11.44 mask=255.255.255.0 192.168.11.1
netsh interface ip set dnsservers "Ethernet" static 200.27.2.65 primary
netsh interface ip add dnsservers "Ethernet" 8.8.8.8 index=2
Echo IP Cambiada Con Exito
Echo Presione una tecla para volver al menu
Pause>Nul
goto :Menu

:Tercero

cls
color b
Echo Cambiando a Dhcp
netsh interface ip set address name="Ethernet" source=dhcp
Echo IP Cambiada Con Exito
Echo Presione una tecla para volver al menu
Pause>Nul
goto :Menu
