# Push the backend to the Docker registry
## Push to DockerHub
```bash
docker login
docker tag mern-devops-backend:latest lighthappy/mern-devops:latest
docker push lighthappy/mern-devops:latest
```