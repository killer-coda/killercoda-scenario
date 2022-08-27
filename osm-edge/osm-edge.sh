### osm-edge

### https://osm-edge-docs.flomesh.io/zh/docs/quickstart/

### https://github.com/flomesh-io/flomesh-workshop/blob/main/flomesh/101-quickstart.md

system=$(uname -s | tr [:upper:] [:lower:])
arch=$(dpkg --print-architecture)
release=v1.1.1
curl -L https://github.com/flomesh-io/osm-edge/releases/download/${release}/osm-edge-${release}-${system}-${arch}.tar.gz | tar -vxzf -
./${system}-${arch}/osm version
cp ./${system}-${arch}/osm /usr/local/bin/

export osm_namespace=osm-system 
export osm_mesh_name=osm 

osm install \
    --mesh-name "$osm_mesh_name" \
    --osm-namespace "$osm_namespace" \
    --set=osm.enablePermissiveTrafficPolicy=true \
    --set=osm.deployPrometheus=true \
    --set=osm.deployGrafana=true \
    --set=osm.deployJaeger=true \
    --set=osm.tracing.enable=true \
    --set=fsm.enabled=true
    
 
 kubectl get po -n osm-system
 
 
#### curl -sfL https://getk8e.com/install.sh | K8E_TOKEN=k8e-mesh INSTALL_K8E_EXEC="server --cluster-init --write-kubeconfig-mode 644 --write-kubeconfig ~/.kube/config" sh -


kubectl apply -f  https://raw.githubusercontent.com/killer-coda/killercoda-scenario/main/osm-edge/namespace.yml

kubectl apply -f  https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.22/deploy/local-path-storage.yaml
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'


export K8S_NAMESPACE=osm-system
export BOOKBUYER_NAMESPACE=bookbuyer
export BOOKTHIEF_NAMESPACE=bookthief
export BOOKSTORE_NAMESPACE=bookstore
export BOOKWAREHOUSE_NAMESPACE=bookwarehouse

kubectl port-forward -n tekton-pipelines --address=0.0.0.0 service/tekton-dashboard 80:9097 > /dev/null 2>&1

BOOKBUYER_LOCAL_PORT="${BOOKBUYER_LOCAL_PORT:-8080}"
POD="$(kubectl get pods --selector app=bookbuyer -n "$BOOKBUYER_NAMESPACE" --no-headers  | grep 'Running' | awk 'NR==1{print $1}')"

kubectl port-forward "$POD" -n "$BOOKBUYER_NAMESPACE" "$BOOKBUYER_LOCAL_PORT":14001 --address 0.0.0.0 > /dev/null 2>&1


BOOKTHIEF_LOCAL_PORT="${BOOKTHIEF_LOCAL_PORT:-8083}"
POD="$(kubectl get pods --selector app=bookthief -n "$BOOKTHIEF_NAMESPACE" --no-headers | grep 'Running' | awk 'NR==1{print $1}')"

kubectl port-forward "$POD" -n "$BOOKTHIEF_NAMESPACE" "$BOOKTHIEF_LOCAL_PORT":14001 --address 0.0.0.0 > /dev/null 2>&1


BOOKSTORE_LOCAL_PORT="${BOOKSTORE_LOCAL_PORT:-8084}"
POD="$(kubectl get pods --selector app="$backend" -n "$BOOKSTORE_NAMESPACE" --no-headers | grep 'Running' | awk 'NR==1{print $1}')"

kubectl port-forward "$POD" -n "$BOOKSTORE_NAMESPACE" "$BOOKSTORE_LOCAL_PORT":14001 --address 0.0.0.0
