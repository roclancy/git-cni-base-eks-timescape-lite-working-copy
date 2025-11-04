# will create vun k8s apps
#source deploy-anom-yelb-app.sh
#source deploy-cve-app.sh

kubectl delete -f ./yelb/deployments/platformdeployment/Kubernetes/yaml
kubectl delete -f https://raw.githubusercontent.com/saqakhte/hs-k8s/refs/heads/main/dep/CVE-2021-41773/vuln-apache.yaml
kubectl delete -f vuln-engineering.yaml
kubectl delete -f cas-cve-2.yaml 
kubectl delete -f cas-cve-5.yaml
kubectl delete -f mongo-cve-1.yaml
