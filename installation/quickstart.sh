#!/bin/bash

set -eof pipefail

cat <<EOF
***********************************************************
*                                                         *
* This script gets you started quickly                    *
*                                                         *
* It                                                      *
*                                                         *
* 1) enables the puppetlabs yum repository                *
* 2) installs the puppetserver rpm                        *
* 3) enables time synchonization                          *
* 3) configures a puppet entry in /etc/hosts              *
* 4) configures puppetserver to use less memory           *
*                                                         *
***********************************************************
EOF

if ! rpm -qi --quiet puppetlabs-release-pc1; then
    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
fi

yum install -y puppet-agent
yum install -y puppetserver

yum install -y ntp ntpdate

#puppet resource package ntpdate ensure=installed
#puppet resource package ntp ensure=installed
ntpdate 0.centos.pool.ntp.org

systemctl start ntpd
systemctl enable ntpd
#puppet resource service ntpd ensure=running enable=true

echo "192.168.42.42  puppet  puppet" >> /etc/hosts
echo "export PATH=/usr/bin:/usr/sbin:/opt/puppetlabs/bin" >> ~/.bashrc
#puppet resource host puppet ensure=present ip='192.168.42.42' host_aliases='puppet'

#sed -i 's/JAVA_ARGS.*/JAVA_ARGS="-Xms1024m -Xmx1024m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"/' /etc/sysconfig/puppetserver

