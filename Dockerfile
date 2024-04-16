# Builder stage
FROM node:20-alpine AS builder

# Set the working directory in the container
WORKDIR /git

# Copy the repository contents into the container
COPY . .

# Install dependencies and build the site. Output directory will be /git/build
RUN yarn install && yarn run build

# Final stage
FROM caddy:2-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the build directory from the builder stage to /app
COPY --from=builder /git/build /app

# Caddyfile configuration to serve files from /app
RUN echo -e ":80 {\n  root * /app\n  try_files {path}.html {path}\n  file_server\n}" > /etc/caddy/Caddyfile

# Expose port 80
EXPOSE 80

# Start Caddy with the specified Caddyfile
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

# Docker Container Labels
LABEL org.opencontainers.image.title="Sangelo's Space"
LABEL org.opencontainers.image.description="Sangelo's Space website, packaged as a docker container, with the Caddy webserver."
LABEL org.opencontainers.image.url="https://sangelo.space"
LABEL org.opencontainers.image.documentation="https://gitpot.org/sangelo/website"
LABEL org.opencontainers.image.vendor="Sangelo"
LABEL org.opencontainers.image.licenses="GPL-v3"
LABEL org.opencontainers.image.source="https://gitpot.org/sangelo/website"

# Remove intermediate images after build
ONBUILD RUN rm -rf /git
