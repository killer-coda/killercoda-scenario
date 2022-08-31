### Linkerd

## https://linkerd.io/2.11/getting-started/#step-4-install-the-demo-app

helm repo add linkerd https://helm.linkerd.io/stable

exp=$(date -d '+8760 hour' +"%Y-%m-%dT%H:%M:%SZ")
  

helm fetch --untar linkerd/linkerd2

helm install linkerd2 \
  --set-file identityTrustAnchorsPEM=ca.crt \
  --set-file identity.issuer.tls.crtPEM=issuer.crt \
  --set-file identity.issuer.tls.keyPEM=issuer.key \
  --set identity.issuer.crtExpiry=$exp \
  -f linkerd2/values-ha.yaml \
  linkerd/linkerd2
  
 
 #### https://linkerd.io/2.11/tasks/canary-release/
 
cat <<EOF | kubectl apply -f -
apiVersion: flagger.app/v1beta1
kind: Canary
metadata:
  name: podinfo
  namespace: test
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: podinfo
  service:
    port: 9898
  analysis:
    interval: 10s
    threshold: 5
    stepWeight: 10
    maxWeight: 100
    metrics:
    - name: request-success-rate
      thresholdRange:
        min: 99
      interval: 1m
    - name: request-duration
      thresholdRange:
        max: 500
      interval: 1m
EOF

kubectl -n test get ev --watch

