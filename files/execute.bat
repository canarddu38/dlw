@for /f "token=1-2 delims=##" %%a in ('type output.txt') do echo %%a
pause