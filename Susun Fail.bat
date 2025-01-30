:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                             ::
::                   Author: Jeff Steveanus                    ::
:: Facebook/Instagram/Threads/LinkedIn/TikTok: @jeffsteveanus  ::
::                                                             ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                             ::
:: Tarikh: 2025-01-30                                          ::
:: Versi: 1.1                                                  ::
::                                                             ::
:: Penerangan: Batch file ini akan menyusun fail dalam         ::
::             folder semasa ke dalam subfolder berdasarkan    ::
::              jenis, tahun dan bulannya.                     ::
::                                                             ::
:: Penggunaan: Letakkan batch file ini dalam folder tempat     ::
::             fail yang ingin didusun berada dan jalankannya. ::
::                                                             ::
:: Nota: Batch file ini hanya diuji pada Windows 10.           ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
setlocal enabledelayedexpansion

:: Tentukan kategori fail
set "Compressed=zip rar 7z gz tar"
set "Videos=mp4 avi mkv mov wmv flv"
set "Musics=mp3 wav flac ogg aac"
set "Pictures=jpg jpeg png gif bmp tiff avif webp heif"
set "Documents=pdf doc docx xls xlsx ppt pptx txt csv"
set "Programs=exe msi"
set "images=img iso bin"

:: Tentukan folder sumber (folfer semasa)
set "SOURCE_DIR=%CD%"

:: Tentukan nama bulan
set "MonthNames=January February March April May June July August September October November December"

:: Loop semua fail dalam folder sumber
for %%F in (*.*) do (
    set "FILE=%%F"
    for %%C in (Compressed Videos Musics Pictures Documents) do (
        for %%E in (!%%C!) do (
            if /I "%%~xF"==".%%E" (
                
                :: Dapatkan tarikh fail dicipta
                for /f "tokens=2 delims==" %%A in ('wmic datafile where name^="%SOURCE_DIR:\=\\%\\!FILE!" get CreationDate /value ^| findstr "CreationDate"') do set "DATE=%%A"
                
                set "YEAR=!DATE:~0,4!"
                set "MONTH_NUM=!DATE:~4,2!"
                set /a "MONTH_INDEX=!MONTH_NUM!"
                
                :: Tukar nombor bulan kepada nama
                set "COUNT=0"
                for %%M in (%MonthNames%) do (
                    set /a COUNT+=1
                    if !COUNT! EQU !MONTH_INDEX! set "MONTH=%%M"
                )
                
                :: Buat folder tempat fail dipindahkan
                set "TARGET_DIR=%SOURCE_DIR%\%%C\!YEAR!\!MONTH!"
                if not exist "!TARGET_DIR!" mkdir "!TARGET_DIR!"
                
                :: Pindahkan fail
                move "!FILE!" "!TARGET_DIR!"
		echo Fail "!FILE!" dipindahkan ke "!TARGET_DIR!"
            )
        )
    )
)

echo.
echo Fail berjaya disusun mengikut jenis, tahun dan bulan. Tekan apa-apa butang untuk keluar.
pause>nul
