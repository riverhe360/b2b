REM ------ bcp tables in list to csv files-----------------
REM ------usage: bcp_DB.bat DBname ------------------------
REM --fo example: bcp_DB.bat kantar -----------------------

echo %1%


set DBname=%1%
set base_dir=C:/riverhe2020/ITSP/360insights/staging/%DBname%

FOR /F "tokens=*" %%X  IN (%DBname%_list.txt) DO (
bcp %%X  OUT "%base_dir%/%%X.csv" -d %DBname% -c  -a 65535 -t, -e "%base_dir%/%%X.err" -m 200 -S "PDEVTEST.exp.perksww.com" -T
)