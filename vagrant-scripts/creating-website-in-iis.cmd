@echo off

echo Creating app pool...
C:\Windows\System32\inetsrv\appcmd.exe add apppool /name:website /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrated

echo Creating website...
C:\Windows\System32\inetsrv\appcmd.exe add site /name:website /physicalPath:C:\website /bindings:http/*:1025:
C:\Windows\System32\inetsrv\appcmd.exe set app "website/" /applicationPool:"website"

:: https://technet.microsoft.com/en-us/library/hh831475(v=ws.11).aspx
::appcmd add app /site.name: string /path: string /physicalPath: string
::appcmd add app /site.name: contoso /path:/ marketing /physicalPath:c:\ application
echo Website is created. You can acces it by url http://127.0.0.1:1025/
