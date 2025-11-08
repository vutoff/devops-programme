# FIRST SORRY FOR MAKING THIS PULL REQUESTS WITH DELAY, BUT I WAS SICK.
# Ansible Playbook --- Build & Run Python App (Docker)

This playbook builds a Docker image for the Python application, removes
any running containers that use the configured host port, and starts the
container with the PORT environment variable that the app requires.

The playbook uses **Ansible modules only** (`community.docker`) and is
**fully idempotent**.

## What the playbook does

1.  **Builds** the Docker image using your local `Dockerfile`.\
2.  **Finds and removes** any container currently using the configured
    host port.\
3.  **Removes** the previous `python-app` container if present
    (idempotent).\
4.  **Runs** the container with:
    -   the correct environment variable (`PORT`)\
    -   port mapping (`host_port:listen_port`)\
    -   `restart_policy: unless-stopped`

## Requirements

-   Python ≥ 3.8\
-   Docker installed and running\
-   Ansible installed\
-   The `community.docker` collection installed

Install dependencies:

    pip install -r requirements.txt
    ansible-galaxy collection install community.docker

## Variables

  -------------------------------------------------------------------------------------
  Variable        Description                                    Default
  --------------- ---------------------------------------------- ----------------------
  `image_name`    The Docker image name (no tag).                `cyrixrr/python-app`

  `image_tag`     The tag for the Docker image.                  `v2`

  `listen_port`   The internal port that the Python app listens  `8000`
                  on.                                            

  `host_port`     The port on the host that will be published    `{{ listen_port }}`
                  and checked for conflicts.                     
  -------------------------------------------------------------------------------------

You can override them when running the playbook:

    ansible-playbook playbook.yml -e image_tag=v3
    ansible-playbook playbook.yml -e host_port=8001

##  How to run

From the project root:

    ansible-playbook playbook.yml

Test the application:

    curl http://localhost:8000/

## Idempotency

This playbook is **fully idempotent**:

-   If no container uses the configured host port, nothing is removed.\
-   If the image has not changed, it will not rebuild.\
-   If the `python-app` container is already running with the correct
    settings, no changes occur.\
-   If a different container is occupying the selected host port, it
    will be removed automatically.

## Troubleshooting

### Port already in use

This playbook automatically removes Docker containers that use
`host_port`.

If a **non-Docker** process is using the port:

    sudo lsof -i :8000 -nP
    sudo kill -9 <PID>

### Environment variable must be a string

`PORT` must be passed as a string:

    PORT: "{{ listen_port | string }}"

## Summary

This playbook demonstrates: - Use of Ansible variables\
- Docker image building via `docker_image`\
- Running containers via `docker_container`\
- Idempotent cleanup logic\
- Environment variable injection\
- Port mapping and collision handling