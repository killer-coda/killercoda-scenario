
1.Install Tekton     
`kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml`{{execute}}    

`kubectl api-resources --api-group=tekton.dev`{{execute}}     
  
`kubectl get po -n tekton-pipelines`{{execute}}      

2.Install Tekton CLI    
`curl -sLO https://github.com/tektoncd/cli/releases/download/v0.24.0/tkn_0.24.0_Linux_x86_64.tar.gz && tar xvzf tkn_0.24.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn`{{execute}}     

`tkn version`{{execute}}    

`kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.4/git-clone.yaml`{{execute}}      

`tkn hub install task git-clone`{{execute}}     

3.Install Tekton Dashboard     
`kubectl apply -f https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml`{{execute}}     

`kubectl get pods --namespace tekton-pipelines`{{execute}}    

`kubectl get svc tekton-dashboard -n tekton-pipelines`{{execute}}    

`kubectl port-forward -n tekton-pipelines --address=0.0.0.0 service/tekton-dashboard 80:9097 > /dev/null 2>&1 &`{{execute}}     

>Warning: `--address='0.0.0.0'` is just to adapt to the [killercoda.com](https://github.com/killercoda/scenario-examples/blob/main/network-traffic-kubernetes/step1.md) platform and is not a requirement!

URL:[Access Tekton]({{TRAFFIC_HOST1_80}})     

4.Install Tekton Chains    
`kubectl apply -f https://storage.googleapis.com/tekton-releases/chains/latest/release.yaml`{{execute}}       

>Warning:  [network-traffic](https://github.com/killercoda/scenario-examples/blob/main/network-traffic/step1.md)  
`docker run -d -p 80:80 nginx:alpine`{{execute}}     
[ACCESS NGINX]({{TRAFFIC_HOST1_80}})    
[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
