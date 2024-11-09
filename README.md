# devops-programme

To run the playbook_docker.yml, execute the bellow command:
```
ansible-playbook playbook_docker.yml
=======
To build the docker image, execute:
```
docker build -t bobby84/getting-started-index-html .
```

To list the current images, execute:
```
docker image ls 
```
 
To push the docker image to Docker Hub, execute:
```
docker push bobby84/getting-started-index-html
```