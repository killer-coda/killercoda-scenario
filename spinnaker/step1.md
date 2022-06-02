### 1.Install kubecolor CLI

RUN `wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz && tar zvxf kubecolor_0.0.20_Linux_x86_64.tar.gz && cp kubecolor /usr/local/bin/`{{exec}}

RUN `kubecolor version`{{exec}}    

RUN `kubecolor version`{{exec}}    

### 2.Clone repo 

RUN `git clone https://github.com/hbstarjason2021/spinnaker-install && cd spinnaker-install`{{exec}}

### 3.Install Halyard

RUN `apt-get update -y`{{exec}}

RUN `bash install-hal.sh`{{exec}}    

### 4.Install Minio    

RUN `bash install-minio.sh`{{exec}}      

### 5.Setting up the provider    

RUN `bash setup-kubernetes-provider.sh`{{exec}}    

### 6.Deploy Spinnaker   

RUN `hal deploy apply`{{exec}}     

RUN `kubecolor -n spinnaker get po`{{exec}}






