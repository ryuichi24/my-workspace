FROM ubuntu:22.04

ARG USERNAME
ARG USER_GROUP_NAME
ARG USER_UID
ARG USER_GID
ARG TMP_PKG
ARG HOME="/home/${USERNAME}"

ENV PKG="git vim curl locales ${TMP_PKG}"


RUN apt-get update \
    && apt-get install -y ${PKG} \
    && groupadd --gid ${USER_GID} ${USER_GROUP_NAME} \
    && useradd --uid ${USER_UID} --shell /bin/bash --gid ${USER_GID} -m ${USERNAME} \
    && apt-get install -y sudo \
    && echo %${USER_GROUP_NAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER_GROUP_NAME} \
    && chmod 0440 /etc/sudoers.d/${USER_GROUP_NAME}

# setup locale https://stackoverflow.com/a/55077451/13723015
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "LANG=en_US.UTF-8" > /etc/locale.conf \
    && locale-gen en_US.UTF-8

# install pyenv https://github.com/pyenv/pyenv#installation
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv \
    && echo 'export PYENV_ROOT="~/.pyenv"' >> ${HOME}/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ${HOME}/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> ${HOME}/.bashrc \
    && echo 'export PYENV_ROOT="~/.pyenv"' >> ${HOME}/.profile \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ${HOME}/.profile \
    && echo 'eval "$(pyenv init -)"' >> ${HOME}/.profile

