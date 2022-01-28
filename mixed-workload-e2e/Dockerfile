FROM registry.suse.com/suse/sle15:latest

COPY . /

RUN zypper --non-interactive install curl jq \
    && curl -LO https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/kubectl \
    && cd t \
    && curl -LO https://raw.githubusercontent.com/coryb/osht/master/osht.sh

WORKDIR /
ENTRYPOINT ["sh", "run.sh"]