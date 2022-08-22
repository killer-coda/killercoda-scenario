## Automated Canary Releases

RUN `kubectl apply -k github.com/fluxcd/flagger/kustomize/linkerd`{{exec}}   

RUN `kubectl -n linkerd rollout status deploy/flagger`{{exec}}   

