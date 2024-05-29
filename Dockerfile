FROM node:lts AS BUILD_IMAGE

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:lts-alpine

WORKDIR /app

COPY --from=BUILD_IMAGE /app/public ./public
COPY --from=BUILD_IMAGE /app/configs ./configs
COPY --from=BUILD_IMAGE /app/package*.json ./
COPY --from=BUILD_IMAGE /app/dist ./dist
COPY --from=BUILD_IMAGE /app/node_modules ./node_modules

EXPOSE 8000

CMD ["npm", "start"]