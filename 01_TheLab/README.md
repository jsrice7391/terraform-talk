# Terraform at a glance

Terafrom is a platform released by the Hashicorp company. This goes along with their other suite of tools including:

- Packer
- Vagrant


Terraform is a platform that uses Infrastructure as code (IaC) to allow its users to manage cloud and local architecture through code. This leads to:

* Reproductible environnements
* Itempotence and convergence
* Easing collaboration
* Self-Service infrastructure

Terraform can be used on the following environments:

* Public clouds
    * AWS
Azure
    * GCP
* Private Clouds
    * OpenStack
    * vSphere
    * CloudStack
* SoftwareServices
    * MySQL
    * Github
    * Chef


## Terms To Know

Provider - responsible for creating and managing resources. You can have multiple providers on a single TF file.

These providers are public and open-source commonly written in GO. We can specify them within a tf file by using

Modules - Terraform self contained packages of Terraform configurations that are managed as a group. Modules can be used to create reusable components, improve organization and treat pieces of infrastructure as a black box.

## Getting Started

Within a folder (possibly this one?), create a file called `main.tf`. This is the file we will be using to create our first Terraform resource.

Within that file insert the following:
```bash
SOME STUFF GOES HERE
```

We have specifiedd two main concepts withhin this file
- We will be using the Docker provider to create Docker ressources.
- We have created a Docker resource called MEOW and have given it our own Specifications> 

Within this directory run the following command:

```bash
terraform init
```
This command will go and insturct terraform to go and download the proividesrs we hhave specified within the TF file. You will notice that terraform has created a `.terraform` folder.

With the new Docker module installed, we can now run:

```bash
terraform plan
```

We are now unlocking some of the cooler parts of trraform. The plan will show us what terraform plans to do with the configureaiton we gave it. If everyhting looks okay to you, go ahead and run:

```bash
terraform apply
```

Whoa! Cool! Terraform went and did some stuff for us:

- It went and created the Docker container we wanted from the image we specified
- It stored it all within a TF state file