# Create EKS Cluster
```bash
cd eks/
eksctl create cluster   --name mern-devops-v3   --node-type t3.large   --nodes 1   --nodes-min 1   --nodes-max 1   --region ap-southeast-1
aws eks --region ap-southeast-1 update-kubeconfig --name mern-devops-v3
```
# Create Mongo Secrete
``` bash
export mongo_root_username="admin"
export mongo_root_password="password"
export mongo_uri="export mongo_uri="mongodb+srv://<your uri"

kubectl create secret generic mongodb-secret --from-literal=mongo-root-username=$mongo_root_username --from-literal=mongo-root-password=$mongo_root_password --from-literal=mongo-uri=$mongo_uri

```

## Update the ip address: database_url in the mongo-configmap.yaml:
``` bash
kubectl get services | grep "mongodb-service"
```

# Apply the kubnetes configuration
``` bash
cd eks/
kubectl apply -f ../k8s/mongo.yaml
kubectl apply -f ../k8s/mongo-configmap.yaml
kubectl apply -f ../k8s/mongo-express.yaml
kubectl apply -f ../k8s/mongo-configmap.yaml
kubectl apply -f ../k8s/mongo-express.yaml

kubectl apply -f ../k8s/backend-deployment.yaml
kubectl apply -f ../k8s/backend-service-nodeport.yaml
kubectl apply -f ../k8s/backend-service-loadbalancer.yaml
```

