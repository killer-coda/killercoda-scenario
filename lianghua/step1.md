### 1.Setup Environment 

RUN `git clone https://github.com/hbstarjason2021/yangmao/ && cd yangmao/lianghua`{{exec}}

RUN `pip install -r requirements.txt  --break-system-packages`{{exec}}    

RUN  `curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh && sudo -E bash nodesource_setup.sh`{{exec}} 

RUN  `sudo apt-get install -y nodejs`{{exec}} 

RUN  `node -v`{{exec}} 

### 2.Run Code

>Warning:  sed -i  's/email/user/'  user_info.txt && sed -i  's/secret/pass/'  user_info.txt

RUN `python digging_1step.py`{{exec}}      

RUN `python check.py`{{exec}}  

RUN `python digging_2step.py`{{exec}} 


>Warning:  [network-traffic](https://github.com/killercoda/scenario-examples/blob/main/network-traffic/step1.md)     
`docker run -d -p 80:80 nginx:alpine`{{execute}}       
[ACCESS NGINX]({{TRAFFIC_HOST1_80}})    
[ACCESS PORTS]({{TRAFFIC_SELECTOR}})








