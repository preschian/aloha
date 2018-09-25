FROM node:8
WORKDIR /app
COPY package.json ./
RUN yarn install
COPY . .
EXPOSE 3000
