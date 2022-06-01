### Install kubecolor CLI

RUN ```wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz && \
tar zvxf kubecolor_0.0.20_Linux_x86_64.tar.gz && \
cp kubecolor /usr/local/bin/```{{exec}}

RUN `kubecolor version`{{exec}}    

RUN `kubecolor version`{{exec}}    

### Clone repo 

RUN `git clone https://github.com/hbstarjason2021/spinnaker-install && cd spinnaker-install`{{exec}}

### Install Halyard

RUN `bash install-hal.sh`{{exec}}    

### Install Minio    

RUN `bash install-minio.sh`{{exec}}      

### Setting up the provider    

RUN `bash setup-kubernetes-provider.sh`{{exec}}    

### Deploy Spinnaker   

RUN `hal deploy apply`{{exec}}     

RUN `kubecolor -n spinnaker get po`{{exec}}






