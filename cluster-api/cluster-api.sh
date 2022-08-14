### https://cluster-api.sigs.k8s.io/user/quick-start.html

export CLUSTER_TOPOLOGY=true
clusterctl init --infrastructure docker

export SERVICE_CIDR=["10.96.0.0/12"]
export POD_CIDR=["192.168.0.0/16"]
export SERVICE_DOMAIN="k8s.test"

clusterctl generate cluster capi-quickstart --flavor development \
  --kubernetes-version v1.24.0 \
  --control-plane-machine-count=1 \
  --worker-machine-count=1 \
  > capi-quickstart.yaml

kubectl apply -f capi-quickstart.yaml

kubectl get cluster
clusterctl describe cluster capi-quickstart

kubectl get kubeadmcontrolplane
clusterctl get kubeconfig capi-quickstart > capi-quickstart.kubeconfig


