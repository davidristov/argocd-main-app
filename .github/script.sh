#!/bin/bash

git config --global user.email "github-argocd-bot@example.com"
git config --global user.name "argocd-bot"

git clone https://$PAT@github.com/davidristov/argocd-config.git
cd argocd-config 
yq eval ".global.image.tag = \"$GITHUB_SHA\"" -i values.yaml

git add values.yaml
git commit -m "bump image version"
git push origin main