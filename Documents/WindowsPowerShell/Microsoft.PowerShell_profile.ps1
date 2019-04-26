﻿
$profileRoot = (Split-Path -Path $profile)

$profileScript = $profileRoot + "\a_brit_abroad_profile.ps1"

& $profileScript

$env:path += ";$profileRoot"

remove-item env:ELECTRON_RUN_AS_NODE -erroraction 'silentlycontinue'

function ngm { Invoke-Expression 'npm run mock' }

function gbh { Invoke-Expression "git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads" }

function ngm { Invoke-Expression 'npm run mock' }

function gbh { Invoke-Expression "git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads" }

# function bd { Invoke-Expression 'git diff --name-status master..' }
function gbd { Invoke-Expression 'git diff --name-status develop..' }

function gcam($message) { Invoke-Expression 'git commit -am $message' }

function gcd { Invoke-Expression 'git checkout develop' }

function gpl { Invoke-Expression 'git pull' }

function gpo { Invoke-Expression 'git push' }

function gpof { Invoke-Expression 'git push --force' }

function gra { Invoke-Expression 'git rebase --abort' }

function grh { Invoke-Expression 'git reset --hard' }

function grd { Invoke-Expression 'git rebase develop' }

function grdo { Invoke-Expression 'git rebase develop -Xours' }

function gs { Invoke-Expression 'git status' }

function ybp { Invoke-Expression 'yarn build-python' }

function ydp { Invoke-Expression 'yarn debug-page' }

function yla { Invoke-Expression 'yarn lint-angular' }

