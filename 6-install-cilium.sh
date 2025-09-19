echo "INSTALLING CILIUM"

helm install cilium isovalent/cilium --version 1.17.7 --namespace kube-system -f cilium-enterprise-values.yaml --timeout 60s --debug || true

#--debug 

echo "****************************************"
echo "THE ABOVE ERROR MESSAGE IS BECAUSE THE NODES HAVE NOT BEEN CREATED, AND THE POD FOR THE CERT IS WAITING TO BE ASSIGNED"
echo "****************************************"


#helm upgrade -i cilium isovalent/cilium --version 1.17.7 --namespace kube-system -f cilium-enterprise-values.yaml --debug
#--timeout 600s --debug

#echo "SLEEPING 30 SECONDS"
#sleep 30


#helm upgrade -i cilium isovalent/cilium --version 1.17.7 \
#		--namespace kube-system --timeout 30s -f - || true

#helm install cilium isovalent/cilium --version 1.17.7 --namespace kube-system --values -f cilium-enterprise-values.yaml
