@echo off

echo Installing SQL Server 2008 Express R2, it will take a while...
::C:\vagrant\SQLEXPRADV_x64_ENU.exe /extract: "C:\vagrant\SQLEXPRADV_x64_ENU"
C:\vagrant\SQLEXPRADV_x64_ENU.exe /Q
::C:\vagrant\SQLEXPRADV_x64_ENU\Setup.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="MSSQLSERVER" /INSTANCEID="MSSQLSERVER" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="#SAPassword!"
C:\Windows\SysWOW64\SQLEXPRADV_x64_ENU\SETUP.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="MSSQLSERVER" /INSTANCEID="MSSQLSERVER" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="#SAPassword!"

echo Disabling firewall
netsh advfirewall set allprofiles state off
echo Done!
