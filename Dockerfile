FROM nginx:1.13-alpine

EXPOSE 80

COPY conf.d /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf
