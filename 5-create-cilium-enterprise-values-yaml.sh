
export CLUSTER_NAME="xxxx-your-cluster-name-xxxx"

export CLUSTER_ID=0
export EXTERNAL_KUBE_APISERVER_HOST=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}' | sed -e 's~^[^:]*://~~' -e 's~:.*~~')

cat > cilium-enterprise-values.yaml <<EOF
# Enable/disable debug logging
debug:
  enabled: false
  # -- Configure verbosity levels for debug logging
  # This option is used to enable debug messages for operations related to such
  # sub-system such as (e.g. kvstore, envoy, datapath or policy), and flow is
  # for enabling debug messages emitted per request, message and connection.
  #
  # Applicable values:
  # - flow
  # - kvstore
  # - envoy
  # - datapath
  # - policy
  verbose: ~

# Configure unique cluster name & ID
cluster:
  name: ${CLUSTER_NAME}
  id: ${CLUSTER_ID}

# Configure ENI specifics
eni:
  enabled: true
  updateEC2AdapterLimitViaAPI: true
  awsEnablePrefixDelegation: true
enableIPv4Masquerade: false
loadBalancer:
  serviceTopology: true
ipam:
  mode: eni
routingMode: native

# BPF / KubeProxyReplacement
kubeProxyReplacement: "true"
k8sServiceHost: ${EXTERNAL_KUBE_APISERVER_HOST}
k8sServicePort: 443

# Configure TLS configuration in the agent.
tls:
  ca:
    certValidityDuration: 3650 # 10 years

# Enable Cilium Hubble to gain visibility
hubble:
  enabled: true
  metrics:
    enableOpenMetrics: true
    enabled:
    # https://docs.cilium.io/en/stable/observability/metrics/#hubble-exported-metrics
    - dns:labelsContext=source_namespace,destination_namespace
    - drop:labelsContext=source_namespace,destination_namespace
    - tcp:labelsContext=source_namespace,destination_namespace
    - port-distribution:labelsContext=source_namespace,destination_namespace
    - icmp:labelsContext=source_namespace,destination_namespace;sourceContext=workload-name|reserved-identity;destinationContext=workload-name|reserved-identity
    - flow:sourceContext=workload-name|reserved-identity;destinationContext=workload-name|reserved-identity;labelsContext=source_namespace,destination_namespace
    - "httpV2:exemplars=true;labelsContext=source_ip,source_namespace,source_workload,destination_ip,destination_namespace,destination_workload,traffic_direction;sourceContext=workload-name|reserved-identity;destinationContext=workload-name|reserved-identity"
    - "policy:sourceContext=app|workload-name|pod|reserved-identity;destinationContext=app|workload-name|pod|dns|reserved-identity;labelsContext=source_namespace,destination_namespace"
    - flow_export
    serviceMonitor:
      enabled: true
  tls:
    enabled: true
    auto:
      enabled: true
      method: cronJob
      certValidityDuration: 1095 # 3 years
  timescape:
    enabled: true
  relay:
    enabled: true
    tls:
      server:
        enabled: true
    prometheus:
      enabled: true
      serviceMonitor:
        enabled: true

# Enable Cilium Operator metrics
operator:
  prometheus:
    enabled: true
    serviceMonitor:
      enabled: true

# Enable Cilium Agent metrics
prometheus:
  enabled: true
  serviceMonitor:
    enabled: true


# Configure Cilium Envoy options.
envoy:
  prometheus:
    enabled: true
    serviceMonitor:
      enabled: true

# Enable Cilium agent's support for Cilium DNS Proxy HA
extraConfig:
  external-dns-proxy: "true"
enterprise:
  featureGate:
    approved:
    - DNSProxyHA
    - HubbleTimescape
EOF