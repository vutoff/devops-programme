#devops-programme
#GitHub Actions Demo

This repository demonstrates a CI/CD pipeline using GitHub Actions. The actions defined in this workflow cover code quality checks, testing, security scanning, and deploying a Docker container to Docker Hub.

## Workflow Overview

The pipeline consists of several jobs that are executed in sequence based on dependencies. The jobs include:

1. **Pylint**: Checks the code quality using Pylint, MarkdownLint, and EditorConfig.
2. **UnitTest**: Runs unit tests using Python's `unittest` framework.
3. **CheckforSecrets**: Scans the repository for potential sensitive information using Gitleaks.
4. **TrivySecurity**: Performs a vulnerability scan on the repository using Trivy.
5. **SonarcloudSecurity**: Conducts a code quality and security analysis through SonarCloud.
6. **Build-Test**: Builds a Docker image and runs a vulnerability scan on it.
7. **Deploy**: Pushes the Docker image to Docker Hub.

## Workflow Trigger

This workflow is triggered on every `push` event to the repository.

## Environment Variables

- `IMAGE_TAG`: The Docker image tag to be used for building the application.

## Job Details

### Pylint

- **Runs on**: `ubuntu-latest`
- **Steps**:
  - Check out the repository.
  - Set up Node.js and Python environments.
  - Install necessary dependencies (Pylint, Black, Flake8, Flask, MarkdownLint).
  - Check for EditorConfig compliance.
  - Analyze Python code with Pylint.
  - Configure and run MarkdownLint.

### UnitTest

- **Needs**: `Pylint`
- **Runs on**: `ubuntu-latest`
- **Steps**:
  - Check out the repository.
  - Set up the Python environment.
  - Install Flask.
  - Run unit tests located in the `app` directory.

### CheckforSecrets

- **Needs**: `UnitTest`
- **Runs on**: `ubuntu-latest`
- **Steps**:
  - Check out the repository.
  - Perform a Gitleaks scan to identify potential secrets in the codebase.

### TrivySecurity

- **Needs**: `UnitTest`
- **Runs on**: `ubuntu-latest`
- **Steps**:
  - Check out the repository.
  - Run a Trivy vulnerability scan and output results in SARIF format.
  - Upload the Trivy scan results to the GitHub Security tab.

### SonarcloudSecurity

- **Needs**: `UnitTest`
- **Runs on**: `ubuntu-latest`
- **Steps**:
  - Check out the repository.
  - Run a SonarCloud analysis with the specified project key and organization.

### Build-Test

- **Needs**: `[ SonarcloudSecurity, TrivySecurity, CheckforSecrets ]`
- **Runs on**: `ubuntu-latest`
- **Steps**:
  - Check out the code.
  - Build a Docker image from the Dockerfile.
  - Run a Trivy vulnerability scan on the built Docker image.
  - Upload the Trivy scan results to the GitHub Security tab.

### Deploy

- **Needs**: `[ Build-Test ]`
- **Runs on**: `ubuntu-latest`
- **Steps**:
  - Log in to Docker Hub using credentials stored in GitHub Secrets.
  - Push the Docker image to Docker Hub.

## Requirements

- Ensure that you set up the necessary GitHub Secrets:
  - `DOCKERHUB_USERNAME`: Your Docker Hub username.
  - `DOCKERHUB_TOKEN`: Your Docker Hub access token.
  - `SONAR_TOKEN`: Your SonarCloud token.
