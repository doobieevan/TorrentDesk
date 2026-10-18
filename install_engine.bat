@echo off
setlocal
cd /d "%~dp0"
echo No dependency installation is performed.
echo The high-performance BitTorrent backend must already be bundled or present locally.
echo Set TORRENTDESK_LIBTORRENT_PYTHON to an existing local backend path if needed.
pause
