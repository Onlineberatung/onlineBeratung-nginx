FROM nginx:1.23.3-alpine

# Remove sym links from nginx image
RUN rm /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log

# Install logrotate
RUN apk update && apk add logrotate vim

COPY crontab /etc/crontab
COPY nginx-logrotate /etc/logrotate.d/nginx

# Start nginx and cron as a service
CMD crond -b && nginx -g 'daemon off;'
