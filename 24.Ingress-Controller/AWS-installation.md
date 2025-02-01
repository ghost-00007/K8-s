Certainly! Below is your command sequence formatted in Markdown language:

# EKS Cluster Creation with eksctl

## Create an EKS Cluster
To create a new EKS cluster named `eksdemo1`, run the following command:

```
eksctl create cluster --name=eksdemo1 \
                      --region=us-east-1 \
                      --zones=us-east-1a,us-east-1b \
                      --without-nodegroup
```

## Associate IAM OIDC Provider
Next, associate the IAM OIDC provider with the EKS cluster:

```
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster eksdemo1 \
    --approve
```

## Create a Node Group
Finally, create a node group for the EKS cluster:

```
eksctl create nodegroup --cluster=eksdemo1 \
                        --region=us-east-1 \
                        --name=eksdemo1-ng-private1 \
                        --node-type=t3.medium \
                        --nodes-min=2 \
                        --nodes-max=4 \
                        --node-volume-size=20 \
                        --ssh-access \
                        --ssh-public-key=testing \
                        --managed \
                        --asg-access \
                        --external-dns-access \
                        --full-ecr-access \
                        --appmesh-access \
                        --alb-ingress-access \
                        --node-private-networking
```