## Install k3s


RUN `curl -sfL https://get.k3s.io | sh -s - --disable=traefik`{{exec}}

RUN `export KUBECONFIG=/etc/rancher/k3s/k3s.yaml`{{exec}}       

RUN `k3s check-config`{{exec}}     

RUN `mkdir -p $HOME/.kube`{{exec}}   

RUN `cp /etc/rancher/k3s/k3s.yaml ~/.kube/config`{{exec}}   

RUN `wget https://github.com/cnrancher/kube-explorer/releases/download/v0.2.11/kube-explorer-linux-amd64 && chmod +x kube-explorer-linux-amd64`{{exec}}   

RUN `nohup ./kube-explorer-linux-amd64 --http-listen-port=9898 --https-listen-port=0 &`{{exec}}

RUN `kubectl get po -A`{{exec}}


[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
