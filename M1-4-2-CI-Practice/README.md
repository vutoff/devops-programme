# GitHub Actions Practice

## Task description

Create a GitHub Actions pipeline that runs on commit to a feature branch (i.e. not `main`) and performs the following checks on our simple Flask app.

- Check `.editorconfig`
- Code Lint and style - use `pylint` and `black` to check for style/formatting/syntax errors
- Code Unittest - there's a simple unit test next to our app called `app_test.py`. Make sure our unittest passes (`python -m unittest` executed in the app directory)
- Check for hardcoded secrets (`gitleaks`) - not just our app but the whole repository.
- SAST - SonarCloud; Review code smells and security issues
- SCA - Snyk; review security issues
- Build a Docker image
- Scan the built image with `Trivy`
- Push the built image to your Docker HUB account

:warning: Make sure that you run as many tests in parallel as you see fit

:warning: Make sure you don't push your image to Docker HUB if Critical vulnerabilities are found

:warning: Try and use ready-made GH Actions. Avoid shell-out if possible

:exclamation: At the end open a PR with your solution.

