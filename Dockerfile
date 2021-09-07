FROM node:16.8.0-alpine3.14
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build
# 
FROM node:16.8.0-alpine3.14
WORKDIR /app
VOLUME ["/app/data"]
EXPOSE 50013
COPY package.json  ./
COPY ./db /app/db
COPY ./server /app/server
RUN yarn --prod
RUN yarn cache clean
COPY --from=0 /app/dist /app/dist
ENTRYPOINT ["node", "server/server.js"]
