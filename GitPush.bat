@echo off
REM d:
REM cd D:\Code\chudson121.github.io\
set /p COMMITMSG="Enter Commit message: "

Git fetch
Git pull
Git add .
Git commit -am"%COMMITMSG%"
Git push