@echo off
echo -------------------------------------------------
echo Bienvenido al generador de plantillas TeXstudio
echo -------------------------------------------------
set "dir=%%TEMPLATE-PATH%%"
set "codigo1=05.575"
set "codigo2=05.582"
set "codigo3=05.589"
set "codigo4=05.572"
set "asignatura1=Administració de Xarxes i Sistemes Operatius"
set "asignatura2=Intel·ligència Artificial"
set "asignatura3=Sistemes Distribuïts"
set "asignatura4=Xarxes i Aplicacions Internet"
set "short1=AXSO"
set "short2=IA"
set "short3=SSDD"
set "short4=XAI"
echo 1  %asignatura1%  %codigo1%
echo 2  %asignatura2%  %codigo2%
echo 3  %asignatura3%  %codigo3%
echo 4  %asignatura4%  %codigo4%
set /p "indice=Introduce el indice de la asignatura: "
if "%indice%"=="1" (
    set "codi=%codigo1%"
    set "assignatura=%asignatura1%"
    set "short=%short1%"
) else if "%indice%"=="2" (
    set "codi=%codigo2%"
    set "assignatura=%asignatura2%"
	set "short=%short2%"
) else if "%indice%"=="3" (
    set "codi=%codigo3%"
    set "assignatura=%asignatura3%"
	set "short=%short3%"
) else if "%indice%"=="4" (
    set "codi=%codigo4%"
    set "assignatura=%asignatura4%"
	set "short=%short4%"
)
set /p "nom=Introduce el nombre del documento: "
Setlocal EnableDelayedExpansion
set "nombre_documento=%nom%"
SET YEAR = %TIME:~2,4%
set "nombre=%short%%YEAR%_%nombre_documento%"
cd "%short%"
echo.%nombre%
xcopy /E /I "%dir%" "%nombre%"
cd "%nombre%"
mkdir "screenshot"
mkdir "documents"
mkdir "aux"
mkdir "images"
mkdir "entregable"
rename template.tex "%nombre%.tex"
powershell -Command "(gc '%nombre%.tex') -replace '::CODI::', '%codi%' | Out-File -encoding UTF8 '%nombre%.tex'"
powershell -Command "(gc '%nombre%.tex') -replace '::SHORT::', '%short%' | Out-File -encoding UTF8 '%nombre%.tex'"
powershell -Command "(gc '%nombre%.tex') -replace '::ASSIGNATURA::', '%assignatura%' | Out-File -encoding UTF8 '%nombre%.tex'"
powershell -Command "(gc '%nombre%.tex') -replace '::NOM::', '%nom%' | Out-File -encoding UTF8 '%nombre%.tex'"
start "" "C:\Program Files\texstudio\texstudio.exe" "%nombre%.tex"
