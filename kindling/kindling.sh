### https://prometheus-operator.dev/docs/prologue/quick-start/  
### https://artifacthub.io/packages/helm/mesosphere/prometheus-operator  

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack

## admin/prom-operator

## http://prometheus-kube-prometheus-prometheus.default:9090/

## kubectl port-forward -n default --address=0.0.0.0 service/prometheus-grafana 80:80 > /dev/null 2>&1 &


###### kubectl set image deploy/nginx nginx=nginx:latest -n default


#### http://www.kindling.space:33215/project-1/
#### http://www.kindling.space:33215/project-3/doc-37/

git clone https://github.com/CloudDectective-Harmonycloud/kindling
cd kindling/deploy/agent/
bash install.sh

kubectl set image ds/kindling-agent kindling-agent=hbstarjason/kindling-agent:bymyself -n kindling


kubectl create -f https://k8s-bpf-probes-public.oss-cn-hangzhou.aliyuncs.com/kindling-grafana.yaml -n kindling

kubectl patch svc grafana  -n kindling --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]'

kubectl port-forward -n kindling --address=0.0.0.0 service/grafana 3000:3000 > /dev/null 2>&1 &
