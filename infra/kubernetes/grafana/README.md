helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana -n monitoring --create-namespace -f values-grafana.yaml
