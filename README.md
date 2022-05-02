# Ray Deploymentent
### Ray Cluster deployment in GKE cluster

#### 1. Create a Kubernetes cluster in google cloud platform
#### 2. Connect to the cluster through cloud shell
#### 3. run the following commands: 
	sudo pip3 install -U ray 
	sudo pip3 install kubernetes
#### 4. Configure kubectl to access your Kubernetes cluster.
#### 5. Install Helm 3 using following command.
##### For Linux
	curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
	sudo apt-get install apt-transport-https --yes
	echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
	sudo apt-get update
	sudo apt-get install helm
##### For Windows
	choco install kubernetes-helm
#### 6. Download the Ray Helm chart.
#### 6. change directory run the following commands:
	cd ray-charts
#### 7. run the following commands:
	helm -n ray install example-cluster --create-namespace ./ray
#### 8. Start Ray Head:
	ray start --head
#### 9. View the installed resources as follows:
	kubectl -n ray get rayclusters
	kubectl -n ray get pods
	kubectl -n ray get service
	kubectl get deployment ray-operator
	kubectl get pod -l cluster.ray.io/component=operator
	kubectl get crd rayclusters.cluster.ray.io
#### 10. To view autoscaling logs, run a kubectl logs command on the operator pod:
	kubectl logs \
	  $(kubectl get pod -l cluster.ray.io/component=operator -o custom-columns=:metadata.name) \
	  | tail -n 100
#### 11. The Ray dashboard can be accessed on the Ray head node at port 8265.
	kubectl -n ray port-forward service/example-cluster-ray-head 8265:8265
	
#### 12. To remove a Ray Helm release and the associated API resources, use kubectl delete and helm uninstall.
	# First, delete the RayCluster custom resource.
	kubectl -n ray delete raycluster example-cluster
	

	# Delete the Ray release.
	helm -n ray uninstall example-cluster
	

	# Optionally, delete the namespace created for our Ray release.
	kubectl delete namespace ray
	
