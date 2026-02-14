# WinShareAsSym

Slogan: 我的硬盘我做主，拒绝重复占用！

<div style="align-items: center; justify-content: center; display: flex; margin: 10px; gap: 10px">
   <img alt="GitHub Downloads (all assets, all releases)" src="https://img.shields.io/github/downloads/LiuJiewenTT/WinShareAsSym/total">
   <img alt="GitHub Release" src="https://img.shields.io/github/v/release/LiuJiewenTT/WinShareAsSym">
   <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/LiuJiewenTT/WinShareAsSym">
   <img alt="GitHub License" src="https://img.shields.io/github/license/LiuJiewenTT/WinShareAsSym">
</div>

这是一个用于**快捷共享文件副本**的工具包。通过创建 *符号连接*、*硬链接* 或 *软联结*，实现一份数据处处共用，不再占用多倍存储空间。

This is a toolkit to create symbolic links to shared folders/files on Windows. By doing so, you can have a copy of the data everywhere available, without taking up more storage space.

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" >
<link rel="stylesheet" href="docs/res/css/main.css" >
<link rel="stylesheet" href="../../../docs/res/css/main.css" >

<script src="readme.js" ></script>
<script src="../shared/readme.js" ></script>
<div class="go-to-top" style="display: none;">
    <i class="fas fa-arrow-up"></i>
</div>
<div class="quick-navigate">
   <span class="quick-navigate-title">快速跳转：<br></span>
    <div class="quick-navigate-item-group">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="quick-navigate-item"><a href="#概览图">概览图</a></span>
        <span class="quick-navigate-item"><a href="#安装">安装</a></span>
        <span class="quick-navigate-item"><a href="#使用">使用</a></span>
        <span class="quick-navigate-item"><a href="#wiki">Wiki</a></span>
        <span class="quick-navigate-item"><a href="#开发">开发</a></span>
    </div>
</div>

## 概览图

右键菜单：

![右键菜单.png](https://github.com/LiuJiewenTT/WinShareAsSym/raw/master/docs/res/image/右键菜单.png)

在微信文件存储目录使用创建向导：

![在微信文件存储目录使用创建向导.png](https://github.com/LiuJiewenTT/WinShareAsSym/raw/master/docs/res/image/在微信文件存储目录使用创建向导.png)

MC跨版本共享资源-拖拽展示：

![MC跨版本共享资源-拖拽展示.png](https://github.com/LiuJiewenTT/WinShareAsSym/raw/master/docs/res/image/MC跨版本共享资源-拖拽展示.png)

MC跨版本共享资源-便携支持展示：

![MC跨版本共享资源-便携支持展示.png](https://github.com/LiuJiewenTT/WinShareAsSym/raw/master/docs/res/image/MC跨版本共享资源-便携支持展示.png)

## 安装

> 这个工具包是**便携的 (Portable)**，你可以跳过这个并非必要的安装步骤，工具包依然能正常运行。

这个工具包包含 `install.bat` 和 `uninstall.bat`，用来安装和卸载这个工具包（需要使用管理员权限运行）。实际上，这是往注册表里添加或删除数据，用以添加或删除右键菜单功能。

## 使用

1. - 如果你安装了，那么你可以对着目录使用右键菜单，其中有相应的选项，选择你想使用的，接着目录里就会多出相应的脚本。
   - 如果你没有安装，那么你可以复制 `create_file_sym.bat` 或 `create_dir_sym.bat` 到你想要创建符号连接的目录。
2. 拖拽文件或目录到脚本上，脚本会自动创建符号连接（或硬链接或软链接，取决于你选择的脚本）。
   > 把你希望出现在这个目录里的文件或目录拖拽到脚本上，脚本会自动在这个目录里创建好链接，不会改变源文件或目录的位置。

> 关于使用说明，可以参阅[wiki](#wiki)。

> [!WARNING]
> 
> 部分符号特殊，不保证当路径或文件名中包含这些符号时一定能正常运行。符号列表：`&[]`。

## Wiki

> 将优先更新中文版文档。

[wiki](docs/wiki-i18n/)

[wiki gh-wiki](wiki)

## 开发

开发环境：

- 系统版本：不低于*Windows 10*
- 存储文件系统：NTFS
- 其它建议：
  - 开启“开发者模式”，允许符号链接。

---

打包：执行`pack.bat`。

> 需手动清除`build\build\WinShareAsSym`目录。
