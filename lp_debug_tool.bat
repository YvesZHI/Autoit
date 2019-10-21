@echo off
set "file=project.info"
set /A i=0

for /F "usebackq delims=" %%a in ("%file%") do (
        set /A i+=1
        ::call echo %%i%%
        call set array[%%i%%]=%%a
        call set n=%%i%%
        )

::call echo %%array[1]%%
::call echo %%array[2]%%
::call echo %%array[3]%%
::call echo %%array[4]%%
::call echo %%array[5]%%
::call echo %%array[6]%%
call set argument1= -no-antispoof -pw %%array[3]%% %%array[1]%%@%%array[2]%% %%array[4]%%
call set argument2= -pw %%array[3]%% %%array[1]%%@%%array[2]%%:%%array[5]%% %%array[6]%%
::call echo %%argument1%%
::call echo %%argument2%%
call plink %%argument1%%
if %ERRORLEVEL% == 0 (
        call pscp %%argument2%%
        )

::for /L %%i in (1,1,%n%) do call echo %%array[%%i]%%

pause
