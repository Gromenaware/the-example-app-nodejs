FROM node:alpine

WORKDIR /app

RUN npm install -g contentful-cli

COPY package.json .
RUN npm install

RUN npm run test:unit
RUN npm run test:integration

COPY . .

USER node
EXPOSE 3000

CMD ["npm", "run", "start:dev"]
