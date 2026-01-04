FROM node:22-alpine

RUN mkdir -p /app && chown -R node:node /app

WORKDIR /app

COPY package*.json ./

USER node

RUN npm i

COPY --chown=node:node . .

RUN npm run build

RUN rm -rf src

EXPOSE 8080

CMD [ "npm", "start" ]
