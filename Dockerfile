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
    yarn install --production --frozen-lockfile

FROM base as prod

COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/src/@core/package.json /app/src/@core/package.json
COPY --from=build /app/src/nestjs/dist /app/src/nestjs/dist
COPY --from=build /app/src/@core/dist /app/src/@core/dist
