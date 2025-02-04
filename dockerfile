# Use Nginx as the base image for serving static content
FROM nginx:1.23-alpine

# Install git to clone the repository
RUN apk update && \
    apk add --no-cache git

# Clone the Jade repository
RUN git clone https://github.com/mairl-lab/jade.git /tmp/jade

# Copy static assets to Nginx server directory
RUN cp -r /tmp/jade/*.html /tmp/jade/*.png /usr/share/nginx/html/

# Remove default Nginx welcome page
RUN rm /usr/share/nginx/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
