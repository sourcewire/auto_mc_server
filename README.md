# Automated Minecraft Server

## Background
We are going to write infrastructure as code that fully automates the  provisioning, configuration, and setup of a Minecraft server. We're going to use Terraform to get our AWS instance up and running, Ansible to write our plybook that will install and configuure our minecraft server, and we will be using a docker container as the source of the Minecraft server code.

### Requirements
- We need to make sure we have valid aws credentials configured properly in our `~/.aws/credentials`. These can be found at 'Launch AWS Academy Learner Lab' -> aws cli.

- You can set your aws credentials to be environment variables and create a script to save them each time you start a new aws lab. This way we dont need to configure the `~/.aws/credentials` file every time:
<!--
#!/bin/bash

echo "Setting AWS environment variables..."
export AWS_ACCESS_KEY_ID="YOUR_NEW_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_NEW_SECRET_ACCESS_KEY"
export AWS_SESSION_TOKEN="YOUR_NEW_SESSION_TOKEN"

echo "AWS environment variables set."
-->

- Make the script executable: `chmod +x set_aws_credentials.sh`
- Run the script: `source /path/to/your/script/set_aws_credentials.sh`


Tools:
- aws-cli/2.15.62 Python/3.11.8 Darwin/23.4.0 exe/x86_64
- Terraform v1.8.5
on darwin_arm64
+ provider registry.terraform.io/hashicorp/aws v5.52.0
- ansible [core 2.17.0]
- Docker version 26.1.1

### Overview of different steps/stages of pipeline
Initialize and apply the Terraform configuration:
`terraform init`
`terraform apply -auto-approve`


### Tutorial to run the code/scripts/provisioning/configuration
1. Initialize and apply the Terraform configuration:
`terraform init`
`terraform apply -auto-approve`

2. Run Ansible playbook
`ansible-playbook -i hosts minecraft.yml`



### Resources/Sources used
1. [1] Chatgpt, https://openai.com/chatgpt/ (accessed Jun. 6, 2024). 