#!/bin/bash -xe

# Ths script is a template for copying project's files directly and restaring only nodejs

TARGET_ROOT_DIR="/home/ubuntu/nodejs/"

# target file names and dirs
COPY_TARGET_FILES=(
    "index.ts"
    "package.json"
)

TARGET_HOST_USER=root

# target hosts name
TARGET_HOSTS=(
    "ec2-3-114-216-227.ap-northeast-1.compute.amazonaws.com"
    # "ec2-3-114-227-172.ap-northeast-1.compute.amazonaws.com"
    # "ec2-3-114-116-138.ap-northeast-1.compute.amazonaws.com"
)

cat << EOF > /tmp/restart-express-$$.sh
#!/bin/bash -xe
cd $TARGET_ROOT_DIR
npm install
systemctl stop nodejs
systemctl start nodejs
EOF

for TARGET_HOST in "${TARGET_HOSTS[@]}"
do
    scp -r ${COPY_TARGET_FILES[@]} $TARGET_HOST_USER@$TARGET_HOST:$TARGET_ROOT_DIR
    scp /tmp/restart-express-$$.sh $TARGET_HOST_USER@$TARGET_HOST:/tmp/restart-express.sh
    ssh -A $TARGET_HOST_USER@$TARGET_HOST /bin/bash /tmp/restart-express.sh
done