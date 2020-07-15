#!/usr/bin/env bash


echo -e " [**] Enabling services hold on............../\///// "
echo -e " [**] Statrting services hold on............../\///// "
systemctl daemon-reload
systemctl enable wazuh-manager.service
systemctl enable wazuh-api.service
systemctl enable elasticsearch.service
systemctl enable filebeat.service
systemctl enable kibana.service
systemctl restart wazuh-manager
systemctl restart wazuh-api
systemctl restart elasticsearch
systemctl restart filebeat
systemctl restart kibana
systemctl status wazuh-manager
systemctl status wazuh-api
systemctl status elasticsearch
systemctl status filebeat
systemctl status kibana
