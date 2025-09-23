MAC OS <br /> 
<br />

What this script will do <br /> 
================================
Contained within this repo is a script to download and run to install Isovalent enterprise and Hubble Timescape (lite) UI using the various helm charts 
Isovalent Base install Document which this script is based on:<br /> 
https://docs.isovalent.com/v1.17/operations-guide/installation/eks-install.html#<br /> 
<br /> 
This repo will do the following <br /> 
<br /> 
1 - Check you have Isovalent Helm charts installed, and make sure they are up todate <br /> 
2 - Create an AWS EKS cluster with CNI disabled<br /> 
3 - Install the Prometheus metrics CRD on the EKS cluster<br /> 
4 - Install Isovalent enterprise using Helm Charts<br /> 
5 - Create an EKS node group<br /> 
6 - Install DNS-HA<br /> 
7 - Install Hubble Timescape (lite)<br /> 
8 - Enable port forwarding to access the Hubble Timescape (lite) UI<br /> 
<br /> 
Once installed you can access the UI with URL http://127.0.0.1:12000/<br /> 
<br />

Steps to install<br /> 
======================
<br /> 
1 - Make sure you have all CLI's listed here installed, kubectl, aws, eksctl and helm CLI tools should be installed <br />
https://docs.isovalent.com/v1.17/operations-guide/installation/eks-install.html#requirements <br />
<br />
2 - Clone this repo <br />
<br />
3 - You now need to change 3 files <br />
<br /> 
    - Add the name you want to call your EKS cluster and set your AWS Region, in each of the files below look for variable and change to your details<br /> 
    <br /> 
      name: xxxx-your-cluster-name-xxxx<br />
      region: xxxx-your-aws-region-xxxxx<br />
      <br />
    - File to make changes are:<br /> 
      - 5-create-cilium-enterprise-values-yaml.sh<br /> 
      - cluster.yaml<br /> 
      - nodegroup.yaml<br /> 
  <br />
4 - Once you have completed the changes above, now run the following command from your terminal:<br />
<br />
  source 0-create-all.sh<br /> 
<br />
5 - The script will now create all and install Isovalent Cilium and Hubble Timescape UI (lite)
<br />
<br />

NOTE:<br /> 
========================
<br /> 
You will see an error message after installing the Helm charts, this is due to the helm chart waiting for the certificte (for TLS) pod<br />
to be created but this will not move to a running pod until the EKS nodes are created which is the <br />
next step after the error message.<br />
<br />
This is the error message note for reference <br />
<br />
<br />
"****************************************"<br />
"THE ABOVE ERROR MESSAGE IS BECAUSE THE NODES HAVE NOT BEEN CREATED, AND THE POD FOR THE CERT IS WAITING TO BE ASSIGNED"<br />
"****************************************"<br />
<br />
<br />
<br />
<img width="1486" height="824" alt="image" src="https://github.com/user-attachments/assets/e0b418f0-3cd7-4534-8e3f-af7ec8ba8947" />



