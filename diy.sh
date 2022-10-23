#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#

# 修改openwrt登陆地址,把下面的192.168.1.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.0.5/g' ./package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/Phicomm_N1/g' ./package/base-files/files/bin/config_generate


#内核版本是会随着源码更新而改变的，在coolsnowwolf/lede的源码查看最好，以X86机型为例，源码的target/linux/x86文件夹可以看到有几个内核版本，x86文件夹里Makefile可以查看源码正在使用内核版本
#修改版本内核（下面两行代码前面有#为源码默认最新5.4内核,没#为4.19内核,默认修改X86的，其他机型L大源码那里target/linux查看，对应修改下面的路径就好）
#sed -i 's/PATCHVER:=5.10/PATCHVER:=5.4/g' ./target/linux/armvirt/Makefile  #修改内核版本


#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
#git clone -b packages https://github.com/xiaorouji/openwrt-passwall.git package/lean/package  #passwall基本依赖
#git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/lean/luci-app-passwall  #passwall出国软件
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/lean/luci-app-openclash  #openclash出国软件
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/lean/luci-app-amlogic  #晶晨宝盒
#echo "src-git ssrp https://github.com/fw876/helloworld.git" >> ./feeds.conf.default  #添加SSR-Plus
