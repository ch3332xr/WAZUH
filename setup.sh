#!/usr/bin/env bash

echo -e "[+] Installing Dependencies "
apt-get update
apt-get install curl apt-transport-https lsb-release gnupg2
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/3.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
echo -e "[++] INSTALLING WAZUH-MANAGER "
apt-get update
apt-get install wazuh-manager
systemctl enable wazuh-manager
systemctl status wazuh-manager
echo -e "[++] Installing WAZUH-API "
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install nodejs
apt-get install wazuh-api
systemctl enable wazuh-api
systemctl status wazuh-api
apt-get update
echo -e "[++] Installing FILEBEAT "
apt-get install curl apt-transport-https
curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
apt-get update
apt-get install filebeat=7.7.1
curl -so /etc/filebeat/filebeat.yml https://raw.githubusercontent.com/wazuh/wazuh/v3.12.3/extensions/filebeat/7.x/filebeat.yml
curl -so /etc/filebeat/wazuh-template.json https://raw.githubusercontent.com/wazuh/wazuh/v3.12.3/extensions/elasticsearch/7.x/wazuh-template.json
curl -s https://packages.wazuh.com/3.x/filebeat/wazuh-filebeat-0.1.tar.gz | sudo tar -xvz -C /usr/share/filebeat/module
systemctl daemon-reload
systemctl enable filebeat.service
systemctl restart filebeat.service
systemctl restart wazuh-manager
systemctl restart wazuh-api
systemctl status filebeat wazuh-api wazuh-manager
echo -e " [++] All SET! , Do not forget to edit filebeat  /etc/filebeat/filebeat.yml , ADD IP "
