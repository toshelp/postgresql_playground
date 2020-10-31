FROM ubuntu:bionic
MAINTAINER toshelp

RUN apt-get update && apt-get install -y git vim wget build-essential gawk bison libreadline-dev zlib1g-dev sudo

ARG POSTGRES_UID=1000
ARG POSTGRES_USER=postgres
ARG POSTGRES_PASSWORD=postgres
RUN useradd -m -d /home/postgres --uid ${POSTGRES_UID} --groups sudo ${POSTGRES_USER} && echo ${POSTGRES_USER}:${POSTGRES_PASSWORD} | chpasswd
USER ${POSTGRES_UID}

WORKDIR /home/postgres
RUN wget https://ftp.postgresql.org/pub/source/v13.0/postgresql-13.0.tar.bz2
RUN tar jxf postgresql-13.0.tar.bz2 && rm postgresql-13.0.tar.bz2

EXPOSE 5432
