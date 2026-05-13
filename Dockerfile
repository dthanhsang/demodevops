
FROM node:16-alpine


RUN apk add --no-cache curl


WORKDIR /app


COPY public/ ./public/

RUN npm install -g serve

ARG CLOUDFLARED_VERSION=2024.4.0
RUN curl -L -o cloudflared.tar.gz \
    https://github.com/cloudflare/cloudflared/releases/download/${CLOUDFLARED_VERSION}/cloudflared-linux-amd64.tar.gz && \
    tar -xzf cloudflared.tar.gz && \
    mv cloudflared /usr/local/bin/ && \
    chmod +x /usr/local/bin/cloudflared && \
    rm cloudflared.tar.gz


EXPOSE 8000


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
