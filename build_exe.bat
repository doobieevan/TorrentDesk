@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>nul
if errorlevel 1 (
  echo Python launcher is required. No packages will be downloaded.
  exit /b 1
)
set "PYTHON=py -3"
%PYTHON% -m compileall -q core ui main.py
if errorlevel 1 exit /b 1
%PYTHON% -m unittest discover -v -s tests -p "test_*.py"
if errorlevel 1 exit /b 1
if exist dist\TorrentDesk.exe (
  taskkill /f /im TorrentDesk.exe >nul 2>nul
  timeout /t 1 /nobreak >nul
)
%PYTHON% -m PyInstaller --clean --noconfirm TorrentDesk.spec
if errorlevel 1 exit /b 1
echo Build completed without downloading dependencies.
