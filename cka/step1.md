### 1.Setup Environment 
RUN `cat php-apache.yaml`{{exec}}  

RUN `kubectl apply -f https://k8s.io/examples/application/php-apache.yaml`{{exec}}



### 2.Run Code

>Warning:  URL：https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

RUN `python `{{exec}}      




>Warning:  [network-traffic](https://github.com/killercoda/scenario-examples/blob/main/network-traffic/step1.md)     
`docker run -d -p 80:80 nginx:alpine`{{execute}}       
[ACCESS NGINX]({{TRAFFIC_HOST1_80}})    
[ACCESS PORTS]({{TRAFFIC_SELECTOR}})


RUN `sudo add-apt-repository ppa:fujiapple/trippy && sudo apt update && sudo apt install trippy`{{exec}} 

RUN `trip bing.com`{{exec}} 








