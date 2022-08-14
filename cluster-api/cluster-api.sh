### https://cluster-api.sigs.k8s.io/user/quick-start.html

export CLUSTER_TOPOLOGY=true
clusterctl init --infrastructure docker


# The list of service CIDR, default ["10.128.0.0/12"]
export SERVICE_CIDR=["10.96.0.0/12"]

# The list of pod CIDR, default ["192.168.0.0/16"]
export POD_CIDR=["192.168.0.0/16"]

# The service domain, default "cluster.local"
#export SERVICE_DOMAIN="k8s.test"


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

kubectl --kubeconfig=./capi-quickstart.kubeconfig \
  apply -f https://docs.projectcalico.org/v3.21/manifests/calico.yaml

kubectl --kubeconfig=./capi-quickstart.kubeconfig get nodes
