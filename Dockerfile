FROM node:22-alpine

# Instalar git
RUN apk add --no-cache git

WORKDIR /app

# Clonar el repositorio completo
RUN git clone https://github.com/jjmatos/ds.git /tmp/ds
RUN cp -r /tmp/ds/* /app/

# Instalar dependencias (npm ci ahora funcionará)
RUN npm ci

# Construir los archivos estáticos
RUN npm run build

# Exponer puerto
EXPOSE 3000

# Servir los archivos estáticos
CMD ["node", "scripts/serve.mjs", "3000"]
