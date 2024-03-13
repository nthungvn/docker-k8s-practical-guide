FROM node:14-alpine

WORKDIR /app

COPY ./src/package.json .

RUN npm install

COPY ./src/ .

EXPOSE 8080

CMD ["node", "app.js"]
