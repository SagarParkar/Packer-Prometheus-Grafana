#!/bin/bash
curl -s https://packagecloud.io/install/repositories/pagerduty/rundeck/script.deb.sh | os=any dist=any bash
apt-get install rundeck-cli
export RD_URL=http://127.0.0.1:4440/api/44
export RD_USER=admin
export RD_PASSWORD=admin
rd projects create -p MyProject
rd projects archives import -w -p MyProject --file /tmp/MyProject-20230608-092457.rdproject.jar
touch /tmp/test.txt
