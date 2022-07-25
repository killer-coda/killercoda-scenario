>Warning: https://operatorhub.io/operator/tektoncd-operator

`curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.21.2/install.sh | bash -s v0.21.2`{{execute}}    

`kubectl create -f https://operatorhub.io/install/tektoncd-operator.yaml`{{execute}}    

`kubectl get csv -n operators`{{execute}}      


>Warning: https://github.com/tektoncd/operator/releases     

`kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/previous/v0.60.0/release.yaml`{{execute}}      


 

