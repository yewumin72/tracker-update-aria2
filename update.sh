#!/bin/bash
#
cd /tmp
wget https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt >& /dev/null
wget https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt >& /dev/null
wget https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_udp.txt >& /dev/null
wget https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_http.txt >& /dev/null
wget https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_https.txt >& /dev/null
wget https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ws.txt >& /dev/null
cat *.txt|grep -v "^$" |sort -u> list
list=`cat /tmp/list|sed ":a;N;s/\n/,/g;ta"`
sed -i '91s@.*@bt-tracker='"$list"'@' /home/ycd/桌面/Data/scirpt/aria2.conf
rm -rf *.txt >& /dev/null
rm -rf list >& /dev/null
