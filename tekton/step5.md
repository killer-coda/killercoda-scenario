`git clone https://github.com/ContainerSolutions/loki-grafana-promtail-k8s && cd loki-grafana-promtail-k8s`{{execute}}      

`helm install loki monitoring-stack --set global.env.local=true`{{execute}}        

` kubecolor get po -n monitoring`{{execute}}        

` kubecolor get svc -n monitoring`{{execute}}    
