@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>nul && set "PYTHON=py -3" || set "PYTHON=python"
%PYTHON% main.py
if errorlevel 1 pause
