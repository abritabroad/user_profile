
$profileRoot = (Split-Path -Path $profile)

$profileScript = $profileRoot + "\a_brit_abroad_profile.ps1"

& $profileScript

$env:path += ";$profileRoot"

remove-item env:ELECTRON_RUN_AS_NODE -erroraction 'silentlycontinue'

function ngm { Invoke-Expression 'npm run mock' }

function gbh { Invoke-Expression "git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads" }

# function bd { Invoke-Expression 'git diff --name-status master..' }
function gbd { Invoke-Expression 'git diff --name-status develop..' }

function gcam($message) { Invoke-Expression 'git commit -am $message --no-verify' }

function gcd { Invoke-Expression 'git checkout develop' }

function gcf { Invoke-Expression 'git clean -fd' }

function gcl { Invoke-Expression 'git checkout -' }

function gcnb($branchName) {
    if (!$branchName) { write-host "Branch name missing"; return }
    Invoke-Expression 'git checkout -b $branchName' 
    Invoke-Expression 'git push -u origin $branchName --no-verify'
}

function gcp { Invoke-Expression 'git cherry-pick ad532 --no-commit' }

function glg { Invoke-Expression 'git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cd)%Creset %C(green)%ce%Creset %s"' }

function gmnc { Invoke-Expression 'git merge poc/angular_standalone --no-commit' }

function gpl { Invoke-Expression 'git pull' }

function gpu { Invoke-Expression 'git push --no-verify' }

function gpuf { Invoke-Expression 'git push --force' }

function gra { Invoke-Expression 'git rebase --abort' }

function grh { Invoke-Expression 'git reset --hard' }

function grho { 
    $currentBranch = Invoke-Expression '&git rev-parse --abbrev-ref HEAD'
    Invoke-Expression 'git reset --hard origin/$currentBranch'
}

function grd { Invoke-Expression 'git rebase develop' }

function grdo { Invoke-Expression 'git rebase develop -Xours' }

function gs { Invoke-Expression 'git status' }

function gsq($commitOffset) {
    if (!$commitOffset) { write-host "Commit offset missing"; return }
    Invoke-Expression 'git rebase -i HEAD~$commitOffset' 
}

function ybp { Invoke-Expression 'yarn build-python' }

function ydp { Invoke-Expression 'yarn debug-page' }

function yla { Invoke-Expression 'yarn lint-angular' }

