# Terraform Helm Chart Deployment

This repository contains Terraform code for deploying ArgoCD and Argo Rollouts using Helm charts within a Kubernetes cluster. The Helm releases are configured to be deployed in the `argocd` namespace.

## Prerequisites

- Terraform installed on your machine.
- Access to a Kubernetes cluster.
- `kubectl` configured to interact with your Kubernetes cluster.
- Helm installed on your machine.

## Getting Started

1. **Clone the Repository**:
   Clone this repository to your local machine.

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Configure Kubernetes Context**:
   Ensure your Kubernetes configuration is set up correctly. The configuration file is expected to be located at `~/.kube/sof-lab03`.

3. **Set Up Terraform Backend**:
   The Terraform state file will be stored locally at `/Users/dimitar.dimitrov/devops/telerik/terraform.tfstate`. Ensure that this path is accessible.

4. **Required Values Files**:
   Make sure that the following values files are present in the `values` directory:
   - `argocd.yaml`
   - `argo-rollouts.yaml`

5. **Initialize Terraform**:
   Run the following command to initialize Terraform, which will download the necessary providers:

   ```bash
   terraform init
   ```

6. **Plan the Deployment**:
   Generate an execution plan to review the resources that will be created:

   ```bash
   terraform plan
   ```

7. **Apply the Configuration**:
   Apply the Terraform configuration to deploy the Helm charts:

   ```bash
   terraform apply
   ```

   Confirm the action when prompted.

## Resources

### Helm Releases

- **ArgoCD**:
  - **Name**: `argo-cd-7-1734333419`
  - **Chart**: `argo-cd`
  - **Version**: `7.7.15`
  - **Repository**: [Helm Repository](http://slo-it-nexus01.pt.playtech.corp/repository/helm-argocd)

- **Argo Rollouts**:
  - **Name**: `argo-rollouts`
  - **Chart**: `argo-rollouts`
  - **Version**: `2.38.2`
  - **Repository**: [Helm Repository](http://slo-it-nexus01.pt.playtech.corp/repository/helm-argocd)

### Kubernetes Namespace

- **Namespace**: `sof-app01`
- This namespace will be created for your application resources.

## Providers

- **Helm**:
  - Configured to use the Kubernetes config located at `~/.kube/sof-lab03`.

- **Kubernetes**:
  - Configured to use the Kubernetes config located at `~/.kube/sof-lab03` with the context `sof-lab03`.

## Cleanup

To remove the deployed resources, you can run:

```bash
terraform destroy
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
