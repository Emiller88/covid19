FROM nfcore/base:1.9
LABEL authors="Michael L Heuer, Jordan Wilheim, Maxime Garcia, Alexander Peltzer." \
      description="Docker image containing all software requirements for the nf-core/covid19 pipeline"

# Install the conda environment
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-covid19-1.0dev/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-covid19-1.0dev > nf-core-covid19-1.0dev.yml
