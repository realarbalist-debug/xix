FROM gojolvl99/gojo-v2-core:latest

LABEL maintainer="Cxlvins"
LABEL description="Cloud Run Xray HTTP Upgrade (Trojan WS + Trojan HU)"
LABEL version="3.2"

WORKDIR /etc/xray

COPY config.json /etc/xray/config.json

# Cloud Run uses ONLY one port
EXPOSE 8080

# reduce overhead
ENV XRAY_LOGLEVEL=warning
ENV XRAY_WORKERS=4

# run xray
ENTRYPOINT ["xray"]
CMD ["-config", "/etc/xray/config.json"]
