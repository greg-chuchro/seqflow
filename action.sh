git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch
set +e
GIT_USER_NAME=$(git config --global user.name)
GIT_USER_EMAIL=$(git config --global user.email)
set -e
git config --global user.name "seqflow-action"
git config --global user.email ""
MINOR_BRANCHES=($(git branch --remotes --list origin/v[0-9]*))
for BRANCH_FULL_NAME in "${MINOR_BRANCHES[@]}"; do
    BRANCH_NAME=${BRANCH_FULL_NAME#"origin/"}
    git switch --orphan $BRANCH_NAME
    git pull --depth=1 origin $BRANCH_NAME
    eval "$SEQFLOW_CALLBACK"
done
git switch main
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
