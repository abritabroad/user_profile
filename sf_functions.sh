
gbh() {
  git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads
}

# # function bd { Invoke-Expression 'git diff --name-status master..' }
gbd() {
  git diff --name-status develop..
}

gcam() {
  if [ -z "$1" ]; then
      echo -e "\nComment missing\n"
      return 1
  fi
  git commit -am "$1" --no-verify
}

gcd() {
  git checkout develop
}

gcsu() {
  git checkout Supplements
}

gcl() {
  git checkout -
}

gcf() {
  git clean -fd
}

gcnb() {
  if [ -z "$1" ]; then
      echo -e "\nBranch name missing\n"
      return 1
  fi
  git checkout -b $1
  git push -u origin $1 --no-verify
}

gcp() {
  if [ -z "$1" ]; then
      echo -e "\nCommit # missing\n"
      return 1
  fi
  git cherry-pick $1 --no-commit
}

glg() {
  git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cd)%Creset %C(green)%ce%Creset %s"
}

glgx() {
  git log --graph --pretty=format:"%h%x09%d%x09(%cd)%x09%ce%x09%s" > GitLog.xls
}

gpl() {
  git pull
}

gpu() {
  git push --no-verify
}

gpuf() {
  git push --force --no-verify
}

gra() {
  git rebase --abort
}

grd() {
  git rebase develop
}

grdo() {
  git rebase develop -X ours
}

grh() {
  git reset --hard
}

grhd() {
  git reset HEAD~
}

grho() {
  currentBranch = git rev-parse --symbolic-full-name --abbrev-ref HEAD
  git reset --hard origin/$currentBranch
}

gs() {
  git status
}

gsq() {
  if [ -z "$1" ]; then
      echo -e "\nCommit # missing\n"
      return 1
  fi
  git rebase -i HEAD~$1
}
