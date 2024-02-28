FROM python:3.10

WORKDIR /workspace

COPY ./requirements.txt /workspace

RUN apt-get update && \
    apt-get install build-essential vim sudo -y --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/\* /tmp/\* /var/tmp/* && \
    pip3 install -r requirements.txt

CMD ["/bin/bash"]