# ----------- GIT SCRIPTS -------------

# checkout
function gco {
  git checkout $1
  git pull
}

# checkout remote branch
function gcoremote {
if [[ $1 = "" ]]; then
    echo -n "remote   branch: "
    read repo_ans
  git checkout -b $1 remotes/origin/$1
else
  git checkout -b $1 remotes/origin/$1
fi
}

# add -i (interactive mode)
function gai {
  if [[ $1 = "" ]]; then
    echo "must checkout branch first, execute with args (ex. '$ gai master')."
  else
    git checkout $1
    git pull
    git add -i
  fi
}

# commit
function gcm {
  gco master
  git commit -m \"$1\"
}

# git pull
function gpull {
  gco master
  git pull
}

# push master to branch
function gpsh {
  gco master
  git push
  if [[ $1 = "" ]]; then
    echo -n "Branch to merge: "
    read branch_ans
    git checkout $branch_ans
  else
    git checkout $1
  fi
  git pull
  git merge master
  git push
  echo "switching back to master"
  git checkout master
}

# deploy using capistrano
function deploy_to_server {
  if [[ $1 = "" ]]; then
    git branch -a
    echo -n "Select branch: "
    read branch_ans
    cap $branch_ans deploy

  else
    cap $1 deploy
  fi
}

# view repositories
function gvw_repo {
  if [[ $1 = "" ]]; then
    echo -n "Server: "
    read server_ans
    ssh git@$server_ans
  else
    ssh git@$1
  fi
}

# clone repository
function gcl_repo {
  if [[ $1 = "" ]]; then
    echo -n "Server: "
    read server_ans
    echo -n "Repo name:"
    read repo_ans
    git clone git@$server_ans:$repo_ans
  else
    git clone git@$1:$2
  fi
}

