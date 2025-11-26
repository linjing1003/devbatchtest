#!/bin/bash

# 使用 devcontainer CLI 自动启动所有 DevContainer
# 扫描当前目录下的所有 .devcontainer 并批量启动

set -x  # 开启命令调试输出

echo "=== 开始扫描并启动 DevContainers ==="

# 检查 devcontainer CLI 是否安装
if ! command -v devcontainer &> /dev/null; then
    echo "错误: 未找到 devcontainer CLI"
    echo "请先安装: npm install -g @devcontainers/cli"
    exit 1
fi

echo "✓ devcontainer CLI 已安装"
echo ""

# 查找所有包含 .devcontainer 的目录
for dir in */; do
    if [ -d "${dir}.devcontainer" ]; then
        PROJECT_NAME=$(basename "$dir")
        echo "======================================"
        echo ">>> 正在启动: $PROJECT_NAME"
        echo "======================================"
        
        # 显示项目路径
        PROJECT_PATH="$(pwd)/${dir}"
        echo "项目路径: $PROJECT_PATH"
        
        # 进入项目目录
        echo "步骤1: 进入项目目录..."
        cd "$dir" || exit 1
        
        # 执行 devcontainer up 并显示详细输出
        echo "步骤2: 执行 devcontainer up..."
        echo "----------------------------------------"
        
        # 使用 --log-level trace 获取详细日志
        devcontainer up --workspace-folder . --log-level info
        
        EXIT_CODE=$?
        echo "----------------------------------------"
        
        if [ $EXIT_CODE -eq 0 ]; then
            echo "✓ $PROJECT_NAME 启动成功"
        else
            echo "✗ $PROJECT_NAME 启动失败 (退出码: $EXIT_CODE)"
        fi
        
        # 返回上级目录
        cd ..
        echo ""
    fi
done

echo "======================================"
echo "=== 运行中的容器 ==="
echo "======================================"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"

echo ""
echo "✓ 完成!所有 DevContainer 已启动"