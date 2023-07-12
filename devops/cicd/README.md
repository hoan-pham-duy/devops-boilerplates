# Push the backend to the Docker registry
## Push to DockerHub
```bash
docker login
docker tag mern-devops-backend:latest lighthappy/mern-devops:latest
docker push lighthappy/mern-devops:latest
```
# CICD in Jenkins

``` bash
mkdir ~/jenkins_home
sudo ln -s ~/jenkins_home /var/jenkins_home
```
```bash
cd devops/cicd
docker-compose up -d
```
