# WinShareAsSym

This is a toolkit to create symbolic links to shared folders/files on Windows.

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

