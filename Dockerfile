# Etapa de construcción
FROM node:18 AS builder

# Configuración del directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios
COPY package.json package-lock.json* ./

# Instalar dependencias
RUN npm install

# Copiar el código fuente
COPY . .

# Construir la aplicación
RUN npm run build

# Etapa de producción
FROM nginx:alpine

# Copiar los archivos de la build al contenedor de producción
COPY --from=builder /app/dist /usr/share/nginx/html

RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

COPY ssl/certificate.crt /etc/nginx/ssl/certificate.crt
COPY ssl/private.key /etc/nginx/ssl/private.key

# Comando por defecto para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
