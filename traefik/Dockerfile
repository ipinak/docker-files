FROM traefik:v2.0

LABEL container.name="traefik"

ADD traefik.yaml /etc/traefik/

CMD ["--api.insecure=false", "--providers.docker=true", "--providers.docker.exposedbydefault=false"]

