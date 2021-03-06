server {
  listen 80;
  server_name example.com;

  location / {
      include uwsgi_params;
      uwsgi_pass unix:/var/www/example/example.sock;
  }
}
