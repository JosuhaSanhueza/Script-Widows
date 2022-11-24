@echo off 

E:
cd Backup
7za a -r -tzip E:\Backup\Cesfam_El_Roble_%date:~6,6%_Backup.zip

> E:\Backup\Cesfam_El_Roble_%date:~6,6%.log

goto end

