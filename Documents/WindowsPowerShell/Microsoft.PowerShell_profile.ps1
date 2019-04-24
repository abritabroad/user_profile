
$profileRoot = (Split-Path -Path $profile)

$profileScript = $profileRoot + "\a_brit_abroad_profile.ps1"

& $profileScript

$env:path += ";$profileRoot"

remove-item env:ELECTRON_RUN_AS_NODE -erroraction 'silentlycontinue'

function ngm { Invoke-Expression 'npm run mock' }

function gcd { Invoke-Expression 'git checkout develop' }

function grh { Invoke-Expression 'git reset --hard' }

function gbh { Invoke-Expression "git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads" }

# function bd { Invoke-Expression 'git diff --name-status master..' }
function gbd { Invoke-Expression 'git diff --name-status develop..' }

