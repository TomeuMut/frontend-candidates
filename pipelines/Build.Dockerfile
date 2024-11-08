FROM node:16.18-alpine

RUN apk add npm

WORKDIR /src

COPY . ./

RUN npm install

RUN npm run generate

COPY . ./
