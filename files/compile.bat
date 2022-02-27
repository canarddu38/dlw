@echo off
setlocal EnableDelayedExpansion

if exist "%1" (
    goto ifexist
) else (echo nope&goto:eof)

:ifexist

::count n of lines in file
set "cmd=findstr /R /N "^^" %1 | find /C ":""

for /f %%a in ('!cmd!') do set number=%%a

set filepath=%1

::get file content
set count=0
for /f "tokens=*" %%x in (%1) do (
set /a count+=1
set line[!count!]=%%x
)

::pre-build output with @echo off
echo @echo off>output.txt

::check witch line is written
for /l %%x in (1, 1, %number%) do (
	call :decompile %%x
)



:decompile %1
cls
@echo on
call files\convert.bat !line[%1]!
@echo off
cls

::generate temp file --> decompiled


