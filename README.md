# terraform-ibm-openshift

Use this project to set up Red Hat® OpenShift Container Platform 3 on IBM Cloud, using Terraform.

## Overview
Deployment of 'OpenShift Container Platform on IBM Cloud' is divided into separate phases.
	
* Phase 1: Provision the infrastructure on IBM Cloud <br>
  Use Terraform to provision the compute, storage, network & IAM resources on IBM Cloud Infrastructure
  
* Phase 2: Deploy OpenShift Container Platform on IBM Cloud <br>
  Install OpenShift Container Platform which is done via Ansible playbooks - available in the https://github.com/openshift/openshift-ansible project. 
  During this phase the router and registry are deployed.
  
* Phase 3: Post deployment activities <br>
  Validate the deployment

The following figure illustrates the deployment architecture for the 'OpenShift Container Platform on IBM Cloud'.

![Infrastructure Diagram](https://github.com/IBMTerraform/terraform-ibm-openshift/blob/master/docs/infra-diagram.png)

## Prerequisite

* Docker image for the [Terraform & IBM Cloud Provider](https://github.com/ibm-cloud/terraform-provider-ibm#docker-image-for-the-provider) 
* IBM Cloud account (used to provision resources on IBM Cloud Infrastructure or SoftLayer)


## Provison the IBM Cloud Infrastrcture for Red Hat OpenShift

1. Review and update the variables.tf file 
1. Provision the infrastructure using the following command
   ``` console
   # Create the infrastructure.
   $ make infrastructure
   ```
Refer to the documentation [here](), for details about the infrastructure elements being provisioned for OpenShift.

* On successful completion, you will see the following message
   ```
   ...

   Apply complete! Resources: 37 added, 0 changed, 0 destroyed.
   ```

## Installing Red Hat OpenShift on IBM Cloud Infrastrcture
The Red Hat OpenShift will be deployed using the disconnected installation procedure described [here]( https://docs.openshift.com/container-platform/3.6/install_config/install/disconnected_install.html), since the Master & App nodes do not have Internet connectivity. 

The Bastion node has access to the Internet, and it is used to manually download the software rpms and container images. The Master, Infra & App nodes are configured to use the Bastion node a local-repository to install the respective components.

### Prepare to install Red Hat OpenShift

1. You have to setup the RHEL subscription, for disconnected install of OpenShift from Bastion node - using the following procedure:
   
  make rhn_username=<rhn_username> rhn_password=<rhn_password> bastion

2. Setup Bastion as the local-repo for installing OpenShift, by running the following
   
  make local_repo

3. Setup Master , Infra and app node for installing Openshift, by running the following

  ``` console
  $ make ose_nodes
  ```

### Install Red Hat OpenShift

To install OpenShift on the cluster, just run:
   ``` console
   $ make openshift
   ```


## Post-install configuration of Red Hat 

\[Work in Progress\]

## Work with OpenShift

\[Work in Progress\]

## Destroy the OpenShift cluster

Bring Down your cluster with:
  ``` console
   $ terraform destroy
   ```

## Troubleshooting

\[Work in Progress\]

# References

* https://github.com/dwmkerr/terraform-aws-openshift - Used as reference to create this project
  
* https://github.com/ibm-cloud/terraform-provider-ibm - Terraform Provider for IBM Cloud  
  
* [Deploying OpenShift Container Platform 3.6](https://docs.openshift.com/container-platform/3.6/install_config/install/quick_install.html)

\[Work in Progress\]

