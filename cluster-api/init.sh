 apt install net-tools -y


# install helm 
curl -s https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# install kubectl
curl https://raw.githubusercontent.com/hbstarjason2021/ngrok-k8s/main/install-kubectl.sh | bash

# install kubecolor
wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz
tar zvxf kubecolor_0.0.20_Linux_x86_64.tar.gz && cp kubecolor /usr/local/bin/ && kubecolor version

# install clusterctl
curl -Lo /usr/local/bin/clusterctl https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.2.0/clusterctl-linux-amd64 
chmod +x /usr/local/bin/clusterctl
