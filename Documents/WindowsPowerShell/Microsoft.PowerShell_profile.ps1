
$profileRoot = (Split-Path -Path $profile)

$profileScript = $profileRoot + "\a_brit_abroad_profile.ps1"

& $profileScript

$env:path += ";$profileRoot"

Set-Alias -Name BH -Value BranchHistory
Set-Alias -Name BD -Value BranchDiff

remove-item env:ELECTRON_RUN_AS_NODE -erroraction 'silentlycontinue'

function ngm { Invoke-Expression 'npm run mock' }
