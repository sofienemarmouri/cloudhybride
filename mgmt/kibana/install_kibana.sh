#!/bin/bash
sudo apt -y update

# Elasticsearch install
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch
sudo nano /etc/elasticsearch/elasticsearch.yml

sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
curl -X GET "localhost:9200"

# kibana install
sudo apt install kibana

sudo systemctl enable kibana
sudo systemctl start kibana

echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users

sudo nano /etc/nginx/sites-available/your_domain

sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/your_domain

sudo nginx -t

sudo systemctl reload nginx

sudo ufw allow 'Nginx Full'

## http://your_domain/status

# Logstash install

sudo apt install logstash

sudo nano /etc/logstash/conf.d/02-beats-input.conf

## nano

sudo -u logstash /usr/share/logstash/bin/logstash --path.settings /etc/logstash -t

sudo systemctl start logstash
sudo systemctl enable logstash

# Filebeat install

sudo apt install filebeat

sudo nano /etc/filebeat/filebeat.yml

# nano ..

sudo filebeat modules enable system

sudo filebeat modules list

sudo filebeat setup --pipelines --modules system

sudo filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'

sudo filebeat setup -E output.logstash.enabled=false -E output.elasticsearch.hosts=['localhost:9200'] -E setup.kibana.host=localhost:5601

sudo systemctl start filebeat
sudo systemctl enable filebeat

curl -XGET 'http://localhost:9200/filebeat-*/_search?pretty'