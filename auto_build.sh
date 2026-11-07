#!/bin/bash
cd ~/scipy

export CC=/data/data/com.termux/files/usr/bin/clang
export CXX=/data/data/com.termux/files/usr/bin/clang++
export FC=/data/data/com.termux/files/usr/bin/flang
export CYTHON=/data/data/com.termux/files/usr/bin/cython
export TMPDIR=~/tmp-build

# 极致的火力轰炸，无限循环
while true; do
    echo "🔥🔥🔥 正在开火 -vvv 🔥🔥🔥"
    pip wheel . --no-build-isolation --no-deps -w ~/wheels/ -vvv 2>&1 | tee build.log
    
    if [ ${PIPESTATUS[0]} -eq 0 ]; then
        echo "🎉🎉🎉 编译成功！轮子已经生成在 ~/wheels/ 目录下！"
    fi
done
