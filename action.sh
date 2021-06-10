git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch
set +e
GIT_USER_NAME=$(git config --global user.name)
GIT_USER_EMAIL=$(git config --global user.email)
set -e
git config --global user.name "seqflow-action"
git config --global user.email ""
MINOR_BRANCHES=("origin/main" $(git branch --remotes --list origin/v[0-9]*))
for BRANCH_FULL_NAME in "${MINOR_BRANCHES[@]}"; do
    BRANCH_NAME=${BRANCH_FULL_NAME#"origin/"}
    eval "$CALLBACK"
done
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
