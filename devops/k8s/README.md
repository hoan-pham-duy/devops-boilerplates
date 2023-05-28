# Create EKS Cluster
```bash
eksctl create cluster   --name mern-devops-v3   --node-type t3.large   --nodes 1   --nodes-min 1   --nodes-max 1   --region ap-southeast-1
aws eks --region ap-southeast-1 update-kubeconfig --name mern-devops-v3
```
# Create Mongo Secrete
``` bash
export mongo_root_username="admin"
export mongo_root_password="password"
kubectl create secret generic mongodb-secret --from-literal=mongo-root-username=$mongo_root_username --from-literal=mongo-root-password=$mongo_root_password
```

# Apply the kubnetes configuration
``` bash
kubectl apply -f ../k8s/mongo.yaml
kubectl apply -f ../k8s/mongo-configmap.yaml
kubectl apply -f ../k8s/mongo-express.yaml
kubectl apply -f ../k8s/mongo-configmap.yaml
kubectl apply -f ../k8s/mongo-express.yaml
```

