param($tag)

# Tag can be nightly or stable

$installDirectory = "C:\NVME Files\Personal\Programs\Neovim-nightly"

Write-Host($args[0])

$originalVersion = @(& "$installDirectory\bin\nvim.exe" --version)[0]

Invoke-WebRequest "https://github.com/neovim/neovim/releases/download/$tag/nvim-win64.zip" -OutFile "$env:TEMP\nvim-win64.zip"

# Delete all existing files in the install path
Get-ChildItem -Path $installDirectory -Force | ForEach-Object {Remove-Item $_.FullName -Recurse -Force}

# Expand the downloaded archive
Expand-Archive "$env:TEMP\nvim-win64.zip" -DestinationPath $installDirectory -Force

# Moves the files up directory
$items = Get-ChildItem -Path "$installDirectory\nvim-win64"
foreach ($item in $items) {
    Move-Item -Path $item.FullName -Destination (Split-Path (Split-Path $item.FullName -Parent) -Parent)
}

# Clean up the downloaded archive and zip folder
Remove-Item "$env:TEMP\nvim-win64.zip"
Remove-Item "$installDirectory\nvim-win64"

# $newVersion = @(& nvim --version)[0]
$newVersion = @(& "$installDirectory\bin\nvim.exe" --version)[0]

if ($originalVersion -eq $newVersion) {
    Write-Host("There was no new version available")
}
else {
    Write-Host("Update from $originalVersion to $newVersion")
}

# Wait for the user to press any key
$null = [System.Console]::ReadKey($true)

