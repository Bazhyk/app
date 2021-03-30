FROM bazhyk/todoappjenkins:latest
WORKDIR /app
COPY package* yran.lock ./
CMD ["node", "/app/src/index.js"]
