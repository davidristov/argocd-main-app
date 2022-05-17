#!/bin/bash

git config --global user.email "github-argocd-bot@example.com"
git config --global user.name "argocd-bot"

git clone https://$PAT@github.com/davidristov/argocd-config.git
cd argocd-config
tag=`git rev-parse origin/main`  
yq eval ".global.image.tag = \"$tag\"" -i values-staging.yaml

git add values.yaml
git commit -m "bump staging image version"
git push origin main 