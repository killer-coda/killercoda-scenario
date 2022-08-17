cat > vcluster.yaml <<EOF
vcluster:
  image: rancher/k3s:v1.23.5-k3s1    
storage:
  persistence: true
  size: 5Gi
  className: local-path
EOF

VCLUSTER_NAME="zhang-vcluster"

kubectl create ns ${VCLUSTER_NAME}  
helm upgrade --install ${VCLUSTER_NAME} vcluster \
  --values vcluster.yaml \
  --repo https://charts.loft.sh \
  --namespace ${VCLUSTER_NAME} \
  --repository-config=''
 

vcluster connect ${VCLUSTER_NAME} -n ${VCLUSTER_NAME} -- kubectl get ns
vcluster connect ${VCLUSTER_NAME} -n ${VCLUSTER_NAME} -- kubectl get pod -A
vcluster connect ${VCLUSTER_NAME} -n ${VCLUSTER_NAME} -- kubectl get svc -A


vcluster connect ${VCLUSTER_NAME} -n ${VCLUSTER_NAME} -- kubectl create deployment nginx-${VCLUSTER_NAME} --image=nginx:alpine
vcluster connect ${VCLUSTER_NAME} -n ${VCLUSTER_NAME} -- kubectl create service nodeport nginx-${VCLUSTER_NAME} --tcp=80:80


kubectl config get-contexts

kubectl config current-context
kubectl config kubernetes-admin@kubernetes
kubectl config use-context vcluster_zhang-vcluster_zhang-vcluster_kubernetes-admin@kubernetes 


### vcluster delete ${VCLUSTER_NAME}
