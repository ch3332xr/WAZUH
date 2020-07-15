#!/usr/bin/env bash


echo -e " [**] Enabling services hold on............../\///// "
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
