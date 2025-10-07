---
title: Prometheus
description: A minimal example of the Prometheus timeseries database
tags:
  - prometheus
  - observability
---

# Prometheus Example

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/KmJatA?referralCode=9kQOPq)

Deploy Prometheus on Railway with one click. Pre-configured to self-monitor the Prometheus service and [a well-known demo-application](http://demo.do.prometheus.io:9090)

## Environment Variables

This setup requires the following environment variables:

### Grafana Cloud Integration
- `GRAFANA_USERNAME`: Your Grafana Cloud username/ID (e.g., 2718031)
- `GRAFANA_PASSWORD`: Your Grafana Cloud API token (starts with glc_...)

### Application Monitoring
- `AEGIS`: Hostname for your Aegis application (e.g., aegis.railway.internal)
- `AEGIS_PORT`: Port number for your Aegis application (e.g., 504)

### For Railway Deployment

Set these environment variables in your Railway project settings under the "Variables" tab.


Then run with:
```bash
docker build -t prometheus-custom .
docker run -p 9090:9090 --env-file .env prometheus-custom
```
