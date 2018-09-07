
$profileScript = (Split-Path -Path $profile) + "\a_brit_abroad_profile.ps1"

& $profileScript

Set-Alias -Name BH -Value BranchHistory
Set-Alias -Name BD -Value BranchDiff

function ngm { Invoke-Expression 'npm run mock' }
