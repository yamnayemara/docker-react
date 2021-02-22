FROM node:15.9.0-alpine3.10 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm build

FROM nginx
COPY --from=builder app/build /usr/share/nginx/html