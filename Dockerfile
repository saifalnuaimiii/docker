
FROM node:alpine as bulider
WORKDIR /app
#install npm
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx 
COPY --from=bulider /app/build /usr/share/nginx/html
