FROM traefik:v2.0

ADD config.yaml /etc/traefik/

CMD ["--api.insecure=false",
    "--providers.docker=true",
    "--providers.docker.exposedbydefault=false"]

