#!/bin/bash
echo 'start script.'
#hostname=$(ec2metadata --public-hostname - get cache)
#[[ $hostname == '' ]] && hostname='127.0.0.1'
nginxConfPatch='/etc/nginx/nginx.conf'
#sudo apt-get install locate
#sudo updatedb
#nginxConfPatch=$(locate /nginx.conf)
if [ -f $nginxConfPatch ]; then
  echo 'nginx.conf found.'
  if [ -f backup.nginx ]; then
    echo 'backup.nginx was created earlier.'
  else
    cp $nginxConfPatch backup.nginx
    echo 'backup.nginx has been created.'
  fi
#  rm config_section.nginx
#  sed "s/\[hostName\]/$hostname/g" template.nginx >config_section.nginx
  sed '/[ ]*http[ ]*{/ r template.nginx' backup.nginx >nginx.conf.tmp
  echo 'nginx.conf.tmp has been created.'
  cp nginx.conf.tmp $nginxConfPatch
fi
echo 'script end'
