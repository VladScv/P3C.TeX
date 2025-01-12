@echo off
:: Script para guardar copias de seguridad del archivo .tex
setlocal
set docName=documento

:: Crear la carpeta de backups si no existe
if not exist backups (
    mkdir backups
)

:: Obtener la fecha y hora actual en un formato válido para nombres de archivos
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set date=%datetime:~0,8%
set time=%datetime:~8,6%

:: Formatear fecha y hora para el nombre del archivo (YYYY-MM-DD_HH-MM-SS)
set dateFormatted=%date:~0,4%-%date:~4,2%-%date:~6,2%
set timeFormatted=%time:~0,2%-%time:~2,2%-%time:~4,2%

:: Construir el nombre del archivo de backup
set backupName=%docName%_backup_%dateFormatted%_%timeFormatted%.tex

:: Copiar el archivo .tex al directorio de backups
copy "%docName%.tex" "backups\%backupName%"

if %errorlevel% equ 0 (
    echo Copia de seguridad creada: backups\%backupName%
) else (
    echo Error: No se pudo crear la copia de seguridad. Verifica que %docName%.tex existe.
)

pause
