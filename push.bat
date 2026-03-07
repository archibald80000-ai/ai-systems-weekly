@echo off
setlocal
cd /d "%~dp0"

echo.
echo [1/6] Current repository:
echo %CD%
echo.
echo [2/6] Git status:
git status
if errorlevel 1 goto :git_error

for /f "delims=" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i
echo.
if /I not "%CURRENT_BRANCH%"=="main" (
    echo [Notice] Current branch is "%CURRENT_BRANCH%". Push target remains origin main.
) else (
    echo [Notice] Current branch is "main".
)

echo.
echo [3/6] Staging changes...
git add .
if errorlevel 1 goto :git_error

echo.
set /p COMMIT_MSG=Enter commit message (leave blank for default): 
if "%COMMIT_MSG%"=="" set COMMIT_MSG=chore: update content repository

echo.
echo [4/6] Creating commit...
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo [Notice] Commit was not created. This usually means there are no staged changes.
)

echo.
echo [5/6] Pushing to origin main...
git push origin main
if errorlevel 1 goto :git_error

echo.
echo [6/6] Done.
goto :eof

:git_error
echo.
echo [Error] Git command failed. Check output above.
exit /b 1
