FROM mcr.microsoft.com/devcontainers/dotnet:8.0

# Install dependencies for Flutter and Protobuf
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
       protobuf-compiler \
       xz-utils \
       unzip \
       libglu1-mesa \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /home/vscode

# Download and install Flutter SDK (3.24.3 is a stable version with Dart 3.5 support)
RUN mkdir -p /home/vscode/development \
    && curl -fL -o flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz \
    && tar -xf flutter.tar.xz -C /home/vscode/development \
    && rm flutter.tar.xz

# Configure PATH
ENV PATH="/home/vscode/development/flutter/bin:/home/vscode/.pub-cache/bin:${PATH}"

# Run doctor and pre-activate protoc_plugin
RUN flutter doctor \
    && dart pub global activate protoc_plugin
