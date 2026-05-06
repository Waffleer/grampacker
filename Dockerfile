FROM node:16-buster-slim

WORKDIR /var/www/grampacker

COPY . .

RUN npm install

EXPOSE 8080/tcp

CMD ["nodejs", "app.js"]
