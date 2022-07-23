FROM ubuntu:22.04

ARG USERNAME
ARG USER_GROUP_NAME
ARG USER_UID
ARG USER_GID
ARG TMP_PKG

ENV PKG="git vim curl ${TMP_PKG}"

RUN apt-get update \
    && apt-get install -y ${PKG} \
    && groupadd --gid ${USER_GID} ${USER_GROUP_NAME} \
    && useradd --uid ${USER_UID} --shell /bin/bash --gid ${USER_GID} -m ${USERNAME} \
    && apt-get install -y sudo \
    && echo %${USER_GROUP_NAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER_GROUP_NAME} \
    && chmod 0440 /etc/sudoers.d/${USER_GROUP_NAME} \
