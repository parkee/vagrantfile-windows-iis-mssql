@echo off

echo Installing SQL Server 2008 Express R2, it will take a while...
C:\vagrant\SQLEXPRADV_x64_ENU.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="MSSQLSERVER" /INSTANCEID="MSSQLSERVER" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="#SAPassword!"

echo Disabling firewall
netsh advfirewall set allprofiles state off
echo Done!
