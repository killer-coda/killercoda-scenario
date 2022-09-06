## Install k3s

RUN `ls -l /etc/cni/net.d/`{{exec}}

RUN `export INSTALL_K3S_VERSION=v1.23.8+k3s1; curl -sfL https://get.k3s.io | sh -s - --flannel-backend=none --disable-network-policy --cluster-cidr=10.16.0.0/16  --service-cidr=10.96.0.0/12 --disable=traefik --write-kubeconfig-mode 644 --write-kubeconfig ~/.kube/config`{{exec}}

RUN `export KUBECONFIG=/etc/rancher/k3s/k3s.yaml`{{exec}}       

RUN `mkdir -p $HOME/.kube`{{exec}}   

RUN `cp /etc/rancher/k3s/k3s.yaml ~/.kube/config`{{exec}}   

RUN `kubecolor get po -A`{{exec}}   

RUN `kubecolor get node`{{exec}}   

RUN `kubecolor describe node ubuntu`{{exec}} 

## Install kube-ovn    

RUN `wget https://raw.githubusercontent.com/kubeovn/kube-ovn/release-1.10/dist/images/install.sh`{{exec}}    


URL:[Access kube-explorer]({{TRAFFIC_HOST1_9898}})    

Other:[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
