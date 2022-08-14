cat > vcluster.yaml <<EOF
vcluster:
  image: rancher/k3s:v1.23.5-k3s1    
storage:
  persistence: true
  size: 5Gi
  className: local-path
EOF

kubectl create ns zhang-vcluster  
helm upgrade --install zhang-vcluster vcluster \
  --values vcluster.yaml \
  --repo https://charts.loft.sh \
  --namespace zhang-vcluster \
  --repository-config=''
 

vcluster connect zhang-vcluster -n zhang-vcluster -- kubectl get ns
vcluster connect zhang-vcluster -n zhang-vcluster -- kubectl get pod -A
vcluster connect zhang-vcluster -n zhang-vcluster -- kubectl get svc -A

