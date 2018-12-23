FROM node:6-alpine

RUN apk add --update tini \
    && mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN npm install \
    && npm cache clean --force 

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "./bin/www" ]

