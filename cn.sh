#!/bin/bash
set -x 
cd 桌面
ls
killall DrClient.exe
killall wineserver64

wine Client.exe
#end
