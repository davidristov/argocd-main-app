#!/bin/bash

git config --global user.email "github-argocd-bot@example.com"
git config --global user.name "argocd-bot"

git clone https://$PAT@github.com/davidristov/argocd-config.git
cd argocd-config 
export tag=`cat values.yaml | head -n 4 | tail -n 1 | awk '{ print $2}'`
sed -i "s/$tag/$GITHUB_SHA/g" values.yaml

git add values.yaml
git commit -m "bump image version"
git push origin main