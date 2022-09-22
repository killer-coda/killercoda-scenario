### https://docs.devstream.io/en/latest/quickstart/     
### https://github.com/devstream-io

### https://github.com/devstream-io/dtm-repo-scaffolding-java-springboot

sh -c "$(curl -fsSL https://raw.githubusercontent.com/devstream-io/devstream/main/hack/quick-start/quickstart.sh)"     

export GITHUB_USER="<YOUR_GITHUB_USER_NAME_HERE>"     
export GITHUB_TOKEN="<YOUR_GITHUB_PERSONAL_ACCESS_TOKEN_HERE>"    
export DOCKERHUB_USERNAME="<YOUR_DOCKER_HUB_USER_NAME_HERE>"     
 
sed -i "s@YOUR_GITHUB_USERNAME_CASE_SENSITIVE@${GITHUB_USER}@g" quickstart.yaml    
sed -i "s@YOUR_DOCKER_USERNAME@${DOCKERHUB_USERNAME}@g" quickstart.yaml      


./dtm init -f quickstart.yaml

./dtm apply -f quickstart.yaml

./dtm delete -f quickstart.yaml
