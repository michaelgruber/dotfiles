#!/bin/bash
git init

if [ -e .gitignore ]
then
    mv .gitignore ._gitignore
    touch .gitignore
    git add .gitignore
    mv ._gitignore .gitignore
else
    touch .gitignore
    git add .gitignore
fi

git commit -m 'initial commit'
git checkout -b develop
