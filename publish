#!/bin/sh
git checkout master
jekyll --no-auto
cp -R _site /tmp
git checkout gh-pages
cp -R /tmp/_site/* .
git add -A
git commit -a
git push
