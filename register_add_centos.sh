#!/bin/bash
yum install python-django-nose
cd /usr/share
mv openstack-dashboard openstack-dashboard_bak_bygeyg_20121108
git clone https://github.com/sunxin3/dashboard_project.git
mv dashboard_project/openstack-dashboard ./
rm -rf .git
mv dashboard_project/.git ./
rm -rf dashboard_project/
cd /usr/share/openstack-dashboard/openstack_dashboard/local/
mv local_settings.py local_settings.py.bak
ln -s /etc/openstack-dashboard/local_settings  local_settings.py
cd /usr/share/openstack-dashboard/static/horizon/static
mv horizon horizon.bak
ln -s /usr/lib/python2.6/site-packages/horizon/static/horizon horizon

#2:/usr/lib/python2.6/site-packages/horizon:
cd /usr/lib/python2.6/site-packages
mv horizon horizon_bak_bygeyg_20121108
git clone https://github.com/sunxin3/horizon_application.git
mv horizon_application horizon
rm -rf .git
mv horizon/.git ./
mv horizon horizon1
mv horizon1/horizon/ ./
rm -rf horizon1

#create connection of registers
#cd /usr/lib/python2.7/dist-packages/horizon/dashboards/syspanel
#rm registers -rf
#ln -s /usr/share/pyshared/horizon/dashboards/syspanel/registers registers

#create connection of django.mo
#cd /usr/lib/python2.7/dist-packages/horizon/locale/zh_CN/LC_MESSAGES
#ln -s /usr/share/pyshared/horizon/locale/zh_CN/LC_MESSAGES/django.mo django.mo

#create connection of register.html
#cd /usr/lib/python2.7/dist-packages/horizon/dashboards/syspanel/templates/syspanel
#ln -s /usr/share/pyshared/horizon/dashboards/syspanel/templates/syspanel/registers registers
service httpd restart

