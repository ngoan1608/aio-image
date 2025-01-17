FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3.9 \
    python3.9-venv \
    python3.9-distutils \
    python3-pip \
    bash \
    && apt-get clean

COPY linux_requirements.txt /tmp/linux_requirements.txt
COPY requirements.txt /tmp/requirements.txt

RUN xargs -a /tmp/linux_requirements.txt apt-get install -y

RUN pip3 install --upgrade pip && pip3 install -r /tmp/requirements.txt

COPY scripts/ /usr/bin/
RUN chmod +x /usr/bin/*

CMD ["bash"]

