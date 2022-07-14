ARG GITPOD_IMAGE=gitpod/workspace-full:latest
FROM ${GITPOD_IMAGE}

ARG KUBECTL_VERSION=v1.22.2

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    mkdir ~/.kube

# helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

# civo cli
RUN wget https://github.com/civo/cli/releases/download/v1.0.28/civo-1.0.28-linux-amd64.tar.gz && \
    tar -xvf civo-1.0.28-linux-amd64.tar.gz && \
    chmod +x civo && \
    sudo mv ./civo /usr/local/bin/

# yq
RUN wget https://github.com/mikefarah/yq/releases/download/v4.25.2/yq_linux_amd64 -O yq && \
    chmod +x yq && \
    sudo mv ./yq /usr/local/bin/

# pulumi
RUN curl -fsSL https://get.pulumi.com | sh && \
    echo 'export PATH=$PATH:$HOME/.pulumi/bin' >> /home/gitpod/.bashrc

RUN echo 'alias k="kubectl"' >> /home/gitpod/.bashrc && \