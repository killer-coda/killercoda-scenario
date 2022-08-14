## cluster-api


RUN `clusterctl version`{{exec}}

RUN `export CLUSTER_TOPOLOGY=true && clusterctl init --infrastructure docker`{{exec}}   

RUN ```bash
export SERVICE_CIDR=["10.96.0.0/12"]
export POD_CIDR=["192.168.0.0/16"]
clusterctl generate cluster capi-quickstart --flavor development \
  --kubernetes-version v1.24.0 \
  --control-plane-machine-count=1 \
  --worker-machine-count=1 \
  > capi-quickstart.yaml
  
kubectl apply -f capi-quickstart.yaml

kubectl get cluster```{{exec}}   

RUN `clusterctl describe cluster capi-quickstart `{{exec}}   

RUN `kubectl get kubeadmcontrolplane`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
