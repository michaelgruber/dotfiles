@Echo Off

set "srcs=.gitconfig .gitignore_global"

for %%s in (%srcs%) do (
  set "dest=%HOMEPATH%\%%s"
  del %dest%
  mklink "%HOMEPATH%\%%s" "%~dp0..\%%s"
)
