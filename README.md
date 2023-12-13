# ACS-730_Fall-2023_Final-Project


- **Group name:** Group 5
- **Course:** ACS730
- **Date:** 2023.12.12
- **Section:** CAA-Fall'23
- **Professor:** Dhana Karuppusamy

Final Project: Two-Tier web application automation with Terraform, Ansible and GitHub Actions

## Group Members:

- Fatima Abubakar Furniturewala
- Latheef Saafia Fathima
- Mu-Ting Chung
- Xiao Ming Tang
- Xinyue Li

Mapping of Team Members with their GitHub Username

| Group Members Name             | GitHub Username       |
|--------------------------------|-----------------------|
| Fatima Abubakar Furniturewala  | Fatima-Furniturewala  |
| Mu-Ting Chung                  | mchung46              |
| Xiao Ming Tang                 | tangbr                |
| Xinyue Li                      | Lizaizai23            |
| Latheef Saafia Fathima         | Latheef-Saafia13      |

###Deployment pre-requisites:

Create two S3 buckets 'acs730-group5' and 'mchung46-test-web'.The first buckets will store Terraform state, it holds two root folders: dev and prod, in which there are network and webservers respectively. The second one is for the website.

##Deployment Process - Terraform part

1.  Start with the github code.
2.  Update the config.tf in dev and prod subfolders to reflect the bucket names.
3.  Update the desired input varibles in dev/network and deploy dev/network with the commands below
4.  Create Networks

 ```
    cd ~/environment/project/dev/network 
    tf init
    tf plan
    tf apply --auto-approve    
 ```

5. Create Webservers

```
   cd ~/environment/project/dev/webservers 
   tf init
   tf plan
   tf apply --auto-approve
```

6. Ansible Dynamic Inventory
   need to make sure the python version is not conlfict in ur environment
   
```
cd ansible
ansible-playbook -i hosts.txt playbook1.yaml
sudo nano /etc/ansible/ansible.cfg
ansible-playbook -i aws_ec2.yaml playbook1.yaml
```

7. Static Website
   
8. Clean Up process

The clean up process is a reverse of the deployment process,

1. Delete webservers instances 

```
   cd ~/environment/project/dev/webservers 
   tf destroy --auto-approve
```

2. Delete  network and its subnets 

```
   cd ~/environment/project/dev/network 
   tf destroy --auto-approve
```
