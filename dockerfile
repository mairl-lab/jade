FROM nginx:1.23-alpine

RUN apk update && apk add --no-cache git

# Clone repo and copy ALL static assets
RUN git clone https://github.com/mairl-lab/jade.git /tmp/jade && \
    cp -r /tmp/jade/* /usr/share/nginx/html/

# Remove default config and use custom configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
