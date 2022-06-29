helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --create-namespace --install prom prometheus-community/kube-prometheus-stack -n monitoring \
    --values prom.yml
helm upgrade --install prom-adapter prometheus-community/prometheus-adapter --values prom-adapter.yml -n monitoring
