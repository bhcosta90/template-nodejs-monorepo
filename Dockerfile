FROM node:18-alpine as base
WORKDIR /app

FROM base as dev
CMD yarn dev

FROM base as build
COPY . .
RUN yarn && \
    npm install -g npm@9.3.1 && \
    npm run build -w @ca/core && \
    npm run build -w nestjs && \
    yarn install --production --frozen-lockfile && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

FROM node:18-alpine as prod
WORKDIR /app

RUN rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

USER node
COPY --chown=node:node --from=build /app/node_modules /app/node_modules
COPY --chown=node:node --from=build /app/src/@core/package.json /app/src/@core/package.json
COPY --chown=node:node --from=build /app/src/nestjs/dist /app/src/nestjs/dist
COPY --chown=node:node --from=build /app/src/@core/dist /app/src/@core/dist

CMD node src/nestjs/dist/main