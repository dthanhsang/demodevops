FROM node:20-alpine

WORKDIR /app

ENV HOME=/root
ENV NPM_CONFIG_CACHE=/root/.npm

RUN mkdir -p /root/.npm

COPY package*.json ./

RUN npm install --omit=dev --no-audit --no-fund --loglevel=error

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]