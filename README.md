# auto_mc_server
Fully automated provisioning, configuration, and setup of Minecraft server.

### Requirements
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


### Resources/Sources used
1. [1] Chatgpt, https://openai.com/chatgpt/ (accessed Jun. 6, 2024). 