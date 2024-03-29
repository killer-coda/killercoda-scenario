 apt install net-tools -y

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
mkdir -p /usr/local/bin/ &&  sudo install minikube /usr/local/bin/

# install helm 
curl -s https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# install kubectl
curl https://raw.githubusercontent.com/hbstarjason2021/ngrok-k8s/main/install-kubectl.sh | bash

# install kubecolor
wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz
tar zvxf kubecolor_0.0.20_Linux_x86_64.tar.gz && cp kubecolor /usr/local/bin/ && kubecolor version

## install minikube
## minikube start --extra-config=kubeadm.ignore-preflight-errors=NumCPU --cni=cilium --kubernetes-version=v1.23.3 --force --cpus=1
minikube start --extra-config=kubeadm.ignore-preflight-errors=NumCPU --network-plugin=cni --cni=false --force --cpus=1

## install cilium
curl -L --remote-name-all \
https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-amd64.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin
rm cilium-linux-amd64.tar.gz{,.sha256sum}
