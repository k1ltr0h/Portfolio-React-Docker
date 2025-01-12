# Portafolio React con Nginx en Docker

Este proyecto utiliza **React** y **Nginx** en contenedores Docker para entornos de desarrollo y producción.

## Requisitos

* Docker y Docker Compose instalados en tu máquina.
* OpenSSL (para generar certificados autofirmados).

## Estructura del Proyecto

* **Dockerfile**: Contiene la configuración para el contenedor de producción.
* **nginx.conf**: Configuración de Nginx para servir la aplicación React.
* **docker-compose.yml**: Facilita la creación de contenedores para desarrollo y producción.

## Levantar el portafolio

1. Clona el repositorio en tu máquina local.
2. Asegúrate de tener Docker y Docker Compose instalados.
3. Navega al directorio del proyecto.
4. Ejecuta el siguiente comando para levantar el contenedor:

### 1. Desarrollo (Dev)

```bash
  docker-compose -f development.yml up -d --build
  ```

  Luego para levantar la app necesitas entrar al contenedor, para ello primero vemos la ID del contenedor:

  

```bash
  docker ps
  ```

Copiamos los primeros 3 chars de la ID y ejecutamos el siguiente comando:

```bash
  docker exec -it ID-chars bash 
  ```

  Una vez adentro ejecutamos el siguiente comando para correr la app en modo dev:

  

```bash
  npm run dev 
  ```

  ¡Listo! Nuestra app estará disponible en `localhost:3000`

### 2. Producción

```bash
  docker-compose -f production.yml up -d --build
  ```

  Ahora nuestra app estará disponible en `localhost` desde el navegador.

# Crear un Certificado Auto-Firmado

Para habilitar **HTTPS** en tu contenedor, necesitas generar un **certificado SSL auto-firmado**. Esto se puede hacer fácilmente utilizando **OpenSSL** con el siguiente comando.

## Pasos para Crear un Certificado Auto-Firmado

1. Abre tu terminal.
2. Entra al directorio ssl.
3. Ejecuta el siguiente comando para generar el certificado:

   ```bash
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt
