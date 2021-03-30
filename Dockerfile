FROM bazhyk/todoappjenkins:latest
WORKDIR /app
COPY package* yarn.lock ./
CMD ["node", "/app/src/index.js"]
