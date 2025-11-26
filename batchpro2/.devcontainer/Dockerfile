FROM eclipse-temurin:17

# Install git and maven
RUN apt-get update && \
    apt-get install -y git maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create /opt directory if it doesn't exist
RUN mkdir -p /opt

# Set working directory
WORKDIR /workspace
