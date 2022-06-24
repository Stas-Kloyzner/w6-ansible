## w6-ansible
1)install ansible and azure cli and configure them, guide:https://aster.cloud/2019/10/10/how-to-install-azure-pip-package-for-ansible/

2)install terraform ,guide:https://learn.hashicorp.com/tutorials/terraform/install-cli

- clone the git repository

- cd to w6-ansible directory and run the following commands while substituting the <user_name> with your desired user name , and <password> with your desired password.
also you may edit other parameters in the host_vars/localhost.yaml file , and in the terraform files as well (tf/variables.tf)
 

3)ansible-playbook deploy.yaml -e env=staging -e operation=init -e user=<user_name> -e pass=<password>
it will initialize terraform and its modules.

4)ansible-playbook deploy.yaml -e env=staging -e operation=plan -e user=<user_name> -e pass=<password>
it will create a plan.

5)ansible-playbook deploy.yaml -e env=staging -e operation=apply -e user=<user_name> -e pass=<password>
it will build the infrastructure according to plan.


6)a .env file was created based on your parameters and default values,in it you need to edit the Okta values which are missing

7) ansible-playbook setup.yaml 
it will automatically create an inventory and install the app on all the machines in it

