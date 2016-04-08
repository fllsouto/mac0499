#!/bin/bash
cd $(dirname "${BASH_SOURCE}")
pwd
ls
tar -czf package.tar.gz _site
ls
export SSHPASS=$REDELINUXPASS
sshpass -e scp -v package.tar.gz fsouto@linux.ime.usp.br:/home/bcc/fsouto/tcc-test-foo
sshpass -e ssh -v fsouto@linux.ime.usp.br sh /home/bcc/fsouto/tcc-test-foo/deploy.sh