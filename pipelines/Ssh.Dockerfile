ARG BASE
FROM ${BASE} AS base

FROM alpine:3.10.3 AS final

RUN apk add openssh

WORKDIR /src

COPY --from=base /src/pipelines/* ./

COPY ssh/* ./

RUN chmod 500 /src/*
RUN chmod 700 *.sh