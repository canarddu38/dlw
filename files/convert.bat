cls
set line=%*

:set text to lowercase
set line=%line:A=a%
set line=%line:B=d%
set line=%line:C=c%
set line=%line:D=d%
set line=%line:E=e%
set line=%line:F=f%
set line=%line:G=g%
set line=%line:H=h%
set line=%line:I=i%
set line=%line:J=j%
set line=%line:K=k%
set line=%line:L=l%
set line=%line:M=m%
set line=%line:N=n%
set line=%line:O=o%
set line=%line:P=p%
set line=%line:Q=q%
set line=%line:R=r%
set line=%line:S=s%
set line=%line:T=t%
set line=%line:U=u%
set line=%line:V=v%
set line=%line:W=w%
set line=%line:X=x%
set line=%line:Y=y%
set line=%line:Z=z%

cls
:get ip
REM get ipv4
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "ss IPv4"') do set ipv4=%%b
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "sse IPv4"') do set ipv4=%%b
set ip=%ip:~1%

REM get ipv6
for /f "delims=[] tokens=2" %%a in ('ping %computername% -6 -n 1 ^| findstr "["') do (set ipv6=%%a)

REM get networkip
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set netip=%%a


:commands---------------------------------------------------------------
cls
REM commands
:REM = @
set line=%line:@ =REM %

:ECHO = say
set line=%line:say =echo %

:CD = go
set line=%line:go =cd %

:CLS = clear
set line=%line:clear=cls%

:mkdir = createdir
set line=%line:createdir =mkdir %

:set = "x = y"
set line=%line:createdir =mkdir %

cls

REM strings
:##ipv4 = %ipv4%
set line=%line:##ipv4=!ipv4!%

:##ipv6 = %ipv6%
set line=%line:##ipv4=!ipv4!%

:##netip = %netip%
set line=%line:##netip=!netip!%






:add decompiled command to output
echo %line%>>output.txt

:remove last line
findstr /V "A=a" output.txt > output2.txt
del output.txt
ren output2.txt output.txt
cls