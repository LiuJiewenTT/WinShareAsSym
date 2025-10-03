# WinShareAsSym

这是一个用于**快捷共享文件副本**的工具包。通过创建 *符号连接*、*硬链接* 或 *软联结*，实现一份数据处处共用，不再占用多倍存储空间。

This is a toolkit to create symbolic links to shared folders/files on Windows. By doing so, you can have a copy of the data everywhere available, without taking up more storage space.

<script src="readme.js" ></script>
<div class="quick-navigate"></div>

## 安装

> 这个工具包是**可移动的 (Portable)**，你可以跳过这个并非必要的安装步骤，工具包依然能正常运行。

这个工具包包含 `install.bat` 和 `uninstall.bat`，用来安装和卸载这个工具包（需要使用管理员权限运行）。实际上，这是往注册表里添加或删除数据，用以添加或删除右键菜单功能。

## 使用

1. - 如果你安装了，那么你可以对着目录使用右键菜单，其中有相应的选项，选择你想使用的，接着目录里就会多出相应的脚本。
   - 如果你没有安装，那么你可以复制 `create_file_sym.bat` 或 `create_dir_sym.bat` 到你想要创建符号连接的目录。
2. 拖拽文件或目录到脚本上，脚本会自动创建符号连接（或硬链接或软链接，取决于你选择的脚本）。
   > 把你希望出现在这个目录里的文件或目录拖拽到脚本上，脚本会自动在这个目录里创建好链接，不会改变源文件或目录的位置。

> 关于使用说明，可以参阅[wiki](docs/wiki-i18n/)。

## Wiki

> 将优先更新中文版文档。


