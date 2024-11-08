ARG BASE

FROM ${BASE} AS base


FROM nginx:1.9.15-alpine AS final

COPY --from=base /src/pipelines/nginx/nginx.conf ./etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html
COPY --from=base /src/dist/ ./

ARG BUILD_NUMBER
RUN echo ${BUILD_NUMBER} > /usr/share/nginx/html/version.txt
