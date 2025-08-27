FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential cmake libboost-dev libczmq-dev libxml2-dev libzmq5-dev pkg-config \
    python3 python3-dev python3-pip python3-venv \
    curl ca-certificates git sudo unzip tmux supervisor \
    && rm -rf /var/lib/apt/lists/*

# Desktop + VNC + noVNC + Wireshark (GUI capture)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 xfce4-goodies \
    tightvncserver novnc websockify \
    xauth dbus-x11 \
    wireshark wireshark-qt \
  && rm -rf /var/lib/apt/lists/* \
  && setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap || true

ARG GO_VERSION=1.22.5
RUN curl -fsSL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz -o /tmp/go.tgz \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/go.tgz \
    && ln -s /usr/local/go/bin/go /usr/local/bin/go \
    && rm /tmp/go.tgz

ENV PATH="/usr/local/go/bin:${PATH}"
WORKDIR /workspaces
