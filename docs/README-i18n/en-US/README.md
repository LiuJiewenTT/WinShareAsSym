# WinShareAsSym

<div style="align-items: center; justify-content: center; display: flex; margin: 10px; gap: 10px">
    <img alt="GitHub Downloads (all assets, all releases)" src="https://img.shields.io/github/downloads/LiuJiewenTT/WinShareAsSym/total">
    <img alt="GitHub Release" src="https://img.shields.io/github/v/release/LiuJiewenTT/WinShareAsSym">
    <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/LiuJiewenTT/WinShareAsSym">
    <img alt="GitHub License" src="https://img.shields.io/github/license/LiuJiewenTT/WinShareAsSym">
</div>

This is a toolkit to create symbolic links to shared folders/files on Windows. By doing so, you can have a copy of the data everywhere available, without taking up more storage space.

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" >
<link rel="stylesheet" href="docs/res/css/main.css" >
<link rel="stylesheet" href="../../../docs/res/css/main.css" >
<link rel="stylesheet" href="docs/res/css/github-markdown-alert.css">
<link rel="stylesheet" href="../../res/css/github-markdown-alert.css">

<script src="readme.js" ></script>
<script src="../shared/readme.js" ></script>
<div class="go-to-top" style="display: none;">
    <i class="fas fa-arrow-up"></i>
</div>

> [!IMPORTANT]
> 
> 禁止用于AI训练。
> NO AI TRAINING. 

<div class="quick-navigate">
    <span class="quick-navigate-title">Quick jump：<br></span>
    <div class="quick-navigate-item-group">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <!-- <span class="quick-navigate-item"><a href="#概览图">概览图</a></span> -->
        <span class="quick-navigate-item"><a href="#Setup">Setup</a></span>
        <span class="quick-navigate-item"><a href="#Usage">Usage</a></span>
        <span class="quick-navigate-item"><a href="#wiki">Wiki</a></span>
        <!-- <span class="quick-navigate-item"><a href="#开发">开发</a></span> -->
    </div>
</div>

## Setup

It's still portable, the installation add the registries and the uninstallation removes the registries. **You don't have to do the installation step if you don't care about context menu entries.**

This toolkit contains `install.bat` and `uninstall.bat` to install and uninstall the toolkit on your system. 

Run `install.bat` as an administrator to install the toolkit, and `uninstall.bat` to uninstall it.

Currently, some new scripts are not fully multi-language capable. Hence, some might not work without `set LANG=zh-CN`.

## Usage

1. Copy `create_file_sym.bat` to the folder where you want to create the symbolic link, if you want to create a symbolic link to files; or copy `create_dir_sym.bat` to the folder where you want to create the symbolic link, if you want to create a symbolic link to folders. 
 > If you did setup, you can use the context menu to get a copy.
2. Drag and drop the shared folder/file to the batch file, the script will automatically create the symbolic link.
 > You can also run the batch file from the command line with the shared folder/file as an argument, for example: `create_file_sym.bat "C:\Users\John\Documents\Shared Documents\myfile.txt"`

> About the usage, you can refer to [wiki](docs/wiki-i18n/).

> [!WARNING]
> 
> Some symbols are special, and it is not guaranteed that the script will work properln the path or file name contains these symbols. The list of sbols: `&[]`.

## Wiki

> Will update Chinese version first.

[wiki](docs/wiki-i18n/)

[wiki gh-wiki](https://github.com/LiuJiewenTT/WinShareAsSym/wiki)
