:: Limpiar carpetas de usuario
@echo off

:: Definir carpetas a limpiar
set "CARPETAS=%USERPROFILE%\Downloads;%USERPROFILE%\Pictures;%USERPROFILE%\Documents;%USERPROFILE%\Music;%USERPROFILE%\Videos"

for %%F in (%CARPETAS%) do (
    if exist "%%F" (
        echo Limpiando carpeta: %%F
        for /d %%D in ("%%F\*") do rmdir /s /q "%%D" >nul 2>&1
        del /s /q "%%F\*" >nul 2>&1
    )
)

:: Limpiar el escritorio respetando excepciones
set "ESCRITORIO=%USERPROFILE%\Desktop"
set "EXCEPCIONES=Syscol.lnk Movavi.lnk "Google Chrome.lnk" mBlock.lnk "PRUEBA DIA.url" desktop.ini"

:: Usar variables habilitadas retrasadas para manejar las excepciones
setlocal enabledelayedexpansion
echo Limpiando escritorio: %ESCRITORIO%
for %%A in ("%ESCRITORIO%\*") do (
    set "ENCONTRADO=0"
    for %%E in (%EXCEPCIONES%) do (
        if /i "%%~nxA"=="%%~E" set "ENCONTRADO=1"
    )
    if "!ENCONTRADO!" NEQ "1" (
        if exist "%%A" (
            if exist "%%A\*" (
                echo Eliminando carpeta: %%A
                rmdir /s /q "%%A" >nul 2>&1
            ) else (
                echo Eliminando archivo: %%A
                del /q "%%A" >nul 2>&1
            )
        )
    )
)
endlocal

echo Tarea completada.
pause
exit /b
