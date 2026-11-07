#!/bin/bash
cd ~/scipy

# 强行注入所有的编译器环境变量
export CC=/data/data/com.termux/files/usr/bin/clang
export CXX=/data/data/com.termux/files/usr/bin/clang++
export FC=/data/data/com.termux/files/usr/bin/flang
export CYTHON=/data/data/com.termux/files/usr/bin/cython
export TMPDIR=~/tmp-build

# 循环开火
while true; do
    echo "========================================="
    echo "💥 清理缓存，开始新一轮编译..."
    echo "========================================="
    
    # 每一轮都清理干净，避免缓存导致变量找不到
    rm -rf .mesonpy-* build
    rm -rf ~/.cache/meson
    
    pip wheel . --no-build-isolation --no-deps -w ~/wheels/ 2>&1 | tee build.log
    
    # 检查是否成功
    if [ ${PIPESTATUS[0]} -eq 0 ]; then
        echo "🎉🎉🎉 编译成功！轮子已经生成在 ~/wheels/ 目录下！"
        break
    fi
    
    # 抓取错误日志
    echo "⚠️ 遇到报错，5 秒后重试..."
    sleep 5
done
