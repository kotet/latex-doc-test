#!/bin/bash -e

mkdir -p deploy
cd deploy
mv ../.git .

git config --global user.name "Circle CI"
git config --global user.email "<>"
git checkout gh-pages
git pull
mv ../doc.pdf .
git add -A
git commit --allow-empty -m "[ci skip] Deploy by CI"

mkdir -p ~/.ssh/ && echo -e "Host github.com\n\tStrictHostKeyChecking no\n" > ~/.ssh/config
git push -f origin gh-pages
cd -