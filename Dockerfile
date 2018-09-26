FROM cypress/base:10 as TEST
WORKDIR /app

COPY package.json .
COPY package-lock.json .

ENV CI=1
RUN npm ci

RUN npx cypress verify

COPY cypress cypress
COPY cypress.json .

RUN npm run build
COPY public public

ARG HOSTNAME=1
RUN npm run test

FROM busybox as PROD
COPY --from=TEST /app/public /public
