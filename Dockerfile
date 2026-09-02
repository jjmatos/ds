FROM node:22-alpine

RUN apk add --no-cache git

WORKDIR /app

RUN git clone https://github.com/jjmatos/ds.git /tmp/ds
RUN cp -r /tmp/ds/* /app/

# Instalar ignorando scripts nativos problemáticos
RUN npm ci --ignore-scripts || npm install --ignore-scripts

# Construir
RUN npm run build

EXPOSE 4173

CMD ["node", "scripts/serve.mjs", "4173"]
