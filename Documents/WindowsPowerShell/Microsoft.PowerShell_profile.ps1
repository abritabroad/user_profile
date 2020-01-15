
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

function gcsu { Invoke-Expression 'git checkout Supplements' }

function gcl { Invoke-Expression 'git checkout -' }

function gcf { Invoke-Expression 'git clean -fd' }

function gcnb($branchName) {
    if (!$branchName) { write-host "Branch name missing"; return }
    Invoke-Expression 'git checkout -b $branchName' 
    Invoke-Expression 'git push -u origin $branchName --no-verify'
}

function gcp { Invoke-Expression 'git cherry-pick 0a1ac0f8 --no-commit' }

function glg { Invoke-Expression 'git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cd)%Creset %C(green)%ce%Creset %s"' }

function glgx { Invoke-Expression 'git log --graph --pretty=format:"%h%x09%d%x09(%cd)%x09%ce%x09%s" > GitLog.xls' }

function gmnc { Invoke-Expression 'git merge poc/angular_standalone --no-commit' }

function gpl { Invoke-Expression 'git pull' }

function gpu { Invoke-Expression 'git push --no-verify' }

function gpuf { Invoke-Expression 'git push --force --no-verify' }

function gra { Invoke-Expression 'git rebase --abort' }

function grcp {
    Invoke-Expression 'git restore --staged *'
    Invoke-Expression 'git restore *endpoints.ts'
}

function grd { Invoke-Expression 'git rebase develop' }

function grdo { Invoke-Expression 'git rebase develop -Xours' }

function grh { Invoke-Expression 'git reset --hard' }

function grho { 
    $currentBranch = Invoke-Expression '&git rev-parse --abbrev-ref HEAD'
    Invoke-Expression 'git reset --hard origin/$currentBranch'
}

function grs { Invoke-Expression 'git rebase Supplements' }

function grso { Invoke-Expression 'git rebase Supplements -Xours' }

function gs { Invoke-Expression 'git status' }

function gsq($commitOffset) {
    if (!$commitOffset) { write-host "Commit offset missing"; return }
    Invoke-Expression 'git rebase -i HEAD~$commitOffset' 
}

function nrl { Invoke-Expression 'npm run local' }

function ybp { Invoke-Expression 'yarn build-python' }

function ydp { Invoke-Expression 'yarn debug-page' }

function yla { Invoke-Expression 'yarn lint-angular' }

