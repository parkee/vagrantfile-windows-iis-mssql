# http://stackoverflow.com/a/9949105
#$ErrorActionPreference = "Stop"

#import-module servermanager
#echo "Enabling .NET Framework"
#Install-WindowsFeature NET-Framework-45-ASPNET
# http://geekswithblogs.net/Wchrabaszcz/archive/2013/09/04/how-to-install-windows-server-features-using-powershell--server.aspx
$ErrorActionPreference = "Stop"

import-module servermanager
echo "Installing .NET Framework"
Install-WindowsFeature Net-Framework-Core
