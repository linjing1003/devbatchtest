#!/bin/bash

# 使用 devcontainer CLI 自动启动所有 DevContainer
# 扫描当前目录下的所有 .devcontainer 并批量启动

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
        echo ">>> 正在启动: $PROJECT_NAME"
        
        # 使用 devcontainer CLI 启动（会自动执行 postCreateCommand）
        cd "$dir" && devcontainer up --workspace-folder . && cd ..
        
        echo "  ✓ $PROJECT_NAME 启动成功"
        echo ""
    fi
done

echo "=== 运行中的容器 ==="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"

echo ""
echo "✓ 完成！所有 DevContainer 已启动"