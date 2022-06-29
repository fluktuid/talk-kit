# KIT Vortrag

Diese Git enthält die Materialien zum KIT Vortrag am 30. Juni 22 (Vorlesung AI-IC).

## Inhalt

- kubernetes\
  kubernetes files
- scripts\
  Scripte zum Konfigurieren
- terraform \
  Scripte zum Aufsetzen des Clusterss
- andere Ordner\
  golang-code für Komponenten

## How to use?

1. (optional) Bauen der Images\
   Ausführen von `make build`

1. Aufsetzen des Clusters\
   Ausführen von `terraform plan; terradform apply` oder `make cluster-create`

1. Einloggen ins Cluster\
   Laden der Kubeconfig im Teraform Ordner oder `make cluster-login`

1. Aufsetzen von Common-Diensten im Cluster\
   Ausführen der Scripte im `scripts` Ordner oder `make cluster-prepare`\
   Hier muss ggf. der Ingress für Grafana/Prometheus angepasst werden.\
   Solle der Cluster-Scaler verwendet werden, muss ebenfalls der Name der Worker-Group angepasst werden.

1. DNS Eintrag auf Loadbalancer des Nginx-ingress im Cluster setzen.

1. Installation der App
   applyen der Kubernetes Manifest im Ordner `kubernetes` oder `make app`\
   Hier muss ggf. der Ingress für Grafana/Prometheus angepasst werden.

1. 🎉

