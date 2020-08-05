FROM jgomezdans/uclgeog

LABEL maintainer="Philip Lewis <p.lewis@ucl.ac.uk>"

USER root

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*
 
USER $NB_USER

RUN git clone https://github.com/profLewis/geog0111-core.git
COPY notebooks/???_*.ipynb notebooks/
COPY notebooks/docs/* notebooks/docs/
COPY notebooks/images/* notebooks/images/
RUN mkdir -p notebooks/oneDrive

WORKDIR $HOME/geog0111-core/notebooks

# update conda packages
RUN conda update -n uclgeog --all --yes 
    
EXPOSE 8888

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["start-notebook.sh"]

RUN jupyter nbextension disable execute_time/ExecuteTime 


