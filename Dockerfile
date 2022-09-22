FROM node:alpine

WORKDIR /app

RUN npm install -g contentful-cli

COPY package.json .
RUN npm install

RUN npm test:unit
RUN npm test:integration

COPY . .

USER node
EXPOSE 3000

CMD ["npm", "run", "start:dev"]
