@echo off
title Jackson Lab - Auto Publish Watcher
echo.
echo  =====================================================
echo   Jackson Lab Antibody Tracker - Auto Publish
echo   Watching for changes to antibody-tracker.html...
echo   Changes will be pushed to GitHub Pages automatically.
echo   Press Ctrl+C to stop.
echo  =====================================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0watch-and-push.ps1"
pause
