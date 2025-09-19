
#echo "CREATING ENV VARIABLES"
#echo "***********************************"
#source 0-env.sh

echo "CHECKING HELM CHARTS ARE INSTALLED AND UPTO DATE"
echo "***********************************"
source 00-helm-update.sh

echo "CREATING EKS CLUSTER AND INSTALLING PROEMTHEUS METRICS"
echo "***********************************"
source 1-create-eks-cluster.sh
source 2-install-prometheus.sh

echo "INSTALLING CILIUM WITH HELM"
echo "***********************************"
source 5-create-cilium-enterprise-values-yaml.sh
source 6-install-cilium.sh

echo "CREATING NODE GROUP FOR THE EKS CLUSTER"
echo "***********************************"
source 7-create-node-grp.sh

echo "CREATING DNS HA, HUBBLE AND ITS CERTS AND CONFIG MAP"
echo "***********************************"
source 8-create-dns-ha.sh
#source 9-create-hubble-namespace.sh
source 9-create-timescape-namespace.sh
#source 10-get-cert-create-config-map.sh
#source 11-install-hubble-ui.sh
echo "sleep for 60s"
echo "***********************************"
sleep 90
source 11-install-timescape-lite.sh
echo "sleep for 60s"
echo "***********************************"
sleep 60
echo "CREATING RECOMMEMDED POLICIES"
echo "***********************************"
source 12-create-recommended-network-policies.sh

echo "INSTALLING HUBBLE-ENTERPRISE (LITE 1 HOURS MAX FOR METRICS) & SETTING FLOW EXPORT"
echo "***********************************"
source 13-upgrade-flows-hubble-timescape-lite.sh
source 13-restart-daemonset.sh

echo "ENABLING PORT FORWARD FOR HUBBLE-TIMESCAPE-UI (LITE)"
echo "***********************************"
source 14-hubble-ui-portforward.sh

echo "***********************************"
echo "PUT THIS IN YOUR BROWERS FOR ACCESS TO THE HUBBLE-TIMESCAPE (LITE) UI"
echo "127.0.0.1:12000"
echo "***********************************"
