FROM openresty/openresty:alpine

EXPOSE 80

RUN mkdir -p /app/logs

COPY conf.d /etc/nginx/conf.d
COPY src/ /app
COPY nginx.conf /nginx.conf

CMD ["openresty", "-g", "daemon off;", "-p", "/app", "-c", "/nginx.conf"]
