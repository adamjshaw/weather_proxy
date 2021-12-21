FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf.template

COPY ./backend-not-found.html /var/www/html/backend-not-found.html

COPY ./includes/ /etc/nginx/includes/

COPY ./ssl/ /etc/ssl/certs/nginx/
CMD ["/bin/bash","-c","envsubst '$${WEATHER_API_KEY}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
