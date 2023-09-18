#!/bin/sh
# Github Pages 要求所发布的 Html 路径不能有下划线，否则无法解析
# 此脚本的目的是把 GitBook 生成的 _book 目录复制到 book


if [ -d 'gitbook/_book' ] ; then
echo "Remove gitbook/_book ..."
rm -rf gitbook/_book
sleep 1
fi

if [ -d 'gitbook/book' ] ; then
echo "Remove gitbook/book ..."
rm -rf gitbook/book
sleep 1
fi

if [ ! -d 'gitbook/node_modules' ] ; then
    echo "Download nodejs module ..."
    cp -r node_modules gitbook/node_modules
    sleep 2
fi

echo "GitBook Building ..."
gitbook build gitbook
#docker run --rm -v "$PWD/gitbook:/gitbook" expm02/gitbook-server gitbook build
sleep 2

echo "Building for GitHub Pages ..."
cp -r gitbook/_book gitbook/book


echo "Remove gitbook/node_modules ..."
rm -rf gitbook/node_modules
sleep 1

echo "Build Finish."
echo "You can push to github now."
