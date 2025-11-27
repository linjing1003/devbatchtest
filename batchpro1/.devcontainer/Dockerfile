FROM eclipse-temurin:17

# Install git and maven
RUN apt-get update && \
    apt-get install -y git maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 创建必要的目录
RUN mkdir -p /opt /workspaces/batchpro1

# 设置工作目录
WORKDIR /workspaces/batchpro1s/batchpro1
