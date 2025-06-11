### 1.Setup Environment 

RUN `git clone https://github.com/hbstarjason2021/yangmao/ && cd yangmao/lianghua`{{exec}}

RUN `pip install -r requirements.txt  --break-system-packages`{{exec}}      

### 2.Run Code

>Warning:  sed -i  's/email/user/'  user_info.txt && sed -i  's/secret/pass/'  user_info.txt

RUN `python digging_1step.py`{{exec}}      

RUN `python check.py`{{exec}}  

RUN `python digging_2step.py`{{exec}} 










