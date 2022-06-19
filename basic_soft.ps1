$decision = Read-Host -Prompt "Type '1' for winget install, type '2' for choco install"

if ($decision -eq 2) {
	try {
        $install = choco -v;
        Write-Host "Chocolatey installed. Chocolatey version: " $install " . Software installation will proceed."\
    }  
    catch {
        Write-Host "Choco not installed. Do it manually then RESTART script."
        Start-Sleep -Seconds 5
        Exit
    }
    choco feature enable -n allowGlobalConfirmation


    $soft_list = Get-Content $PSScriptRoot\choco_soft.txt
    foreach ($soft in $soft_list) {
        choco install $soft
    }
}
elseif ($decision -eq 1) {
    try {
        $install = winget --version;
        Write-Host "Winget installed. Winget version: " $install " . Software installation will proceed."\
    }  
    catch {
        Write-Host "Winget not installed. Do it manually then RESTART script."
        Start-Sleep -Seconds 5
        Exit        
    }


    $soft_list = Get-Content $PSScriptRoot\winget_soft.txt
    foreach ($soft in $soft_list) {
        winget install $soft
    }
}
else {
    Write-Host "Game over."
    Read-Host
}


<<<<<<< HEAD

Write-Host "Manual Install Docker Desktop"
[system.Diagnostics.Process]::Start("msedge","https://docs.docker.com/desktop/windows/install/")
Read-Host -Prompt "Press enter to continue"

Write-Host "Manual Install Python"
[system.Diagnostics.Process]::Start("msedge","https://www.python.org/downloads/")
Read-Host -Prompt "Press enter to continue"
=======
choco install notepadplusplus.install --force
choco install discord --force
choco install vlc --force
choco install Firefox --force
choco install spotify --force
choco install paint.net --force
choco install adobereader --force
choco install PDFXchangeEditor --force
choco install 7zip.install --force
choco install Bitwarden --force
choco install windirstat --force
choco install powertoys --force
>>>>>>> 592408f749fa715e14498d26a87023a6546a9f68

#resources
#https://www.reddit.com/r/chocolatey/comments/esqqfz/is_it_possible_to_install_multiple_packages_at/