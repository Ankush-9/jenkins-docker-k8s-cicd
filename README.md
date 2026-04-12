Final CI/CD Pipeline using Jenkins, Docker and Kubernetes (EKS)
Overview
This project demonstrates an end-to-end CI/CD pipeline that automates the process of building, containerizing, and deploying an application to a Kubernetes cluster. It integrates Jenkins, Docker, and AWS EKS to simulate a real-world DevOps workflow.
Aim
* Clone source code from a Git repository
* Build the application using Maven
* Create a Docker image
* Push the image to a container registry (DockerHub)
* Deploy the application on Kubernetes (EKS)
Tools and Technologies Used
* Jenkins
* Docker
* Kubernetes (EKS)
* AWS CLI
* kubectl
* eksctl
* Maven
* GitHub
* Blue Ocean plugin
Architecture / Flow
GitHub → Jenkins → Maven Build → Docker Build → DockerHub → Kubernetes (EKS)
Pipeline Stages
1. Clone Repository
2. Maven Build
3. Docker Image Creation
4. Push to DockerHub
5. Kubernetes Deployment
6. Email Notification(Optional)
Infrastructure Setup
EKS Host Machine
Used for creating and managing the Kubernetes cluster.
Steps:
1. Launch EC2 instance (e.g., t2.micro)
2. Install eksctl and kubectl
3. Attach IAM role with required permissions
4. Create EKS cluster using eksctl
Jenkins Server Machine
Handles CI/CD execution and deployment.
Steps:
1. Launch EC2 instance (higher configuration recommended)
2. Install Java and Jenkins
3. Install git 
4. Attach IAM role
5. Install Docker
6. Install AWS CLI and kubectl
7. Configure access to EKS cluster
8. Install Blue Ocean plugin
IAM Roles and Permissions
For this setup, IAM roles were configured with broad permissions to avoid access issues during cluster creation and deployment.
The following policies were attached:
* IAMFullAccess
* AmazonEC2FullAccess
* AmazonVPCFullAccess
* AdministratorAccess
* AmazonEKSWorkerNodePolicy
* AmazonEKSServicePolicy
* AmazonEKSClusterPolicy
* AWSCloudFormationFullAccess
These permissions allow the EC2 instances (EKS host and Jenkins server) to interact with AWS services such as EKS, EC2, IAM, VPC, and CloudFormation without restriction.
Note: In a production environment, it is recommended to follow the principle of least privilege and assign only the required permissions.
Kubernetes Configuration (Important)
To allow Jenkins to interact with the EKS cluster:
On EKS Host Machine:

cat ~/.kube/config

Copy the output.
On Jenkins Server:

sudo mkdir -p /var/lib/jenkins/.kube
sudo chown jenkins:jenkins /var/lib/jenkins/.kube


sudo vi /var/lib/jenkins/.kube/config

Paste the copied content, then run:

sudo chown jenkins:jenkins /var/lib/jenkins/.kube/config
sudo chmod 600 /var/lib/jenkins/.kube/config

Implementation Approach
Two approaches can be used:
1. Hardcoded Pipeline Dockerfile and Kubernetes manifests are defined inside the Jenkins pipeline (used for learning/demo).
2. Repository-Based Pipeline (Recommended) Dockerfile and Kubernetes manifests are stored in the Git repository for better maintainability.
Key Learnings
* Building a complete CI/CD pipeline from scratch
* Integrating Jenkins with Docker and Kubernetes
* Managing deployments on EKS
* Handling IAM roles and permissions
* Configuring Kubernetes access for Jenkins
Challenges Faced
* IAM permission issues
* Jenkins and Docker integration
* Kubernetes configuration setup on Jenkins
* Managing multiple tools across different VMs
Conclusion
This project provides a practical understanding of how CI/CD pipelines work in real-world environments by combining automation, containerization, and orchestration.

