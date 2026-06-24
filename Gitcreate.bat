@echo off
title Git Setup
color 0A

echo.
echo  Git Repository Setup
echo  ================================
echo.

:: Git identity
set /p GIT_EMAIL=" GitHub email: "
set /p GIT_NAME=" GitHub username: "
set /p REMOTE_URL=" Remote URL (e.g. https://github.com/YOU/REPO): "
echo.

git config --global user.email "%GIT_EMAIL%"
git config --global user.name "%GIT_NAME%"
echo  [OK] Git identity set.

:: Init
git init
git add .
git commit -m "Initial commit"
echo  [OK] Initial commit created.

:: Remote & push
git remote add origin %REMOTE_URL%
git branch -M main
git push -u origin main

echo.
echo  ================================
echo   Done! Repo pushed to GitHub.
echo  ================================
echo.
pause
