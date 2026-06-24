# Use the pre-cached devcontainer image containing Flutter SDK
FROM kofc-dev:latest AS build
USER root

# Configure git to trust the flutter SDK path and workspace paths
RUN git config --global --add safe.directory /home/vscode/development/flutter \
    && git config --global --add safe.directory /workspace

WORKDIR /workspace

# Copy the entire workspace to build the web project
COPY --chown=vscode:vscode . .
WORKDIR /workspace/applications/frontend
RUN flutter pub get
RUN flutter build web

# Serve the static built files using Nginx
FROM nginx:alpine
COPY --from=build /workspace/applications/frontend/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
