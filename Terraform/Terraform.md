# Terraform

## Infrastructure as Cloud(IaC):

IaC is a infrastructure management tool that helps you to manage you infrastruture with code rather than going into cloud console and doing things manually. We are using one of the IaC tool called Terraform.

You write a configuration script that automate *Creating,Updating,Deleting* the infrastructure. The lanuguage that we will use to write a terraform script is know as Hashicorp Configuration Language(Hcl). 

Not only for cloud infrastructure you can also manage your on-prem infrastructure using Terraform.

## Some important Iac concepts to know:

#### Popular Iac tools

There are several Iac tools available in the market, each serves it's own purpose,some of the popular Iac tools are 
- Terraform (Use for multi cloud management)
- AWS Cloud Formation (Works only with AWS)
- Azure Resource Manager (ARM) templates (For Azure)
- Deployment Manager (For GCP)

#### What is mean by configuration drift
When the provisoned infrastructure has unexpected confguration change. `For eg :  Cloud engineer has enabled Delete on Termination for the production database`

If you not noticed the configuration drift then you resources in the infra might go down, which is obviously a big problem. 

#### How to Detect the cofiguration drift
- Using AWS Config in AWS 
- Storing state of infra in the Terraform State files
- Respective tools for each and every cloud providers 
- AWS Cloud Formation comes with AWS Drift Detection

#### How to prevent the cofiguration drift
- Using gitops, put your files in the git, makes easy to versioning and review each and every pull request so that you can avoid misconfiguration

## So What is Terraform,
Terraform is the tool helps you to leverage the Infrastructure as Code.Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

## Terraform Architecture
So how does the terraform request works on high level?

1. You write a configuration code, then hit 'terraform apply'
1. Then the request go to the plugins via RPC
1. Then the request will communicate with an API which ever provider you are targeting *for example:AWS*

![Terraform Architecture](Terraform_Architecture.png)

