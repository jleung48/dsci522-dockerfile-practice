# 1. Extend the specific image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# 2. Copy the explicit lock file (Note the filename change)
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# 3. Install directly using conda create/install
#    This reads the URL list directly.
RUN mamba create --name base --file /tmp/conda-linux-64.lock && \
    mamba clean --all -y --force-pkgs-dirs