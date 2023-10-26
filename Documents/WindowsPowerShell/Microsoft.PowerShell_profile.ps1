
$profileRoot = (Split-Path -Path $profile)

$profileScript = $profileRoot + "\a_brit_abroad_profile.ps1"

& $profileScript

$env:path += ";$profileRoot"

remove-item env:ELECTRON_RUN_AS_NODE -erroraction 'silentlycontinue'

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

function gcma { Invoke-Expression 'git checkout master' }

function gDeleteAllBranches { Invoke-Expression "git for-each-ref --format '%(refname:short)' refs/heads | ForEach-Object { git branch `$_ -d }" }

function glg { Invoke-Expression 'git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cd)%Creset %C(green)%ce%Creset %s"' }

function glgx { Invoke-Expression 'git log --graph --pretty=format:"%h%x09%d%x09(%cd)%x09%ce%x09%s" > GitLog.xls' }

function gmnc { Invoke-Expression 'git merge poc/angular_standalone --no-commit' }

function gpl { Invoke-Expression 'git pull' }

function gPrune { Invoke-Expression "git remote prune origin" }

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

function nrm { Invoke-Expression 'npm run mock' }

function nrs { Invoke-Expression 'npm run start' }

function ybp { Invoke-Expression 'yarn build-python' }

function ydp { Invoke-Expression 'yarn debug-page' }

function yla { Invoke-Expression 'yarn lint-angular' }

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

$ENV:NGROK_AUTHTOKEN=""

$ENV:KENDO_UI_LICENSE=""
$ENV:TOKEN_FISHNET=""
$ENV:TOKEN_NUGET=""
$ENV:TOKEN_NPM=""

$ENV:VSS_NUGET_EXTERNAL_FEED_ENDPOINTS=$([Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($ENV:TOKEN_FISHNET)))

oh-my-posh init pwsh | Invoke-Expression

if ($pwd.path.equals("C:\Users\a_bri")) {
    cd C:\Users\a_bri\source\repos\fnm\FishNet\Merchandise-Microservices  
}
