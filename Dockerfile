FROM gojolvl99/gojo-8n1:latest

LABEL maintainer="Cxlvins"
LABEL description="Cloud Run Xray HTTP Upgrade (Trojan HU only)"
LABEL version="3.3"

WORKDIR /etc/xray

COPY config.json /etc/xray/config.json

# Cloud Run only exposes one port
EXPOSE 8080

# Reduce log overhead
ENV XRAY_LOGLEVEL=warning

# Run Xray
ENTRYPOINT ["xray"]
CMD ["-config", "/etc/xray/config.json"]
