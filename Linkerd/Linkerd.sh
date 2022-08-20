### Linkerd

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
  
  
