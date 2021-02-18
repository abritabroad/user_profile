
function gbh() {
  git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads
}

function gbd() {
  git diff --name-status develop..
}

function gcam() {
  if [ -z "$1" ]; then
      echo -e "\nComment missing\n"
      return 1
  fi
  git commit -am "$1" --no-verify
}

function gcd() {
  git checkout develop
}

function gcsu() {
  git checkout Supplements
}

function gcl() {
  git checkout -
}

function gcf() {
  git clean -fd
}

function gcnb() {
  if [ -z "$1" ]; then
      echo -e "\nBranch name missing\n"
      return 1
  fi
  git checkout -b $1
  git push -u origin $1 --no-verify
}

function gcp() {
  if [ -z "$1" ]; then
      echo -e "\nCommit # missing\n"
      return 1
  fi
  git cherry-pick $1 --no-commit
}

function glg() {
  git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cd)%Creset %C(green)%ce%Creset %s"
}

function glgx() {
  git log --graph --pretty=format:"%h%x09%d%x09(%cd)%x09%ce%x09%s" > GitLog.xls
}

function gpl() {
  git pull
}

function gpu() {
  git push --no-verify
}

function gpuf() {
  git push --force --no-verify
}

function gra() {
  git rebase --abort
}

function grd() {
  git rebase develop
}

function grdo() {
  git rebase develop -X ours
}

function grh() {
  git reset --hard
}

function grhd() {
  git reset HEAD~
}

function grho() {
  currentBranch = git rev-parse --symbolic-full-name --abbrev-ref HEAD
  git reset --hard origin/$currentBranch
}

function gs() {
  git status
}

function gsq() {
  if [ -z "$1" ]; then
      echo -e "\nCommit # missing\n"
      return 1
  fi
  git rebase -i HEAD~$1
}
