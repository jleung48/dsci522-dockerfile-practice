# use the miniforge base, make sure you specify a verion
FROM condaforge/miniforge3:25.9.1-0

# copy the lockfile into the container
COPY conda-lock.yml conda-lock.yml

# setup conda-lock
RUN conda install -n base -c conda-forge conda-lock -y

# install packages from lockfile into dockerlock environment
RUN conda-lock install -n dockerlock conda-lock.yml && \
    conda clean --all -y

ENV PATH="/opt/conda/envs/dockerlock/bin:$PATH"

# expose JupyterLab port
EXPOSE 8888

# sets the default working directory
# this is also specified in the compose file
WORKDIR /workplace

# run JupyterLab on container start
# uses the jupyterlab from the install environment
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--IdentityProvider.token=''", "--ServerApp.password=''"]