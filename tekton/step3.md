
`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`{{execute}}      

`helm install prometheus prometheus-community/prometheus -n default --set alertmanager.enabled=false,pushgateway.enabled=false,server.global.scrape_interval=10s,alertmanager.persistentVolume.enabled=false,server.persistentVolume.enabled=false,pushgateway.persistentVolume.enabled=false`{{execute}}     

`kubectl port-forward --address 0.0.0.0 svc/prometheus-server 9999:80 > /dev/null 2>&1 &`{{execute}}

URL:[Access prometheus]({{TRAFFIC_HOST1_9999}})  


`helm repo list && helm repo update`{{execute}}    

`kubectl create ns monitor`{{execute}}    

`helm install prometheus-stack prometheus-community/kube-prometheus-stack -n monitor`{{execute}}     

`kubectl port-forward -n monitor --address 0.0.0.0  svc/prometheus-stack-kube-prom-prometheus  9090:9090 > /dev/null 2>&1 &`{{execute}}

URL:[Access prometheus]({{TRAFFIC_HOST1_9090}})

`kubectl port-forward -n monitor --address 0.0.0.0  svc/prometheus-stack-grafana  80:80 > /dev/null 2>&1 &`{{execute}}

URL:[Access prometheus]({{TRAFFIC_HOST1_80}})


