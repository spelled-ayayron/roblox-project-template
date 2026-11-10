@echo off

cd /d "%~dp0.." || exit /b 1

wally install || exit /b 1

rojo sourcemap default.project.json -o sourcemap.json || exit /b 1
wally-package-types --sourcemap sourcemap.json Packages/ || exit /b 1
if exist ServerPackages\ ( wally-package-types --sourcemap sourcemap.json ServerPackages/ || exit /b 1 )