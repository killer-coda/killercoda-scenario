###
apt install net-tools  jq -y

pip install requests pandas matplotlib  --break-system-packages

## curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh && sudo -E bash nodesource_setup.sh
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash - 
sudo apt-get install -y nodejs

###
pip uninstall docker-compose
## sudo rm -rf /usr/local/bin/docker-compose

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker info --format '{{json .ClientInfo.Plugins}}' | grep compose
docker compose version

############## 
sudo rm -rf /usr/local/go

# 2. 清理可能的软链接（若有）
sudo rm -rf /usr/bin/go /usr/bin/gofmt

# 3. 清理 GOPATH 缓存（可选，保留项目代码仅清理缓存）
rm -rf $HOME/go/pkg/mod

# 下载 Go 1.24.7 amd64 版本（适配 Ubuntu 24.04）
wget https://dl.google.com/go/go1.24.7.linux-amd64.tar.gz

# 解压到系统标准目录（/usr/local/go）
sudo tar -C /usr/local -xzf go1.24.7.linux-amd64.tar.gz

# 写入环境变量（覆盖旧配置，确保无冲突）
cat << EOF >> ~/.bashrc
# Go 环境配置
export PATH=\$PATH:/usr/local/go/bin
export GOPATH=\$HOME/go
export GO111MODULE=on
export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct  # 国内镜像源，加速依赖下载
EOF

# 生效环境变量
source ~/.bashrc

# 查看 Go 版本（应输出 1.24.7）
go version

# 检查 Go 环境配置
go env | grep -E "GOPATH|GOROOT|GO111MODULE"

###################
