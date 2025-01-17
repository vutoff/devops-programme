# GitHub Actions Demo

This repository demonstrates a CI/CD pipeline using GitHub Actions. The workflow includes code quality checks, unit testing, security scans, and deployment processes to Docker Hub and ArgoCD.

## Overview

The GitHub Actions workflow is triggered on pushes to the `main` and `dimitardd-281024` branches, excluding changes in the `deployment/`, `terraform/`, and `rollout/` directories. It performs the following tasks:

1. **Code Analysis**: Checks code quality using tools like Pylint, Black, Flake8, and Markdownlint.
2. **Unit Testing**: Runs unit tests for the application.
3. **Secret Scanning**: Scans the codebase for sensitive information.
4. **Security Scanning**: Uses Trivy to scan for vulnerabilities in the application and Docker images.
5. **Deployment**: Builds Docker images, pushes them to Docker Hub, and updates the ArgoCD deployment.

## Prerequisites

- A GitHub repository where you can add this workflow.
- Docker Hub account for pushing container images.
- Secrets set up in GitHub repository settings:
  - `GITHUB_TOKEN`
  - `SONAR_TOKEN`
  - `DOCKERHUB_USERNAME`
  - `DOCKERHUB_TOKEN`
  - `GIT_TOKEN`
