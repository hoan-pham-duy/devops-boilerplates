** Auth with google cloud
```
export YOUR_PROJECT_ID=""#TODO: Fill YOUR_PROJECT_ID here
export YOUR_CLUSTER_NAME=""#TODO: Fill YOUR_CLUSTER_NAME here
export YOUR_ZONE=""#TODO: Fill YOUR_ZONE here
export GOOGLE_PROJECT=${YOUR_PROJECT_ID}
gcloud config set project ${YOUR_PROJECT_ID}
gcloud auth application-default login
```
** Use terraform to create infrastructure
```
terraform init
terraform plan
terraform apply
```
** Log in in K8S cluster then install devops helm charts
```
gcloud container clusters list
gcloud container clusters get-credentials ${YOUR_CLUSTER_NAME}  --zone ${YOUR_ZONE}

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm install my-otel-demo open-telemetry/opentelemetry-demo

kubectl --namespace default port-forward svc/my-otel-demo-frontendproxy 8080:8080
```

Webstore http://localhost:8080/
Grafana http://localhost:8080/grafana/
Load Generator UI http://localhost:8080/loadgen/
Jaeger UI http://localhost:8080/jaeger/ui/
