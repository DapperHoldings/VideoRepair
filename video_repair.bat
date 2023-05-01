@echo off
setlocal enabledelayedexpansion

REM Set the directory containing the video files.
set "VIDEO_DIRECTORY=D:\Tiktok\[Lives]"

REM Set the FFmpeg path.
set "FFMPEG_PATH=D:\ffmpeg-2023-04-26-git-e3143703e9-full_build\bin\ffmpeg.exe"

REM Set the file extensions you want to process.
set "EXTENSIONS=*.mp4 *.mkv *.avi *.mov *.flv"

echo Repairing video files in %VIDEO_DIRECTORY%
cd /D "%VIDEO_DIRECTORY%"

for %%i in (%EXTENSIONS%) do (
    echo Repairing %%i
    %FFMPEG_PATH% -i "%%i" -c copy -map 0 -fflags +genpts "repaired_%%~ni%%~xi"
)
echo All video files have been repaired.
pause
