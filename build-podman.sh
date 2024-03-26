podman compose -f docker-compose.build.yml down && \
#podman compose -f docker-compose.build.yml rm --all && \
podman compose -f docker-compose.build.yml build --no-cache && \
podman compose -f docker-compose.build.yml up -d --force-recreate && \
watch -n 1 podman compose -f docker-compose.build.yml ps
