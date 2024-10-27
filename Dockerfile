# Usa una imagen base de Node.js para producción
FROM node:18 AS build

# Directorio de trabajo dentro del contenedor
WORKDIR /project-name

# Copia los archivos necesarios para instalar dependencias
COPY project-name/package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el código fuente al contenedor
COPY project-name/ .

# Transpila el proyecto (si usas TypeScript)
RUN npm run build

# Prepara una imagen para producción
FROM node:18 AS production

# Define el directorio de trabajo en la nueva imagen
WORKDIR /project-name

# Copia solo las dependencias de producción y la carpeta compilada
COPY --from=build /project-name/node_modules ./node_modules
COPY --from=build /project-name/dist ./dist
COPY project-name/package*.json ./

# Define el comando de inicio para producción
CMD ["node", "dist/main.js"]