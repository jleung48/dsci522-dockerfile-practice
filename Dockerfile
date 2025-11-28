FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-lock.yml /tmp/conda-lock.yml

RUN mamba install --yes --channel=conda-forge conda-lock && \
    conda-lock install --name base /tmp/conda-lock.yml && \
    mamba clean --all -y --force-pkgs-dirs