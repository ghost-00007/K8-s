# Setting Up Prerequisites to Create an EKS Cluster on Bare Metal or Laptop

## Install Required Tools
1. **AWS CLI**  
   The AWS Command Line Interface (CLI) enables you to interact with AWS services from the command line.

2. **kubectl CLI**  
   `kubectl` is used to manage Kubernetes clusters.

3. **eksctl CLI**  
   `eksctl` is a CLI tool to create, manage, and delete Amazon EKS clusters.

---

## Configuring AWS CLI with Security Credentials

1. **Generate Security Credentials:**
   - Navigate to the **AWS Management Console** → **Services** → **IAM**.
   - Select the **IAM User**: `pramoth`.  
     **Important:** Always use an IAM user to generate security credentials. Using the root user is highly discouraged. 
   - Click the **Security credentials** tab.
   - Click **Create access key**.
   - Copy the **Access Key ID** and **Secret Access Key**.


2. **Configure AWS CLI:**
   Open the command line and configure AWS CLI using the credentials:
   ``` bash
   aws configure
   AWS Access Key ID [None]: ABCDEFGHIAZBERTUCNGG  # Replace with your Access Key ID
   AWS Secret Access Key [None]: uMe7fumK1IdDB094q2sGFhM5Bqt3HQRw3IHZzBDTm  # Replace with your Secret Access Key
   Default region name [None]: us-east-1
   Default output format [None]: json
  

# Test if AWS CLI is working after configuring the above 

aws ec2 describe-vpcs


## Installing kubectl CLI

**IMPORTANT NOTE:**  
It is highly recommended to use the `kubectl` binaries provided by Amazon (Amazon EKS-vended `kubectl` binary). These binaries ensure compatibility with the specific version of your Amazon EKS cluster.  

Refer to the official documentation for detailed steps to download and install the appropriate `kubectl` binary:  
[Install kubectl for Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

---

## Installing eksctl CLI on Windows or Linux

For installing `eksctl` on Windows or Linux, follow the official documentation provided by Amazon:  
[Install eksctl](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html#installing-eksctl)






