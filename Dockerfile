FROM prom/prometheus

# Copy the Prometheus configuration template and entrypoint script
USER root
COPY prometheus.yml /etc/prometheus/prometheus.yml.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the Prometheus server port
EXPOSE 9090

# Set the entrypoint to our custom script
ENTRYPOINT [ "/entrypoint.sh" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--storage.tsdb.retention.time=365d", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles", \
             "--web.external-url=http://localhost:9090", \
             "--log.level=info"]
