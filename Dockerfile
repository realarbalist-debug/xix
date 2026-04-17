FROM gojolvl99/gojo-v2-core:latest

LABEL maintainer="Cxlvins"
LABEL description="Cloud Run Xray HTTP Upgrade (Trojan WS + Trojan HU) – Boosted"
LABEL version="3.3"

WORKDIR /etc/xray

# Copy your boosted config
COPY config.json /etc/xray/config.json

# Cloud Run only exposes one port
EXPOSE 8080

# Performance environment variables
ENV XRAY_LOGLEVEL=warning
ENV XRAY_WORKERS=4                # Multi-threaded Xray processing
ENV XRAY_MAX_CONN_IDLE=300        # Max idle connection time
ENV XRAY_CONN_QUEUE_SIZE=10240    # Max connection queue for high concurrency
ENV XRAY_ENABLE_FASTOPEN=true     # TCP Fast Open
ENV XRAY_REUSE_PORT=true          # ReusePort to reduce socket overhead
ENV XRAY_MAX_EARLY_DATA=1024      # Early data for faster TLS handshake

# Use entrypoint and CMD for Xray
ENTRYPOINT ["xray"]
CMD ["-config", "/etc/xray/config.json"]
