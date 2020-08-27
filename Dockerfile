FROM tiangolo/uwsgi-nginx-flask:python3.7
LABEL maintainer="teng.fu@teleware.com"


#Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && pip install --upgrade pip \
    && pip install ktrain 

WORKDIR /tmp

# download model script
COPY download_models.py .
RUN python download_models.py

# check models
RUN ls -lha  ~/.cache/torch/transformers