FROM mcr.microsoft.com/devcontainers/java:17

# 安装基础工具
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 创建必要的目录
RUN mkdir -p /opt /workspaces/starrocks

# 设置工作目录
WORKDIR /workspaces/starrocks
