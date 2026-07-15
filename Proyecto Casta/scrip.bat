@echo off

:loop
sc query MSSQLSERVER | find "RUNNING"
if %errorlevel% neq 0 (
    net start MSSQLSERVER
    timeout /t 10
    goto loop
)

echo SQL Server ya está corriendo