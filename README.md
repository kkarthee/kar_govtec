

<p>Code is developed in Github and connected with Jenkins . This integration is achieved using ngrok .Once code is developed and pushed it will start processing. The process is like downloding code and checking out. Same system docker is installed and the docker plugin installed with the Jenkin application. That helps to build image and push image to my personal docker repository. In jenkins I have installed docker kubernetes and SSH plugins. Same way credentials are created . SSH - key authentication . Kubernetes - certificate (pfx). Docker - username and password .</p>

In local the code be tested using following command ( Docker installed machine)
```
git clone github.com/kkarthee/kar_govtec.git
cd kar_govtecdocker build -t gtweb:38 .
docker tag gtweb kkarthee/gtwebdocker-compose up -d 
```
To deploy using kubernetes I am pushing the code to my repository ```docker push registry.hub.docker.com/kkarthee/gtweb:38```.

I have chosen bare metal kubernetes for deployment. Kubernetes environment Single node cluster ( I am not using minikube as it is not scalable and not tolerant) . Any time we can add more kubernetes nodes and share load to nodes. Which is an idle condition for our scenario. Application deployment is done running remote commands from Jenkins server. Once deployed we can see the deployment using  kuberentes server ```watch kubectl get pod -n jenkins```. This app is deployed in Jenkins namspace. Thanks.
Test 24th.
Test 24thNov -1 
