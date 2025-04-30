FROM oven/bun:1

WORKDIR /usr/src/app 

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
COPY ./packages ./packages
COPY ./bun.lock ./bun.lock
COPY ./apps/websocket ./apps/websocket
COPY ./turbo.json ./turbo.json
RUN bun install 
RUN apt-get update && apt-get install -y openssl





RUN bun run generate:db


EXPOSE 8081
CMD [ "bun","run","start:ws" ]