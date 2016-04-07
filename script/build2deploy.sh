#!/bin/bash
cd $(dirname "${BASH_SOURCE}")
pwd
ls
tar -czf package.tar.gz _site
ls
export SSHPASS=$REDELINUXPASS
sshpass -e scp -v package.tar.gz $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
sshpass -e ssh -v $DEPLOY_USER@$DEPLOY_HOST sh $DEPLOY_PATH/deploy.sh