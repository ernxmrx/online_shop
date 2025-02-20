# Base Image

FROM node:22-alpine 
#As source

WORKDIR /app

COPY . .

RUN npm install -g npm@11.1.0 

#--target /app/debs


EXPOSE 3000

CMD ["node","main.jsx"]
