FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-lock.yml /tmp/conda-lock.yml

RUN mamba install --yes --channel=conda-forge conda-lock && \
    conda-lock install --name my_env /tmp/conda-lock.yml && \
    mamba clean --all -y --force-pkgs-dirs && \
    /opt/conda/envs/my_env/bin/python -m ipykernel install --user --name=my_env --display-name "Python (My Env)"