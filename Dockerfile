FROM continuumio/miniconda3:4.9.2

RUN apt-get install -y curl

RUN python3 -m pip install genome-grist
