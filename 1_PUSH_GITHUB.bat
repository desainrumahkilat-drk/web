@echo off
title PUSH DESAIN RUMAH KILAT KE GITHUB
color 0E
cls
echo =========================================================================
echo   DESAIN RUMAH KILAT -- GITHUB PUSH LAUNCHER
echo =========================================================================
echo.
echo Target Repositori:
echo https://github.com/desainrumahkilat-drk/web.git
echo Email Pengunggah: desainrumahkilat@gmail.com
echo.
echo * JIKA MUNCUL JENDELA LOGIN GITHUB (Git Credential Manager):
echo   Silakan login dengan akun: desainrumahkilat-drk
echo.
echo =========================================================================
echo.

cd /d "E:\WORKSHOP\DESAIN_RUMAH_KILAT"

:: 1. Atur identitas lokal git agar 100% brand anonim
git config --local user.name "Desain Rumah Kilat"
git config --local user.email "desainrumahkilat@gmail.com"

:: 2. Pastikan commit lokal sudah rapi
git add .
git commit -m "feat: configure official email and repository for Desain Rumah Kilat" >nul 2>&1

:: 3. Set remote origin
git remote remove origin >nul 2>&1
git remote add origin https://github.com/desainrumahkilat-drk/web.git

:: 4. Push branch main
echo [1/2] Mengunggah branch main...
git branch -M main
git push -u origin main

:: 5. Push branch gh-pages untuk auto deploy
echo.
echo [2/2] Mengunggah branch gh-pages (Otomatis Aktifkan GitHub Pages)...
git push origin main:gh-pages --force

if %ERRORLEVEL% EQU 0 (
    echo.
    echo =====================================================================
    echo   [BERHASIL] Web Desain Rumah Kilat sukses terunggah ke GitHub!
    echo.
    echo   Tautan Repositori : https://github.com/desainrumahkilat-drk/web
    echo   Tautan Web Pages  : https://desainrumahkilat-drk.github.io/web/
    echo =====================================================================
) else (
    echo.
    echo =====================================================================
    echo   [PERINGATAN] Push belum selesai. Pastikan akun desainrumahkilat-drk
    echo   sudah membuat repositori 'web' di GitHub.
    echo =====================================================================
)

echo.
echo Selesai. Tekan sembarang tombol untuk keluar...
pause >nul
