#!/bin/bash

# 設置 GitHub 儲存庫和訪問令牌
GITHUB_REPO="https://github.com/iArthurTsai/WAN_IP.git"
GITHUB_TOKEN="Your GITHUB TOKEN"

# 查詢 WAN IP
WAN_IP=$(curl -s ifconfig.me)

# 設置目錄為 /home/arthur/github 並克隆儲存庫
TEMP_DIR="/home/arthur/github"
mkdir -p $TEMP_DIR
cd $TEMP_DIR

# 設置 Git 用戶名和電子郵件
git config user.name "iArthurTsai"
git config user.email "xxx@gmail.com"

if [ ! -d "$TEMP_DIR/.git" ]; then
    git clone https://$GITHUB_TOKEN@github.com/iArthurTsai/WAN_IP.git .
else
    git pull
fi

# 切換到儲存庫目錄
cd $TEMP_DIR

# 將 WAN IP 寫入文件
echo $WAN_IP > wan_ip.txt

# 添加、提交和推送更改
git add wan_ip.txt
git commit -m "Update WAN IP to $WAN_IP"
git push
