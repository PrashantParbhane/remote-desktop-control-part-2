FROM node:16.8.0-alpine
ENV SERVER_HOME=/usr/src/server/
WORKDIR $SERVER_HOME
COPY ./package*.json $SERVER_HOME
RUN npm install -g npm
RUN apk add --update python3 make g++ && rm -rf /var/cache/apk/*
RUN npm install
COPY . $SERVER_HOME
#EXPOSE 5000
CMD npm run build
CMD npm run start