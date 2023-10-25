FROM ubuntu:22.10

ARG PYTHON_VERSION  

RUN sudo apt-get update \
    sudo apt-get  upgrade \
    sudo apt get install python -y python=3.10.13

ENTRYPOINT [ "pip", "--version" ]
