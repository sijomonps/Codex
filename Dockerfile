# Start from a lightweight web server
FROM nginx:alpine

# Change nginx to listen on port 8080 (needed for OpenShift)
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Copy your HTML/CSS files into the web server
COPY . /usr/share/nginx/html

# Tell OpenShift which port to use
EXPOSE 8080

# Run nginx forever
CMD ["nginx", "-g", "daemon off;"]
