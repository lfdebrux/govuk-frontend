FROM node:10.15.1

RUN mkdir -p /src && chown -R node:node /src

USER node
WORKDIR /src

COPY package.json package-lock.json ./
COPY .nvmrc ./
COPY bin/ ./bin/

RUN npm ci

COPY --chown=node:node . ./

EXPOSE 3000
EXPOSE 8888

CMD node app/start.js
