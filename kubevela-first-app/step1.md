### 1.Install KubeVela CLI

This is quite easy. Depends on your system, run one of scripts below.

RUN `curl -fsSl https://kubevela.io/script/install.sh | bash -s 1.4.3`{{exec}}

After install, you can run `vela version` to check vela CLI installed

RUN `vela version`{{exec}}

### 2.Install KubeVela Core

RUN `vela install --version v1.4.3`{{exec}}

### 3.Install VelaUX

RUN `vela addon enable velaux --version v1.4.3`{{exec}}    

RUN `apt install xdg-utils -y`{{exec}} 

By default, velaux didn't have any exposed port, you can view it by:

`vela port-forward addon-velaux -n vela-system 8080:80 --address='0.0.0.0'`{{exec}}

>Warning: `--address='0.0.0.0'` is just to adapt to the [killercoda.com](https://github.com/killercoda/scenario-examples/blob/main/network-traffic/step1.md) platform and is not a requirement!

Choose `> Cluster: local | Namespace: vela-system | Component: velaux | Kind: Service` for visit.   

[ACCESS VELAUX]({{TRAFFIC_HOST1_8080}})   

Initialized admin username and password: admin/VelaUX12345

`vela logs -n vela-system --name apiserver addon-velaux | grep "initialized admin username"`{{exec}}

If there is no password in logs, you can get it from secret with the name admin in the vela-system namespace.
