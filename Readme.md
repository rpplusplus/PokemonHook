# Readme

__文章推出收到了 Ingress 的玩家炮轰，本身我就是技术交流的目的，于是我删掉了 ipa，开源了关键代码。有兴趣的人自己搞吧。__

向我反馈不会签名的人实在是太多，真不知道怎么当的 iOS 开发者，连自己 app 签名过程都不了解。
我这里写一下这个 Repo 的使用方式。

#### 已更新 7-13 的新版本脱壳 ipa, 0.29.2。并支持了 armv7 指令集

## 自签名的过程：

- __不需要打开 Xcode 工程__
- 把我提供的 zip 中 libLocationFaker 用 codesign 重新签名
- 把 .app 放到 Payload 文件夹，压缩成 .ipa
- 用 codesign / fastlane / iresign 等工具重新签名 __注意:如果证书的 BundleID 不是 *, 需要修改 `Info.plist` 中的 BundleID__
- iTunes / iTools / Xcode 安装 ipa，推荐用 Xcode 安装，大多数安装失败会提示原因。

## 自定义 Tweak

- 安装 iOSOpenDev, 你可能会遇到各种各样的错误，记得 Google
- 使用 `CaptainHook` 模板开发，或用我提供的 Xcode 工程
- 对编译生成的 `dylib` 签名，如果编译时已选好签名可以跳过。
- 执行 yolo pokemango libXXXX.dylib 如果叫做 LocationFaker.dylib 可以跳过
- GOTO `自签名过程`

## 从砸壳开始
- 找一台越狱机器，没有请先越狱
- 如果越狱机是 iOS 9，请先去 PC 上的 iTunes 下载完整包，把里面的 `info.plist` 拿出来覆盖，或者砸壳的时候使用 `iTunes` 安装进来的。原因是 Info.plist 会被 App Slicing 插入很多限制性的key，例如只能 iPad 运行什么的。
- `ssh` 进去，用 `Clutch` 进行砸壳，推荐从 [Github](https://github.com/KJCracks/Clutch/releases) 上下载编译好的最新版然后扔进 `iPhone` 的 `/usr/bin`
- `scp` 拿出来砸过壳的包
-  对 `.app` 中的二进制提权限: `chmod 777 pokemongo`
- GOTO `自定义 Tweak`
