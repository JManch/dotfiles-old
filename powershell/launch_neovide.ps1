# This script launches Neovide and ensures that it gets focused. I've been
# having issues on Windows where Neovide doesn't get focused when launched.

# Shortcut command: mshta vbscript:Execute("CreateObject(""Wscript.Shell"").Run ""powershell -NoLogo -Command """"& 'C:\Users\Joshua\.config\powershell\launch_neovide.ps1'"""""", 0 : window.close")

$path = "C:\Users\Joshua\Scoop\apps\neovide\current\Neovide.exe"
[String[]]$arguments = "--frame full"
Start-Process -FilePath $path -WorkingDirectory "$HOME" -ArgumentList $arguments

# Get process id
$id = (Get-Process -ErrorAction Ignore "Neovide").Where({ $_.MainWindowTitle }, 'First').Id
if (-not $id) { Throw "Failed to find Neovide process" }

# Focus on window
$result = (New-Object -ComObject Wscript.Shell).AppActivate($id)
