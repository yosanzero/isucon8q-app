#!/bin/bash -xe
if [ -z "$1" ]; then
  BRANCH="master"
else
  BRANCH="$1"
fi

scp restart-1.sh root@ec2-3-114-216-227.ap-northeast-1.compute.amazonaws.com:restart.sh
ssh -A root@ec2-3-114-216-227.ap-northeast-1.compute.amazonaws.com /bin/bash restart.sh $BRANCH

scp restart-2_3.sh root@ec2-3-114-227-172.ap-northeast-1.compute.amazonaws.com:restart.sh
ssh -A root@ec2-3-114-227-172.ap-northeast-1.compute.amazonaws.com /bin/bash restart.sh $BRANCH

scp restart-2_3.sh root@ec2-3-114-116-138.ap-northeast-1.compute.amazonaws.com:restart.sh
ssh -A root@ec2-3-114-116-138.ap-northeast-1.compute.amazonaws.com /bin/bash restart.sh $BRANCH
