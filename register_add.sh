#!/bin/bash
cd /usr/share
#if [ -d "$penstack_dash_board" ]; then
rm openstack-dashboard -rf
#fi
git clone https://github.com/sunxin3/dashboard_project.git
mv dashboard_project/openstack-dashboard ./
rm -rf .git
mv dashboard_project/.git ./
rm -rf dashboard_project/

#2./usr/share/pyshared/horizon:
cd /usr/share/pyshared
#mv horizon horizon_bak_bygeyg_20121010
#if [ -d "$horizon" ]; then
rm horizon -rf
#fi
git clone https://github.com/sunxin3/horizon_application.git
mv horizon_application horizon
rm -rf .git
mv horizon/.git ./
mv horizon horizon1
mv horizon1/horizon/ ./
rm -rf horizon1

#create connection of registers
cd /usr/lib/python2.7/dist-packages/horizon/dashboards/syspanel
rm registers -rf
ln -s /usr/share/pyshared/horizon/dashboards/syspanel/registers registers

#create connection of django.mo
cd /usr/lib/python2.7/dist-packages/horizon/locale/zh_CN/LC_MESSAGES
ln -s /usr/share/pyshared/horizon/locale/zh_CN/LC_MESSAGES/django.mo django.mo

#create connection of register.html
cd /usr/lib/python2.7/dist-packages/horizon/dashboards/syspanel/templates/syspanel
ln -s /usr/share/pyshared/horizon/dashboards/syspanel/templates/syspanel/registers registers
service apache2 restart

