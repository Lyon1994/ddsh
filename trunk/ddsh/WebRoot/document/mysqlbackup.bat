@echo off
set d1=%date:~0,4%
set d2=%date:~5,2%
set d3=%date:~8,2%
set date=%d1%%d2%%d3%
set fdir=%d1%-%d2%-%d3%
md D:\db_backup\%fdir%
D:\MYSQL5\bin\mysqldump --opt -u root --password=root dd > D:\db_backup\%fdir%\%date%.sql