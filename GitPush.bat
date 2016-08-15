@echo off
set /p COMMITMSG="Enter Commit message: "

Git fetch
Git pull
Git add .
Git commit -am"%COMMITMSG%"
Git push