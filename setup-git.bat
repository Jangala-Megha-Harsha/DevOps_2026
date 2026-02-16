@echo off
REM Finance CI Integration - Git Setup Script
REM Run this batch file to initialize git and push to GitHub

echo.
echo ====================================================
echo  Finance CI Integration - Git Setup
echo ====================================================
echo.

REM Change to project directory
cd /d d:\Devops2026\20260216\finance-ci-integration

REM Initialize git
echo [1/6] Initializing git repository...
git init
if errorlevel 1 (
    echo ERROR: Failed to initialize git
    pause
    exit /b 1
)
echo.

REM Add all files
echo [2/6] Adding all files...
git add .
echo.

REM Create commit
echo [3/6] Creating initial commit...
git commit -m "Add backend APIs + integration tests + CI workflow"
if errorlevel 1 (
    echo ERROR: Failed to create commit
    pause
    exit /b 1
)
echo.

REM Set main branch
echo [4/6] Setting main branch...
git branch -M main
echo.

REM Configure remote
echo [5/6] Configuring GitHub remote...
set /p github_user="Enter your GitHub username: "
set /p repo_name="Enter your repository name: "

git remote add origin https://github.com/%github_user%/%repo_name%.git
echo.

REM Push to GitHub
echo [6/6] Pushing to GitHub...
echo You may be prompted to authenticate with GitHub.
echo.
git push -u origin main

if errorlevel 1 (
    echo.
    echo ERROR: Push failed. Check your GitHub credentials.
    echo.
    echo Try again with:
    echo   git push -u origin main
) else (
    echo.
    echo ====================================================
    echo  SUCCESS! Code pushed to GitHub!
    echo ====================================================
    echo.
    echo View your repository at:
    echo   https://github.com/%github_user%/%repo_name%
    echo.
    echo View CI status at:
    echo   https://github.com/%github_user%/%repo_name%/actions
    echo.
)

pause
