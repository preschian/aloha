FROM cypress/base:10 as TEST
WORKDIR /app

COPY package.json package-lock.json cypress.json ./

ENV CI=1
RUN npm ci

RUN npx cypress verify

COPY cypress cypress

COPY . .
RUN npm run build

ARG HOSTNAME=1
RUN npm run test

FROM busybox as PROD
COPY --from=TEST /app/public /public
