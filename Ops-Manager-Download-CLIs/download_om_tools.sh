#!/bin/sh

export VER=`curl https://api.github.com/repos/pivotal-cf/om/releases | jq -r .[0].tag_name`

wget https://github.com/pivotal-cf/om/releases/download/$VER/om-linux-$VER
chmod 755 om-linux-$VER
mv om-linux-$VER /usr/local/bin/om

export VERP=0.0.49
wget https://github.com/pivotal-cf/pivnet-cli/releases/download/v0.0.49/pivnet-linux-amd64-$VERP
mv pivnet-linux-amd64-$VERP pivnet
chmod 755 pivnet
sudo cp pivnet /usr/local/bin

wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
apt-get update
apt-get install cf-cli

exit 0
