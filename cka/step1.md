### 1.Setup Environment 
>Reference:  URL：[horizontal-pod-autoscale-walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough)

RUN `cat php-apache.yaml`{{exec}}  

RUN `kubectl apply -f https://k8s.io/examples/application/php-apache.yaml`{{exec}}

RUN `kubectl get pod -A`{{exec}} 


### 2.Create RHorizontalPodAutoscaler

RUN `kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10`{{exec}}  
RUN `kubectl get hpa`{{exec}}  

>Reference:  URL：[horizontal-pod-autoscale](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale)


### 3.Change downscale stabilization window 

```
behavior:
  scaleDown:
    stabilizationWindowSeconds: 60
```


### 4.


RUN `python `{{exec}}      




>Reference:  [network-traffic](https://github.com/killercoda/scenario-examples/blob/main/network-traffic/step1.md)     
`docker run -d -p 80:80 nginx:alpine`{{execute}}       
[ACCESS NGINX]({{TRAFFIC_HOST1_80}})    
[ACCESS PORTS]({{TRAFFIC_SELECTOR}})


RUN `sudo add-apt-repository ppa:fujiapple/trippy && sudo apt update && sudo apt install trippy -y `{{exec}} 

RUN `trip bing.com`{{exec}} 








