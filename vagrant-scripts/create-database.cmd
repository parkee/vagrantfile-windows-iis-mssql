@echo off

echo Creating database...
SQLCMD.EXE -i C:\vagrant\db\create.sql
echo Database is created