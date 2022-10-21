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
git clone -b master https://github.com/vernesong/OpenClash.git package/lean/luci-app-openclash  #openclash出国软件
git clone -b packages https://github.com/xiaorouji/openwrt-passwall.git package/lean/package  #passwall基本依赖
git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/lean/luci-app-passwall  #passwall出国软件
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/lean/luci-app-adguardhome  #adguardhome
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/lean/luci-app-amlogic  #晶晨宝盒
echo "src-git ssrp https://github.com/fw876/helloworld.git" >> ./feeds.conf.default  #添加SSR-Plus

#rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #新的argon主题
#全新的[argon-主题]此主题玩法很多,这里看说明【https://github.com/jerrykuku/luci-theme-argon/blob/18.06/README_ZH.md】
#用WinSCP连接openwrt，在/www/luci-static/argon里面创建background文件夹（如果本身就有background就不需要创建）来存放jpg png gif格式图片可以自定义登陆界面，gif图片为动态登陆界面
