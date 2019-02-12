#go to home and setup git
cd $HOME
git config --global user.email $USER_EMAIL
git config --global user.name $USER_NAME

#clone the repository in the buildApk folder
git clone --quiet --branch=test-branch-1  https://$USER_NAME:$GITHUB_API_KEY@github.com/$USER_NAME/nebula-cmd  master > /dev/null

cd test-branch-1
pyinstaller -F nebulactl.py

#add, commit and push files
git add -f .
git remote rm origin
git remote add origin https://$USER_NAME:$GITHUB_API_KEY@github.com/$USER_NAME/nebula-cmd.git
git add -f .
git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed - nebulactl.py run and pushed"
git push --quiet --set-upstream origin test-branch-1
echo -e "Done"
