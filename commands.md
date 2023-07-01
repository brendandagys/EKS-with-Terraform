## Allow `kubectl` to communicate with EKS cluster
`aws eks --region us-east-1 update-kubeconfig --name eks-terraform-eks-project`

## Get all resources
`terraform state list`

## View logs for a job
`kubectl logs -f -l app=<app-name>`
