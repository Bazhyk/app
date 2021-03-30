FROM bazhyk/todoappjenkins:latest
WORKDIR /app
COPY package* yarn.lock ./
COPY src ./src
CMD ["node", "/app/src/index.js"]
