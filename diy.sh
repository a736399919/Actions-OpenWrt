#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
#修改lan口地址
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

#修改机器名称
sed -i 's/OpenWrt/Newifi-Y1/g' package/base-files/files/bin/config_generate

#修改wifi名称
sed -i 's/OpenWrt/FK20100010/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#修改时区
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#添加自定义插件
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
#添加Lienol的插件包
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
#修改banner
rm -rf package/base-files/files/etc/banner
cp -f ../newifi-y1-banner package/base-files/files/etc/banner
