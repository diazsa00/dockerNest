
# Proyecto Nest.js en Docker

Este proyecto es una configuración de un entorno de producción para una aplicación Nest.js utilizando Docker y Docker Compose. El Dockerfile genera la imagen de la aplicación y docker-compose.yml facilita su despliegue y ejecución en contenedores. Además, la estructura del proyecto permite el uso de volúmenes para desarrollo.

## Estructura del Proyecto

```
project-root/
├── docker-compose.yml
├── Dockerfile
└── project-name/
    ├── src/
    ├── package.json
    ├── tsconfig.json
    └── ...
```

## Requisitos Previos

- Docker
- Docker Compose

## Configuración

### Dockerfile

El Dockerfile utiliza una imagen base de Node.js para compilar y ejecutar el proyecto en un entorno de producción. Este archivo realiza los siguientes pasos:

1. Copia los archivos `package.json` y `package-lock.json` al contenedor.
2. Instala las dependencias del proyecto.
3. Copia el código fuente al contenedor.
4. Compila la aplicación Nest.js (si usas TypeScript).
5. Define el comando de inicio para ejecutar la aplicación en modo producción.

### docker-compose.yml

El archivo `docker-compose.yml` configura y ejecuta el contenedor en producción. Mapea el puerto 3000 del contenedor al host y define variables de entorno para el modo de producción.

## Uso de Volúmenes

Para detectar cambios en el código fuente mientras el contenedor está en ejecución (útil para desarrollo), se puede configurar un volumen. Esto permite que cualquier cambio en el código fuente se refleje en el contenedor sin necesidad de reconstruir la imagen.

## Comandos de Uso

### 1. Construir e Iniciar el Contenedor

Para construir la imagen y ejecutar el contenedor en modo de producción, ejecuta:

```
docker-compose up --build -d
```

Esto construirá la imagen de Docker, instalará las dependencias y compilará el código fuente en el contenedor. El contenedor estará en ejecución en segundo plano (modo detach).

### 2. Detener y Eliminar Contenedores, Imágenes y Volúmenes

Para detener y limpiar los contenedores e imágenes creadas:

```
docker-compose down
```

Para limpiar también volúmenes creados:

```
docker-compose down -v
```

Esto usará el archivo `override` para el entorno de desarrollo.

## Acceso a la Aplicación

Una vez que el contenedor esté en ejecución, la aplicación estará disponible en [http://localhost:3000](http://localhost:3000).
