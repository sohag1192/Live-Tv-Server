<<<<<<< HEAD
@echo off
REM === Full Git Upload Script for NLive-Tv-Server ===
REM Author: Sohag

SET "PROJECT_DIR=C:\Users\Md Sohag Rana\Downloads\Live-Tv-Server-master\Live-Tv-Server-master"
SET "REPO_URL=https://github.com/sohag1192/Live-Tv-Server.git"
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
=======


@echo off
REM ====== GitHub Auto Upload Script ======
REM Author: Md. Sohag Rana
REM GitHub: https://github.com/sohag1192

:: === CONFIGURATION ===
set "LOCAL_DIR=C:\Users\Md Sohag Rana\Downloads\GitHub\Live-Tv-Server"
set "REPO_URL=https://github.com/sohag1192/Live-Tv-Server.git"
set "USER_NAME=sohag1192"
set "USER_EMAIL=sohag1192@gmail.com"
set "BRANCH_NAME=main"

:: === COMMIT MESSAGE ===
if "%~1"=="" (
    set "COMMIT_MSG=Auto commit - %date% %time%"
) else (
    set "COMMIT_MSG=%~1"
)

:: === NAVIGATE TO LOCAL DIRECTORY ===
cd /d "%LOCAL_DIR%"
if errorlevel 1 (
    echo ❌ Failed to access directory: %LOCAL_DIR%
    pause
    exit /b
)

:: === SET GIT CONFIG ===
git config user.name "%USER_NAME%"
git config user.email "%USER_EMAIL%"

:: === INITIALIZE REPO IF NEEDED ===
if not exist ".git" (
    git init
    git branch -M %BRANCH_NAME%
    git remote add origin "%REPO_URL%"
)

:: === ADD ALL CHANGES ===
git add .

:: === COMMIT ===
git commit -m "%COMMIT_MSG%" >nul 2>&1
if errorlevel 1 (
    echo ⚠️ Nothing to commit. Working directory clean.
) else (
    echo ✅ Changes committed: %COMMIT_MSG%
)

:: === PULL BEFORE PUSH TO AVOID CONFLICTS ===
git pull origin %BRANCH_NAME% --rebase >nul 2>&1

:: === PUSH TO GITHUB ===
git push -u origin %BRANCH_NAME%
if errorlevel 1 (
    echo ❌ Push failed. Check credentials or network.
    pause
    exit /b
)

:: === DONE ===
echo.
echo ===============================
echo  ✅ Upload to GitHub completed
echo ===============================
>>>>>>> 17c4baf (Auto commit - Sun 10/26/2025 13:40:53.87)
pause