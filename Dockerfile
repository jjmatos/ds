FROM node:22-alpine

WORKDIR /app

RUN npm ci
RUN npm run build

EXPOSE 3000

CMD ["node", "scripts/serve.mjs", "3000"]
