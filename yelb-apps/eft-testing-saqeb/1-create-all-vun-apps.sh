# will create vun k8s apps
#source deploy-anom-yelb-app.sh
#source deploy-cve-app.sh

kubectl apply -f ./yelb/deployments/platformdeployment/Kubernetes/yaml
kubectl apply -f https://raw.githubusercontent.com/saqakhte/hs-k8s/refs/heads/main/dep/CVE-2021-41773/vuln-apache.yaml
kubectl apply -f vuln-engineering.yaml
kubectl apply -f cas-cve-2.yaml 
kubectl apply -f cas-cve-5.yaml
kubectl apply -f mongo-cve-1.yaml

kubectl run -it hacker-container --image=madhuakula/hacker-container &



