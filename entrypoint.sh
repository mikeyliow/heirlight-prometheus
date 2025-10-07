#!/bin/sh

echo "Starting Prometheus with environment variable substitution..."
echo "GRAFANA_USERNAME is set: $([ -n "$GRAFANA_USERNAME" ] && echo "YES" || echo "NO")"
echo "GRAFANA_PASSWORD is set: $([ -n "$GRAFANA_PASSWORD" ] && echo "YES" || echo "NO")"
echo "AEGIS is set: $([ -n "$AEGIS" ] && echo "YES" || echo "NO")"
echo "AEGIS_PORT is set: $([ -n "$AEGIS_PORT" ] && echo "YES" || echo "NO")"

# Substitute environment variables in the prometheus config template using sed
sed -e "s|\${GRAFANA_USERNAME}|${GRAFANA_USERNAME}|g" \
    -e "s|\${GRAFANA_PASSWORD}|${GRAFANA_PASSWORD}|g" \
    -e "s|\${AEGIS}|${AEGIS}|g" \
    -e "s|\${AEGIS_PORT}|${AEGIS_PORT}|g" \
    /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.yml

echo "Config file after substitution (with password masked):"
grep -A 3 "basic_auth:" /etc/prometheus/prometheus.yml | sed "s/password:.*/password: ***MASKED***/g"

# Start prometheus
exec /bin/prometheus "$@"

