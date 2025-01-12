@echo off
:: Script para guardar el PDF como entregable
setlocal
set docName=documento

:: Preguntar al usuario el nombre del archivo entregable
set /p newFileName=Introduce el nombre del archivo entregable (sin extensión):

:: Crear carpeta entregable si no existe
if not exist entregable (
    mkdir entregable
)

:: Mover el archivo PDF al directorio entregable con el nuevo nombre
move /Y "%docName%.pdf" "entregable\%newFileName%.pdf"

if %errorlevel% equ 0 (
    echo Entregable guardado en: entregable\%newFileName%.pdf
) else (
    echo Error: No se pudo mover el archivo. Asegúrate de que %docName%.pdf existe.
)

pause
