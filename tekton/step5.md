`git clone https://github.com/ContainerSolutions/loki-grafana-promtail-k8s && cd loki-grafana-promtail-k8s`{{execute}}      

`helm install loki monitoring-stack --set global.env.local=true`{{execute}}        

` kubecolor get po -n monitoring`{{execute}}        

` kubecolor get svc -n monitoring`{{execute}}    

`kubectl port-forward -n monitoring --address 0.0.0.0 svc/grafana 3000:3000 > /dev/null 2>&1 &`{{execute}}    

URL:[Access prometheus]({{TRAFFIC_HOST1_3000}})
