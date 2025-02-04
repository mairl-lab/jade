FROM nginx:1.23-alpine

# Install git and clone repository
RUN apk update && apk add --no-cache git && \
    git clone https://github.com/mairl-lab/jade.git /usr/share/nginx/html

# Replace default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Verify copied files (for debugging)
RUN ls -la /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
