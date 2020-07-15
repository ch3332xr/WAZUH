#!/usr/bin/env bash


echo -e "[+] Installing Dependencies "
apt update 
apt install curl apt-transport-https
curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
echo -e "[+] Installing Elasticsearch "
apt update
apt install elasticsearch=7.8.0
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl start elasticsearch.service
filebeat setup --index-management -E setup.template.json.enabled=false
echo -e "[+] Installing Kibana "
apt install kibana=7.8.0
cd /usr/share/kibana/
sudo -u kibana bin/kibana-plugin install https://packages.wazuh.com/wazuhapp/wazuhapp-3.13.1_7.8.0.zip
systemctl daemon-reload
systemctl enable kibana.service
systemctl start kibana.service
echo -e "[+] ALL SET!! Further Config edit /etc/kibana/kibana.yml "
echo -e "[+] elasticsearch.hosts: ["http://<elasticsearch_ip>:9200"]  "
