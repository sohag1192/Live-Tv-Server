@echo off
REM === Full Git Upload Script for NLive-Tv-Server ===
REM Author: Sohag

SET "PROJECT_DIR=C:\Users\Md Sohag Rana\Downloads\Live-Tv-Server-master\Live-Tv-Server-master"
SET "REPO_URL=https://github.com/sohag1192/NLive-Tv-Server.git"
SET "COMMIT_MSG=Initial commit by Sohag"
SET "BRANCH=main"
SET "GIT_USER=sohag1192"
SET "GIT_EMAIL=sohag1192@gmail.com"

echo Setting global Git identity...
git config --global user.name "%GIT_USER%"
git config --global user.email "%GIT_EMAIL%"

echo Navigating to project directory...
cd /d "%PROJECT_DIR%"

echo Initializing Git repository...
git init

echo Removing existing origin (if any)...
git remote remove origin 2>nul

echo Adding remote origin...
git remote add origin "%REPO_URL%"

echo Staging all files...
git add .

echo Creating initial commit...
git commit -m "%COMMIT_MSG%"

echo Renaming branch to '%BRANCH%'...
git branch -M %BRANCH%

echo Pushing to GitHub...
git push -u origin %BRANCH%

echo === Upload Complete ===
pause