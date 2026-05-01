# Stage 1: Get Node.js
FROM node:20-slim AS node-base

# Stage 2: Final Python Image
FROM python:3.12-slim
ENV DEBIAN_FRONTEND=noninteractive

# 1. Copy Node.js
COPY --from=node-base /usr/local/bin /usr/local/bin
COPY --from=node-base /usr/local/lib /usr/local/lib

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    pkg-config \
    libgtk-3-dev \
    libsoup2.4-dev \
    libwebkit2gtk-4.1-dev \
    libjavascriptcoregtk-4.1-dev \
    && ln -sf libwebkit2gtk-4.1.so /usr/lib/$(uname -m)-linux-gnu/libwebkit2gtk-4.0.so \
    && ln -sf libjavascriptcoregtk-4.1.so /usr/lib/$(uname -m)-linux-gnu/libjavascriptcoregtk-4.0.so \
    && ln -sf webkit2gtk-4.1.pc /usr/lib/$(uname -m)-linux-gnu/pkgconfig/webkit2gtk-4.0.pc \
    && ln -sf javascriptcoregtk-4.1.pc /usr/lib/$(uname -m)-linux-gnu/pkgconfig/javascriptcoregtk-4.0.pc


# Install Node.js, Git and Python Versions
RUN echo "Checking installed versions..." \
    && python3 --version \
    && node -v \
    && npm -v \
    && git --version \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.72.0
ENV PATH="/root/.cargo/bin:${PATH}"

# Set the working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/vaughanf1/BB-Terminal.git

# Set the working directory to the cloned repo
WORKDIR /app/BB-Terminal

# Make scripts executable and run setup
RUN chmod +x setup.sh start.sh && sed -i 's|npm run dev|npm run dev -- --host 0.0.0.0|' start.sh
RUN ./setup.sh

# Expose the port the service is running on
EXPOSE 5173

# Start the application
CMD sh -c "./start.sh && tail -f /dev/null"

