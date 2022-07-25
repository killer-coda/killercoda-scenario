
`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`{{execute}}      

`helm install prometheus prometheus-community/prometheus -n default --set alertmanager.enabled=false,pushgateway.enabled=false,server.global.scrape_interval=10s,alertmanager.persistentVolume.enabled=false,server.persistentVolume.enabled=false,pushgateway.persistentVolume.enabled=false`{{execute}}     

`kubectl port-forward --address 0.0.0.0 svc/prometheus-server 9999:80 > /dev/null 2>&1 &`{{execute}}

URL:[Access prometheus]({{TRAFFIC_HOST1_9999}})  

