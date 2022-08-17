## vcluster

RUN `curl -s -L "https://github.com/loft-sh/vcluster/releases/latest" | sed -nE 's!.*"([^"]*vcluster-linux-amd64)".*!https://github.com\1!p' | xargs -n 1 curl -L -o vcluster && chmod +x vcluster`{{exec}}   

RUN `mv vcluster /usr/local/bin && vcluster version`{{exec}}

RUN `kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.22/deploy/local-path-storage.yaml`{{exec}}   

RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   

RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
