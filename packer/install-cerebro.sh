#!/bin/bash
set -e

#export CEREBRO_VERSION="0.7.2"

wget https://github.com/lmenezes/cerebro/releases/download/v${CB_VERSION}/cerebro-${CB_VERSION}.tgz
mkdir /usr/share/cerebro
tar -xvzf ./cerebro-${CB_VERSION}.tgz -C /usr/share/cerebro/

sed -i "s/^hosts = /foo = /" /usr/share/cerebro/cerebro-${CB_VERSION}/conf/application.conf
sed -i '$s@$@\nhosts = [ { host = "http://localhost:9200", name = "Elasticsearch" } ]@' /usr/share/cerebro/cerebro-${CB_VERSION}/conf/application.conf

if ! getent group cerebro > /dev/null 2>&1 ; then
    echo -n "Creating cerebro group..."
    #addgroup --quiet --system cerebro
    groupadd --system cerebro
    echo " OK"
fi

# Create elasticsearch user if not existing
if ! id cerebro > /dev/null 2>&1 ; then
    echo -n "Creating cerebro user..."
    useradd  -r -g cerebro -s /bin/false cerebro
    echo " OK"
fi

chown -R cerebro:cerebro /usr/share/cerebro

printf "[Unit]\nDescription=Cerebro\n\n[Service]\nType=simple\nUser=cerebro\nGroup=cerebro\nExecStart=/usr/share/cerebro/cerebro-${CB_VERSION}/bin/cerebro '-Dpidfile.path=/dev/null'\nRestart=always\nWorkingDirectory=/\n\n[Install]\nWantedBy=multi-user.target\n" | tee -a /etc/systemd/system/cerebro.service
systemctl daemon-reload
systemctl enable cerebro.service
systemctl start cerebro
