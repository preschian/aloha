FROM cypress/base:10 as TEST
WORKDIR /app

COPY . .

ENV CI=1
RUN npm ci

RUN npx cypress verify
# RUN npm run build

ARG HOSTNAME=1
# RUN npm run test

# FROM busybox as PROD
# COPY --from=TEST /app/public /public
RUN npm run start
