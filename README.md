# w6-ansible

## Description:
This repo contins ansible code that runs terraform code that builds an infrastructure which is then configured by ansible to run a web app.

the code was configured to create 2 possible environments : staging and production ,with production being the more powerful one with more numerous and stronger vm machines.

### playbooks

### 1) deploy.yaml : 

variables:

a) env = staging/production

b) operation = init/plan/apply/destroy

c) user = < user_name >

d) pass = < user_password >

### 2) setup.yaml

## Usage: 

1) Install ansible and azure cli and configure them , guide: https://docs.microsoft.com/en-us/azure/developer/ansible/install-on-linux-vm?tabs=azure-cli#install-ansible-on-an-azure-linux-virtual-machine

2) Install terraform , guide: https://learn.hashicorp.com/tutorials/terraform/install-cli

3) clone this git repository into your machine

4) cd to w6-ansible directory (the one you cloned) and run the following commands while substituting the <user_name> with your desired user name , and <password> with your desired password.
also you may edit other parameters in the host_vars/localhost.yaml file , and in the terraform files as well (tf/variables.tf)
 
5) Use following commands ,note that you may write production instead of staging (-e env=production) to create the production environment instead of the staging one.
 
> $ ansible-playbook deploy.yaml -e env=staging -e operation=init -e user=< user_name > -e pass=< user_password >
 
- it will initialize terraform and its modules.

> $ ansible-playbook deploy.yaml -e env=staging -e operation=plan -e user=< user_name > -e pass=< user_password >
 
- it will create a terraform plan.

> $ ansible-playbook deploy.yaml -e env=staging -e operation=apply -e user=< user_name > -e pass=< user_password >
 
- it will build the infrastructure according to plan, may take a long time ,around 15 minutes.

 ### (IMPORTANT) : A .env file was created inside w6-ansible folder based on your parameters and default values , in it you need to edit the Okta values ,which are missing, to enable authentication

7) Run following command to install the weight tracker app (https://github.com/Stas-Kloyzner/bootcamp-app) on the vmss machines which were now created
 
> $ ansible-playbook setup.yaml 
 
- it will automatically create a hosts inventory and install the app on all the machines in it, it will also push the .env file into the machines .

8) If you wish to destroy the environment you have built ,use   "-e operation=destroy" like so :  
 
> $ ansible-playbook deploy.yaml -e env=staging -e operation=destroy -e user=< user_name > -e pass=< user_password >

