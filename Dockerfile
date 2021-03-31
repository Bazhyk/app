FROM node:12-alpine
WORKDIR /app
COPY package* yarn.lock ./
COPY src ./src
CMD ["node", "/app/src/index.js"]
