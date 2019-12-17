# Terraform 101 - Building on AWS
This is a repo for the source code for a talk I am doing for DevOps University on Terraform! :terraform:

- Cloud Instutute can be found here:
- Terraform Official Docs:
- Slides: __eventually here__

# Talk Outline:

- The Beginning
    - What Terraform is.
    - What to use it for
- Begin and Build
     - Start building within AWS
     - Create a VPC
     - Create other resources
- Terraforms True Powers
     - Providers
     - HCL Language
     - Remote capabilities
- The Beyond
    - The Future features that are there, but not 100% ironed out

# Using this repo
This repository contains a `Vagrantfile` which enables developers to create Virtual machines with the necessary specifications provided within the Vagrantfile. Running with Vargan trequires two main programs:

- VirtualBox
- Vagrant

Users using the Vagrantifle will benefit from an isolated environment with all the necessary installations and versions.

# This Repo Layout

## 01_TheLab
The lab is a folder that users can go to in order to get most comfortable with Terraform. Within the folder, there is a `Solved` and an `Unsolved` folder. Also within the folder is a README.md that will have a series of questons on it so that users can answerr the challenges and then check the possible approach within the Solved folder.

## buildspec
AWS Codebuild looks for a `buildspec/buildspec.yml` file. For those users that might want to see a solution in which they could use CodeBuild to handle all of their Terrafrom deployments.

## Docs
General files on documentation and other good reads regarding the product.

## Providers
The talk I do is specifically within the AWS environment, but I would never want to steer users in a direction in which they thought that Terraform was just for AWS. This folder shows users other provider possibilites I have used on my own and really liked!

