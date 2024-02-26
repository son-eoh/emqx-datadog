```
docker login
docker build -t docker-python-kubectl .
docker tag docker-python-kubectl:latest laughlamz/docker-python-kubectl:latest
docker push laughlamz/docker-python-kubectl:latest
```
