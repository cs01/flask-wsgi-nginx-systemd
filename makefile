.PHONY: all copy_flask copy_nginx restart  # PHONY because no files are output

all: copy_flask copy_nginx restart

copy_flask:
	scp exampleflask.service root@example.com:/etc/systemd/system/exampleflask.service

	rsync -av ./example/ root@example.com:/var/www/example/
	ssh root@example.com 'sudo chown -R www-data:www-data /var/www/example/'

copy_nginx:
	rsync -av sites-available/ root@example.com:/etc/nginx/sites-available/
	ssh root@example.com 'sudo service nginx restart'

restart:
	ssh root@example.com 'sudo systemctl daemon-reload'
	ssh root@example.com 'sudo systemctl enable exampleflask.service'
	ssh root@example.com 'sudo systemctl restart exampleflask'
	ssh root@example.com 'sudo service nginx restart'
