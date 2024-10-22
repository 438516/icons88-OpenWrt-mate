# 此脚本用处是：添加第三方插件
#=========================================================================================================================
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang



#./scripts/feeds update -a
# 添加ShadowSocksR Plus+插件
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加PowerOff关机插件
git clone https://github.com/TraderWukong/luci-app-poweroff.git package/luci-app-poweroff

# 添加infinityfreedom主题
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
scripts/feeds update neobird
scripts/feeds install luci-theme-neobird

#添加filebrowser文件管理插件
git clone https://github.com/xiaozhuai/luci-app-filebrowser package/luci-app-filebrowser
make package/luci-app-filebrowser/compile

# 添加adguardhome插件
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 添加OpenClash插件
sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# 添加PassWall插件
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

#添加mihomo插件
# echo "src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main" >> "feeds.conf.default"
