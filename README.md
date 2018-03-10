# Ubuntu + Flask + wsgi + nginx + systemd

Some notes on setting up a stack on Ubuntu with flask, nginx, uwsgi, systemctl. A full tutorial is available at [https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-16-04
](https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-16-04
). These are just some notes and scripts that make things easier.

Install dependencies on server
```
sudo apt-get install libpcre3 libpcre3-dev nginx  # for uwsgi
```

```
sudo pip install virtualenvwrapper  
# set up virtualenvwrapper
# https://github.com/cs01/virtualenv_quickstart
mkvirtualenv example
pip install flask uwsgi
```

Set up nginx (see sites-available).

Push local changes to server and restart all services
```
make
```

Change your app in example/server.py, then run `make` again to see it live on the server.

Debugging server errors
```
sudo systemctl status exampleflask.service  # did it launch?
sudo journalctl -u exampleflask.service  # detailed flask logs
sudo tail -f /var/log/nginx/error.log  # detailed nginx logs
```


References
* https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-16-04
* http://flask.pocoo.org/docs/0.12/deploying/uwsgi/
