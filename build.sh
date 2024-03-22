sudo docker compose -f docker-compose.build.yml down && \
#sudo docker compose -f docker-compose.build.yml rm --all && \
sudo docker compose -f docker-compose.build.yml build --no-cache && \
sudo docker compose -f docker-compose.build.yml up -d --force-recreate && \
watch -n 1 sudo docker compose -f docker-compose.build.yml ps
