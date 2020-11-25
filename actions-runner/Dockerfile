# https://github.com/summerwind/actions-runner-controller/blob/master/runner/Dockerfile

ARG VERSION

FROM summerwind/actions-runner:v${VERSION}

ARG TARGETPLATFORM

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive \
  DEBCONF_NONINTERACTIVE_SEEN=true

# Install apt packages
RUN sudo apt-get update -qqy \
  && sudo apt-get upgrade -qqy \
  && sudo apt-get install -qqy --no-install-recommends \
    git-crypt gettext-base \
  && sudo rm -rf /var/lib/apt/lists/*

# Install latest kubectl
RUN sudo curl -sLO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && sudo mv kubectl /usr/local/bin/kubectl \
  && sudo chmod +x /usr/local/bin/kubectl \
  && kubectl version --client 
  
# Install latest helm3
RUN sudo curl -sL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sudo bash \
  && helm version 

# Install latest kubeseal
RUN KUBESEAL_VERSION=$(curl -s "https://api.github.com/repos/bitnami-labs/sealed-secrets/releases" | jq --raw-output '.[0].tag_name') \
  && KUBESEAL_VERSION=${KUBESEAL_VERSION:1} \
  && sudo curl -sL -o /usr/local/bin/kubeseal https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-linux-amd64 \
  && sudo chmod +x /usr/local/bin/kubeseal \
  && kubeseal --version

# Install latest fluxctl
RUN FLUXCTL_VERSION=$(curl -s "https://api.github.com/repos/fluxcd/flux/releases" | jq --raw-output '.[0].tag_name') \
  && FLUXCTL_VERSION=${FLUXCTL_VERSION} \
  && sudo curl -sL -o /usr/local/bin/fluxctl https://github.com/fluxcd/flux/releases/download/${FLUXCTL_VERSION}/fluxctl_linux_amd64 \
  && sudo chmod +x /usr/local/bin/fluxctl \
  && fluxctl version

# Install latest gomplate
RUN GOMPLATE_VERSION=$(curl -s "https://api.github.com/repos/hairyhenderson/gomplate/releases" | jq --raw-output '.[0].tag_name') \
  && GOMPLATE_VERSION=${GOMPLATE_VERSION:1} \
  && sudo curl -o /usr/local/bin/gomplate -sSL https://github.com/hairyhenderson/gomplate/releases/download/v${GOMPLATE_VERSION}/gomplate_linux-amd64 \
  && sudo chmod +x /usr/local/bin/gomplate \
  && gomplate -v

# Install latest yq
RUN sudo curl -sL -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
  && sudo chmod +x /usr/local/bin/yq \
  && yq --version

# Install latest task
RUN sudo curl -sL https://taskfile.dev/install.sh | sudo sh \
  && sudo mv ./bin/task /usr/local/bin/task \
  && sudo chmod +x /usr/local/bin/task \
  && task --version

# Install latest flux
RUN FLUX_VERSION=$(curl -s "https://api.github.com/repos/fluxcd/flux2/releases" | jq --raw-output '.[0].tag_name') \
  && FLUX_VERSION=${FLUX_VERSION:1} \
  && sudo curl -o flux.tar.gz -sSL https://github.com/fluxcd/flux2/releases/download/v${FLUX_VERSION}/flux_${FLUX_VERSION}_linux_amd64.tar.gz \
  && sudo tar xf flux.tar.gz -C /usr/local/bin flux \
  && sudo rm -rf flux.tar.gz \
  && sudo chmod +x /usr/local/bin/flux \
  && sudo chown root:root /usr/local/bin/flux \
  && ls -la /usr/local/bin \
  && flux --version
