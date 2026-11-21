@echo off
title PUSH DESAIN RUMAH KILAT KE GITHUB
color 0E
cls
echo =========================================================================
echo   DESAIN RUMAH KILAT -- GITHUB PUSH LAUNCHER
echo =========================================================================
echo.
echo Target Repositori:
echo https://github.com/solusarsitekstudio-hue/desain-rumah-kilat.git
echo.
echo * JIKA MUNCUL JENDELA LOGIN GITHUB (Git Credential Manager):
echo   Silakan klik "Sign in with your browser" untuk otorisasi 1-klik.
echo.
echo =========================================================================
echo.

cd /d "E:\WORKSHOP\DESAIN_RUMAH_KILAT"

:: 1. Pastikan commit lokal sudah rapi
git add .
git commit -m "feat: initial release Desain Rumah Kilat sales platform" >nul 2>&1

:: 2. Set remote origin
git remote remove origin >nul 2>&1
git remote add origin https://github.com/solusarsitekstudio-hue/desain-rumah-kilat.git

:: 3. Push branch main
echo [1/2] Mengunggah branch main...
git branch -M main
git push -u origin main

:: 4. Push branch gh-pages untuk auto deploy
echo.
echo [2/2] Mengunggah branch gh-pages (Otomatis Aktifkan GitHub Pages)...
git push origin main:gh-pages --force

if %ERRORLEVEL% EQU 0 (
    echo.
    echo =====================================================================
    echo   [BERHASIL] Web Desain Rumah Kilat sukses terunggah ke GitHub!
    echo.
    echo   Tautan Repositori : https://github.com/solusarsitekstudio-hue/desain-rumah-kilat
    echo   Tautan Web Pages  : https://solusarsitekstudio-hue.github.io/desain-rumah-kilat/
    echo =====================================================================
) else (
    echo.
    echo =====================================================================
    echo   [PERINGATAN] Push belum selesai. Pastikan repo sudah dibuat di:
    echo   https://github.com/new (dengan nama: desain-rumah-kilat)
    echo =====================================================================
)

echo.
echo Selesai. Tekan sembarang tombol untuk keluar...
pause >nul
