
all: cluster-create cluster-login cluster-prepare app

help:	## Show usable targets
	@awk '/^[^\t].*##/ {print $$1;sub(/^.*##/,"   ");print}' Makefile

build: build-server build-load

build-server:
	docker build -f server/Dockerfile -t server .

build-load:
	docker build -f load/Dockerfile -t load .

cluster-create: ## create cluster via terraform
	cd terraform; \
	terraform plan; \
	terraform apply -auto-approve

cluster-login: ## login to created cluster
	aws eks --region us-east-2 update-kubeconfig --name autoscale

cluster-destroy: ## destroy cluster via terraform
	cd terraform; \
	terraform plan; \
	terraform destroy

cluster-prepare: ## install basic apps, like network, metrics, ingress-controller, autoscaler, prometheus
	cd scripts; \
	kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml; \
	./nginx.sh; \
	./autoscaler.sh; \
	./prom.sh

app: app-create-load app-create-server app-create-prometheus ## create application

app-create-load: ## create load application
	kubectl apply -k kubernetes/load

app-create-server: ## create server application
	kubectl apply -k kubernetes/server

app-create-prometheus: ## create server application
	kubectl apply -f kubernetes/monitoring
