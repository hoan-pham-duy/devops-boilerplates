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
# export mongo_uri="mongodb+srv://<your uri>" #FOR MONGO ATLAS VERSION
# export mongo_uri="mongodb://10.100.103.221:27017" # FOR MONGO Local IN THE K8S Cluster

kubectl create secret generic mongodb-secret --from-literal=mongo-root-username=$mongo_root_username --from-literal=mongo-root-password=$mongo_root_password 

kubectl apply -f mongo.yaml
```

## Update the ip address: database_url in the mongo-configmap.yaml:
``` bash
kubectl get services | grep "mongodb-service"
```
```yaml
  database_url: "172.20.123.1" #TODO: Update here
  mongo-uri: "mongodb://172.20.123.1:27017"
```
## Create Route 53 domain
## Create SSL Certificate in AWS ACM with the according domain (or record A like: api.example.com)
## Copy the ARN's of created ACM to backend-service-loadbalancer.yaml
```
service.beta.kubernetes.io/aws-load-balancer-ssl-cert
```
```bash
kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service-nodeport.yaml
sed -i 's|<fill your ACM arn here>|<your-real-acm-arn>|g' backend-service-loadbalancer.yaml
kubectl apply -f backend-service-loadbalancer.yaml
```
## Check the Backend Load Balancer we've created
```bash
kubectl get services
```
## Go to Route 53 Domain, create an A record alias to the loadbalancer we've created