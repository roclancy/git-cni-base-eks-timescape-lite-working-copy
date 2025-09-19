Contained within this repo is a script to download and run to install Isovalent enterprise and Hubble Timescape (lit) UI using the various helm charts

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

Once installed you can access the UI with URL http://127.0.0.1:12000/<br /> 
<br />
<br /> 
<br /> 

Steps to install

1 - Make sure you have all CLI's listed here installed, kubectl, aws, eksctl and helm CLI tools should be installed.

