FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock conda-linux-64.lock

RUN mamba create --name base --file /tmp/conda-linux-64.lock && \
    mamba clean --all -y --force-pkgs-dirs