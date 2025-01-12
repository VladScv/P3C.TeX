@echo off
:: Script para eliminar archivos auxiliares generados por LaTeX
setlocal
set docName=documento

:: Lista de extensiones auxiliares a eliminar
for %%x in (aux log toc out synctex.gz lof lot fls fdb_latexmk bbl blg nav snm) do (
    del /Q "%%~nxd%docName%.%%x" 2>nul
)

echo Archivos auxiliares eliminados.
pause
