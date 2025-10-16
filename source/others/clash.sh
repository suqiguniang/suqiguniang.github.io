#!/bin/bash
echo "*********************************"
echo "今日时间："$(date +'%Y年%m月%d日')
echo "*********************************"
wget https://node.clashnode.cc/uploads/$(date +'%Y/%m')/1-$(date +'%Y%m%d').yaml -O /vol1/1000/docker/clash/config.yaml
sed -i '1s/port/mixed-port/g' /vol1/1000/docker/clash/config.yaml
sed -i '/socks-port/d' /vol1/1000/docker/clash/config.yaml
sed -i '2s/false/true/g' /vol1/1000/docker/clash/config.yaml
docker restart clash
echo "*********************************"
echo "线路更新成功"
echo "*********************************"