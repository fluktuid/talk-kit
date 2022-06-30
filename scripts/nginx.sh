helm repo add nginx https://helm.nginx.com/stable
kubectl create ns nginx-ingress
helm install nginx-ingress nginx/nginx-ingress --version 0.13.2 --values nginx.yml -n nginx-ingress
