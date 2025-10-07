#Connectivity within - Tenant-a namespace
echo "**************************************"
echo "**************************************"
echo "CONNECTIVITY BETWEEN - tenant-A frontend-service - TO - backend-service.tenant-A SAME NAMESPACE"
echo "**************************************"
echo "**************************************"
kubectl exec -n tenant-a frontend-service -- curl -sI backend-service.tenant-a

#Connectivity between namespaces - Tenant-a to tenant-b - WITHTIME OUT
echo "**************************************"
echo "**************************************"
echo "CONNECTIVITY BETWEEN - tenant-A frontend-service - TO - backend-service.tenant-B DIFFERENT NAMESPACE"
echo "**************************************"
echo "**************************************"
kubectl exec -n tenant-a frontend-service -- curl -sI --max-time 4 backend-service.tenant-b
#kubectl exec -n tenant-a frontend-service -- curl -sI backend-service.tenant-b

#connectivity between namespace - tenant-a to outide world - Twitter - WITH TIMEOUT
#kubectl exec -n tenant-a frontend-service -- curl -sI api.twitter.com
echo "**************************************"
echo "**************************************"
echo "CONNECTIVITY BETWEEN - tenant-A frontend-service - TO - api.twitter.com OUTSIDE CLUSTER "
echo "**************************************"
echo "**************************************"

kubectl exec -n tenant-a frontend-service -- curl -sI --max-time 4 api.twitter.com

