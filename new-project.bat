@echo off
setlocal enabledelayedexpansion
echo Lege ein neus Projekt an in %cd%
if "%TEMPLATE_DIR%"=="" (
    set TEMPLATE_DIR=%~dp0_template
    if not exist "%TEMPLATE_DIR%" (
        echo Es konnte keine TEMPLATE_DIR in deinen Umgebungsvariablen gefunden werden.
        :ask_template
        set /p TEMPLATE_DIR="Wo liegen die Template Datein?: "
        if not exist "%TEMPLATE_DIR%" (
            echo Fehler: Der Pfad '%TEMPLATE_DIR%' existiert nicht.
            goto ask_template
        )
    )
)

set PROJECTS_DIR=%cd%

set /p PROJECT_NAME="Projektnamen eingeben: "

set PROJECT_DIR=%PROJECTS_DIR%\%PROJECT_NAME%

:: --- Zielordner prüfen ---
if exist "%PROJECT_DIR%" (
    echo Fehler: Ordner '%PROJECT_DIR%' existiert bereits.
    exit /b 1
)
echo _________________________________
echo Erstelle Projekt '%PROJECT_NAME%' in %PROJECT_DIR% ...

:: --- Ordner anlegen ---
mkdir "%PROJECT_DIR%"
echo Template Datei werden kopiert.

copy "%TEMPLATE_DIR%\.gitignore"    "%PROJECT_DIR%\.gitignore"    >nul
copy "%TEMPLATE_DIR%\.dockerignore" "%PROJECT_DIR%\.dockerignore" >nul
copy "%TEMPLATE_DIR%\.claudeignore" "%PROJECT_DIR%\.claudeignore" >nul
copy "%TEMPLATE_DIR%\.env.example"  "%PROJECT_DIR%\.env.example"  >nul
echo _________________________________
:: --- README mit Projektnamen anpassen ---
powershell -Command "(Get-Content '%TEMPLATE_DIR%\README.md') -replace 'Projektname', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\README.md'"

:: --- Git initialisieren ---
git -C "%PROJECT_DIR%" init -q
echo Git repository initialisiert.

echo.
echo Projekt '%PROJECT_NAME%' erfolgreich erstellt!
echo.

endlocal
