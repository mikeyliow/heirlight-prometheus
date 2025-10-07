#!/bin/sh

# Substitute environment variables in the prometheus config template using sed
sed -e "s|\${GRAFANA_USERNAME}|${GRAFANA_USERNAME}|g" \
    -e "s|\${GRAFANA_PASSWORD}|${GRAFANA_PASSWORD}|g" \
    -e "s|\${AEGIS}|${AEGIS}|g" \
    -e "s|\${AEGIS_PORT}|${AEGIS_PORT}|g" \
    /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.yml

# Start prometheus
exec /bin/prometheus "$@"

