#!/bin/bash

# 노드익스포터 파일 다운로드
cd /home/ubuntu
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.0/node_exporter-1.6.0.linux-amd64.tar.gz

# 바이너리 파일 설정
sudo tar -xvf node_exporter-1.6.0.linux-amd64.tar.gz
sudo rm node_exporter-1.6.0.linux-amd64.tar.gz
cd /home/ubuntu/node_exporter-1.6.0.linux-amd64
sudo useradd -M -r -s /bin/false node_exporter
sudo cp /home/ubuntu/node_exporter-1.6.0.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# 데몬 파일 설정
sudo tee /etc/systemd/system/node_exporter.service << EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF


# 서비스 기동
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter