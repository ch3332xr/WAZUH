![alt text](https://wazuh.com/wp-content/themes/wazuh/assets/images/wazuh_logo.svg)

# //|// Get started with WAZUH 
The Open Source Security Platform https://wazuh.com/

Simple scripts to get WAZUH running in a jiffy

## [|**|] MULTI NODE SETUP

![alt text](https://documentation.wazuh.com/3.13/_images/installing_wazuh_distributed1.png)


### [1] Install WAZUH Manager

Ref: https://documentation.wazuh.com/

Installs wazuh-manager, wazuh-api & filebeat in a go

1. Run as ROOT
2. git clone https://github.com/ch3332/WAZUH/
3. cd WAZUH
4. chmod  +x  *.sh
5. ./wazuhsetup.sh 

### [2] Install ELASTICSEARCH & KIBANA


1. Run as ROOT
2. ./elasticsetup.sh


### [3] Start All services

1. Run as ROOT
2. ./run.sh

## [|*|] SINGLE NODE SETUP (ALL in ONE)

![alt text](https://documentation.wazuh.com/3.13/_images/installing_wazuh_singlehost1.png)

Installs Wazuh-manager, Wazuh-api, Filebeat, Elasticsearch, Kibana in a go

1. Run as ROOT
2. ./allinone.sh



##### Tested on Linux 4.15.0-109-generic #110-Ubuntu SMP 
SkFJX01BSEFLQUwh
