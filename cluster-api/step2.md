## Automated Canary Releases

RUN `kubectl apply -k github.com/fluxcd/flagger/kustomize/linkerd`{{exec}}   

RUN `kubectl -n linkerd rollout status deploy/flagger`{{exec}}   

RUN `kubectl create ns test && kubectl apply -f https://run.linkerd.io/flagger.yml`{{exec}}   

RUN `kubectl -n test rollout status deploy podinfo`{{exec}}   

RUN `kubectl -n test port-forward svc/frontend 8080`{{exec}}   

