### 1.Setup Environment 
>Warning:  URL：[horizontal-pod-autoscale-walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough)

RUN `cat php-apache.yaml`{{exec}}  

RUN `kubectl apply -f https://k8s.io/examples/application/php-apache.yaml`{{exec}}



RUN `kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10`{{exec}}  
RUN `kubectl get hpa`{{exec}}  

>Warning:  URL：[horizontal-pod-autoscale](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale)



### 2.Run Code



RUN `python `{{exec}}      




>Warning:  [network-traffic](https://github.com/killercoda/scenario-examples/blob/main/network-traffic/step1.md)     
`docker run -d -p 80:80 nginx:alpine`{{execute}}       
[ACCESS NGINX]({{TRAFFIC_HOST1_80}})    
[ACCESS PORTS]({{TRAFFIC_SELECTOR}})


RUN `sudo add-apt-repository ppa:fujiapple/trippy && sudo apt update && sudo apt install trippy`{{exec}} 

RUN `trip bing.com`{{exec}} 








