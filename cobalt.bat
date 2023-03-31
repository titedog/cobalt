@echo off
setlocal enabledelayedexpansion

set index=0
for /f "tokens=*" %%a in (%1) do (
  set /a index=0

  Rem Caches all tokens
  for %%b in (%%a) do (
   set /a index=!index!+1
   set !index!=%%b
  )

  Rem Stores a value
  if !1! == str (
    set /a val_!2!=!3!
  )
  Rem Prints a value
  if !1! == see (
    set num=!2!
    call :push val_!num!
    echo !current!
  )
  Rem Adds a stored value
  if !2! == + (
    set /a val_!1!+=!3!
  )
  Rem Subtracts a stored value
  if !2! == - (
    set /a val_!1!-=!3!
  )
  Rem Multiplies a stored value
  if !2! == x (
    set /a val_!1!*=!3!
  )
  Rem Divides a stored value
  if !2! == / (
    set /a val_!1!/=!3!
  )
)
pause

:push
set current=!%1!
exit /b
