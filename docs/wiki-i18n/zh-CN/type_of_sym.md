# 符号链接类型

本页将介绍各种“符号链接”是什么，它们在Windows系统上是大致是如何工作的，以及各种使用情景下的表现。

通过阅读本页内容，你将对应该使用何种类型来满足你的需求有一个更明确的想法。

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" >
<link rel="stylesheet" href="../../res/css/main.css" >

<script src="../shared/readme.js" ></script>
<div class="go-to-top" style="display: none;">
    <i class="fas fa-arrow-up"></i>
</div>
<div class="quick-navigate"></div>

---

在开始前，我必须简单地告诉你一件事：

- 本项目中的“符号链接”文字，在大多数时候仅是一种不严谨、不准确的简要概述，其包含的内容并非只有符号链接。

> 虽然，这个项目最初确实是仅设计了符号链接。

## 类别

“符号链接”根据面向对象的类型可以大致分为两类：

1. 文件的链接
2. 目录的链接

> “符号链接”以下主要表示本项目支持的链接，非严格意义上的符号链接。

在Windows系统上，你可能会遇到这几种不同类型的链接：

| 类型 | 是否符号链接 | 说明 |
| --- | --- | --- |
| 硬链接（Hard Link） | 是 | 硬链接是指在同一文件系统中创建两个文件名指向同一文件的链接。 |
| 符号链接（SYMLINK） | 是 | 符号链接是指在同一文件系统中创建两个文件名指向同一文件的链接，但是这个链接并不是真正的文件，而是指向另一个文件的路径。支持相对路径。 |
| 目录符号链接（SYMLINKD） | 是 | 目录符号链接是指在同一文件系统中创建两个目录名指向同一目录的链接，但是这个链接并不是真正的目录，而是指向另一个目录的路径。支持相对路径。 |
| 目录的链接（Junction） | 是 | 目录的链接是指在同一文件系统中创建两个目录名指向同一目录的链接。*仅适用于NTFS文件系统*。 |
| 快捷方式（Shortcut） | 否 | 快捷方式是指在Windows资源管理器中右键点击某个文件或目录，选择“创建快捷方式”来创建的链接。 |
| 文件夹的快捷方式（Folder Shortcut） | 否 | 文件夹的快捷方式是指在Windows资源管理器中右键点击某个文件夹，选择“创建文件夹快捷方式”来创建的链接。 |

> - 上表中最入门的、最推荐泛用的类型皆为*符号链接*，笔者有意将两种*符号链接*相邻排列，便于读者进行对比。
> - 有时Junction也称目录软联结、软连结。
> - 上表中明确为非“符号链接”的类型通常不会在下文的讨论范围中。

## 各种情景表现

### 命令提示符（Command Prompt/cmd.exe）

在命令提示符中，你可以使用`mklink`命令来创建各种类型的符号链接。创建后使用`dir`命令列出，你将看到如下表现（简要），如下表。

> - 以下按照最入门、最推荐、最泛用三个优先级指标，先后进行展示。

``` cmd

> @REM 创建文件file1.txt的符号链接file2.txt
> mklink file2.txt file1.txt
为 file2.txt <<===>> file1.txt 创建的符号链接
> dir
2025/10/03  23:00                 0 file1.txt
2025/10/03  23:01    <SYMLINK>      file2.txt [file1.txt]

> @REM 创建目录temp1的符号链接temp2
> mklink /D temp2 temp1
为 temp2 <<===>> temp1 创建的符号链接
> dir
2025/09/28  09:27    <DIR>          temp1
2025/10/03  23:05    <SYMLINKD>     temp2 [temp1]

> @echo ---分割线，以上推荐优先考虑使用---
---分割线，以上推荐优先考虑使用---

> @REM 创建文件file1.txt的硬链接file3.txt
> mklink /H file3.txt file1.txt
为 file3.txt <<===>> file1.txt 创建了硬链接
> dir
2025/10/03  23:00                 0 file1.txt
2025/10/03  23:00                 0 file3.txt

> @REM 创建目录temp1的软连结temp3
> mklink /J temp3 temp1
为 temp3 <<===>> temp1 创建的联接
> dir
2025/09/28  09:27    <DIR>          temp1
2025/10/03  23:06    <JUNCTION>     temp3 [G:\Mine\Dev\MyProjects\WinShareAsSym\keep_local\test\temp1]

```

提前说一句，除非你真的很确定你想要使用硬链接，否则笔者真的不推荐，很多软件对于这种链接的适配不算完美（虽然可能出现的bug只是一些无伤大雅的东西）。

### Windows资源管理器（Explorer.exe）


