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

#### Terraform Provisioners
Provisioners are used to excute the script or commmand in the compute machine after they have created. It is like executing user data script while creating the EC2 instances. 

#### Terraform Providers
Providers are plugins that allow you to interact with API you want. Eg: AWS,Azure,Kubernetes,Postgres,Github etc

You need a provider to make your terraform configuration file work. 

'terraform init' comand will download all the necessary plugin according to the provider you mentioned in the configuration file. 

    *Tip: If you are working in big complex infrastructure and you wanna know which providers they are using just execute the command 'terraform providers'*

#### Terraform Modules

Terraform modules is used to reduce the amount of code in the configuration and reusablility of code. You can relate it to functions or libraries in the programming languages(Not exactly the same to same but both serves the same purpose)

#### Maintaining Terraform Files

##### Variables 
Variables are defined by using variable blocks
``` 
variable "demo"{
    type = string
    default = "Hello world"
}
```
###### Variable Types

String,Numbers,Bool,lists,set,map. We can define a default value
Examples
```
variable "vpc_name"{
    type = string                         #Defining what kind of variable type you are using
    description = "Setting a VPC name"    #Description provides an overview for reader why or what variable is defined here 
    default = "myvpc"                     #Giving your value
}
```
Note: Number or integers don't need double quotes, but Terraform automatically converts number and bool values to strings when needed. For example 5 and "5" both are correct

###### Variable LISTs

List is what an array is doing in the prograaming language, it is use to store multiple values 
```
variable "lists" {
    type = (string)
    default = ["Value1", "Value2"]
}
```
###### VARIABLE MAP

Is a Key:Value pair. We use the key to access to the value

```
variable "mymap" {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
}
```

###### Outputs
Basically outputs block will give you the output after you hit 'terraform apply'
```
output "vpc_id" {
    value = "aws_vpc.myvpc.id"
}

```

If we run a `apply` we can see the next message:

```
Apply complete!
Outputs:
vpcid = vpc-099d9099f5faec2d9
``` 

###### Local values 

Local values assigns tha name to the expression. Basically we are storing the values in the variables and we call or use multiple times in our configuration file 

```
locals {
        my_bike = "Duke250"
}
output "my_bike_model" {
  value = local.my_bike
}
```

Note: Above is just an example to understand for people reading this, in real case scenarios we didn't use random variable like bike.etc. remember we are using terraform to automate the cloud infrastructure 


###### DataSources
Data source is used to alow terraform to use the information outside of terraform, means it used information may be another configuration file or modified functions.

###### Environment variable

Used to export our values and able to overide the values in the .tf file before execute 'terraform plan'. It is more secure way to pass the secret information as variables rather than exposing it in our configuration file

How to do it eg TV_VAR_vpcname=myvpc

###### TFVAR Files

Passing variables inside a file, this is possible create a file called terraform.tfvars this file can be in a yaml or json notation.

Note :  only *terraform.tfvars* file will be autoloaded, if you are using your own naming conversion for multiple tfvar file like *dev.tfvars* *prod.tfvars* these values cannot be auto loaded by terraform. You need to explicitly load via the command line during 'terraform plan'

command to do it ; 'terraform plan -var-file="dev.tfvars"'

##### AUTOLOAD Variables

Similar to terraform.tfvars if you wanna use different file names but you wanna terraform to load that automatically, in such cases you can use *<file_name>.auto.tfvars* (This is the next file that look after terraform.tfvars). 

```
eg: dev.auto.tfvars

```

###### LOAD PRECIDENCE

How your file will be overide the variables

1. -var flag (This will override the '-var-file')
1. -var-file (This will override the 'Environment variables')
1. Environment variables (This will override the values in terraform.tfvars)
1. terraform.tfvars (This will overide the variables in *.auto.tfvars)
1. *.auto.tfvars (This will override the variables in the default code)
1. Default value in the code 




