## Install k3s


RUN `curl -sfL https://get.k3s.io | sh -s - --disable=traefik`{{exec}}

RUN `export KUBECONFIG=/etc/rancher/k3s/k3s.yaml`{{exec}}       

RUN `k3s check-config`{{exec}}      

RUN `kubectl get po -A`{{exec}}

