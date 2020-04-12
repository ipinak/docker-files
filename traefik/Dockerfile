FROM traefik:v2.2

LABEL container.name="traefik"
LABEL container.version="2.2"
LABEL traefik.frontend.rule="monitor.ipinak.gr"
LABEL traefik.port="2080"

ADD traefik.yaml /etc/traefik/

CMD ["--providers.docker=true", "--providers.docker.exposedbydefault=false"]

