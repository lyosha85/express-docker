FROM mhart/alpine-node:5.6.0

EXPOSE 3000
WORKDIR /app
ENV NODE_ENV development

ADD package.json /app
RUN npm install

ADD . /app

CMD ["node", "server.js"]
