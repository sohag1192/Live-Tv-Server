@echo off
REM ============================================
REM  GitHub Upload Script (fixed for master branch)
REM  Author    : sohag1192
REM  Date      : %date% %time%
REM ============================================

cd /d "C:\Users\sohag\Downloads\GitHub_Upload\Live-Tv-Server"

IF NOT EXIST ".git" (
    echo Initializing new Git repository...
    git init
    git remote add origin https://github.com/sohag1192/how-to-forward-dns-TCP-UDP-to-mikrotik-dns.git
    git branch -M master
)

REM Stage and commit changes
git add .
set CURRDATE=%date% %time%
git commit -m "Auto commit on %CURRDATE% with Sohag1192 updates"

REM Pull latest changes safely
git pull origin master --rebase

REM Push to correct branch
git push origin master

echo.
echo ============================================
echo   Upload Completed Successfully to GitHub
echo ============================================
pause