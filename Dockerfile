FROM caddy:2.8.4-alpine
COPY _site /var/html
CMD ["caddy", "file-server", "--listen", ":8080", "file-server", "--root", "/var/html"]
