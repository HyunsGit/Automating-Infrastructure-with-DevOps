#!/bin/bash

export KIC_MONITOR_AGENT_CREDENTIALID_CR1="6dcd8eb993434d5d9efd7beae256470b"
export KIC_MONITOR_AGENT_CREDENTIALSECRET_CR1="BUfwSvI732XRq0Xx_hxqnC_opK2gVm90cNjZFltEWuYmrKz5bWVN2pHb0YqvxmAF0kpk73B-xdBsPbCDn_oNDw"

echo "################# Download kic_monitor_Agent File #################"
wget https://objectstorage.kr-central-2.kakaoi.io/v1/52867b7dc99d45fb808b5bc874cb5b79/kic-monitoring-agent/package/kic_monitor_agent_0.9.5_amd64.deb
sudo dpkg -i kic_monitor_agent_0.9.5_amd64.deb
sudo touch /var/log/kic_monitor_agent.log
sudo rm kic_monitor_agent_0.9.5_amd64.deb
echo "################# File Download Done! #################"

echo "################# Setting /etc/default/kic_monitor_agent File #################"
sudo cat <<EOF > /etc/default/kic_monitor_agent
KIC_LOG_FILE_PATH=/var/log/kic_monitor_agent.log
KIC_MONITOR_ENDPOINT_URL=https://monitoring.kr-central-2.kakaoi.io
KIC_MONITOR_AGENT_AUTH_APPLICATION_CREDENTIAL_ID=${KIC_MONITOR_AGENT_CREDENTIALID_CR1}
KIC_MONITOR_AGENT_AUTH_APPLICATION_CREDENTIAL_SECRET=${KIC_MONITOR_AGENT_CREDENTIALSECRET_CR1}
EOF
sudo chown root:root /etc/default/kic_monitor_agent
echo "################# Setting Configuration File Done! #################"

echo "################# Daemon Start #################"
sudo systemctl daemon-reload
sudo systemctl restart kic_monitor_agent
sudo systemctl enable kic_monitor_agent --now