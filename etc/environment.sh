#!/bin/sh
BASEDIR=/mnt/storage/usr
env PATH=$PATH:$BASEDIR/bin LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASEDIR/lib ash
env LUA_PATH='/mnt/storage/usr/share/lua/5.1//?.lua;/mnt/storage/usr/share/lua/5.1//?/init.lua;/root/.luarocks/share/lua/5.1//?.lua;/root/.luarocks/share/lua/5.1//?/init.lua;/mnt/storage/usr/share/lua/5.1//?.lua;/mnt/storage/usr/share/lua/5.1//?/init.lua;/mnt/storage/usr/share/lua/5.1//?.lua;/mnt/storage/usr/share/lua/5.1//?/init.lua;/mnt/storage/usr/lib/luarocks'
env LUA_CPATH='/mnt/storage/usr/lib/lua/5.1//?.so;/root/.luarocks/lib/lua/5.1//?.so;./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so'
