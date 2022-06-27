helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
k create ns monitoring
helm upgrade --install prom prometheus-community/kube-prometheus-stack -n monitoring \
  --set grafana.ingress.enabled=true --set grafana.ingress.ingressClassName=nginx --set "grafana.ingress.hosts[0]=grafana.l.k8s-lukas.atix-training.de" \
  --set prometheus.ingress.enabled=true --set prometheus.ingress.ingressClassName=nginx --set "prometheus.ingress.hosts[0]=prom.l.k8s-lukas.atix-training.de" 

helm upgrade --install prom-adapter prometheus-community/prometheus-adapter --values prom-adapter.yml