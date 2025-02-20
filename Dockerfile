# Base Image

FROM node:18-alpine AS builder

LABEL Owner=Amar

WORKDIR /app

COPY . .

#RUN addgroup -S appgroup && adduser -S appuser -G appgroup && chown -R appuser:appgroup /app

USER root

RUN npm install && npm run build

VOLUME ["/app/logs"]
RUN chmod -R 766 /app/logs

HEALTHCHECK --interval=10s --timeout=1m --retries=3 \
        CMD sh /app/health_check.sh  || exit 1 

EXPOSE 3000

ENTRYPOINT ["npm","run","dev","--","--port","3000","--host","0.0.0.0"]
