# Automated Minecraft Server

### Background
We are going to write infrastructure as code that fully automates the  provisioning, configuration, and setup of a Minecraft server. We're going to use Terraform to get our AWS instance up and running, Ansible to write our plybook that will install and configuure our minecraft server, and we will be using a docker container as the source of the Minecraft server code.

### Requirements
- We need to make sure we have valid aws credentials configured properly in our `~/.aws/credentials`. These can be found at 'Launch AWS Academy Learner Lab' -> aws cli.

- You can set your aws credentials to be environment variables and create a script to save them each time you start a new aws lab. We'll call it `set_aws_credentials.sh` This way we dont need to configure the `~/.aws/credentials` file every time:

```bash
#!/bin/bash

echo "Setting AWS environment variables..."
export AWS_ACCESS_KEY_ID="YOUR_NEW_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_NEW_SECRET_ACCESS_KEY"
export AWS_SESSION_TOKEN="YOUR_NEW_SESSION_TOKEN"

echo "AWS environment variables set."
```

- Make the script executable: `chmod +x set_aws_credentials.sh`
- Run the script: `source /path/to/your/script/set_aws_credentials.sh`


### Tools
- aws-cli/2.15.62 Python/3.11.8 Darwin/23.4.0 exe/x86_64
- Terraform v1.8.5
on darwin_arm64
+ provider registry.terraform.io/hashicorp/aws v5.52.0
- ansible [core 2.17.0]
- Docker version 26.1.1

### Diagram of major steps in pipeline

```mermaid
graph TD
    A[Install Tools] --> B[AWS CLI setup]
    B --> C[Run terraform scripts]
    C --> D[Run ansible playbook]
    D --> E[Play]

```

### Tutorial to run the code/scripts/provisioning/configuration
1. Initialize and apply the Terraform configuration:  
a. `terraform init`  
b. `terraform apply`  
c. Enter 'yes' when prompted.  
d. Wait for the script to finish running.  
e. The aws ec2 instance should now be up and running.  

2. Run Ansible playbook to start the Minecraft Server from Docker image:  
a. a. `ansible-playbook -i hosts minecraft.yml`

3. Verify Minecraft server is running with nmap:  
a. `nmap -sV -Pn -p T:25565 <current IP>`

4. Verify Minecraft server reboots when ec2 instance reboots:  
a. Get the instance id of the ec2 instance:  
b. `aws ec2 describe-instances`  
c. Copy the 'InstanceId'  
d. Reboot the instance:  
e. `aws ec2 reboot-instances --instance-ids <enter instance id here>`  
f. Run nmap again to verify Minecraft server is running:  
g. `nmap -sV -Pn -p T:25565 <current IP>`

### How to connect to Server
a. `aws ec2 describe-instances`  
b. `ssh -i ~/.ssh/minecraft ubuntu@<Public-IP>`

### Resources/Sources used
a. Chatgpt, https://openai.com/chatgpt/ (accessed Jun. 6, 2024). 