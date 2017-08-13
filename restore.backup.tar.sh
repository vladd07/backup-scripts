#!/bin/bash


# var/www			-->	Get last backup file names into variables
LAST_WWW_BACKUP=$(ls /files/var.www/var.www-*.tar.gz | tail -n 1)

# etc/letsencrypt		-->	Get last backup file names into variables
LAST_LETSENCRYPT_BACKUP=$(ls /files/etc.letsencrypt/letsencrypt-*.tar.gz | tail -n 1)

# etc/apache2			-->	Get last backup file names into variables
LAST_APACHE2_BACKUP=$(ls /files/etc.apache2/apache-*tar.gz | tail -n 1)

# etc/ssl 			-->	Get last backup file names into variables
LAST_SSL_BACKUP=$(LS /files/etc.ssl/ssl-*tar.gz | tail -n 1)


# Restore /var/www
echo "Restoring var.www ... please stand by"
sleep 2
/bin/tar -xvpzf $LAST_WWW_BACKUP -C /var/www/
echo ""
echo "var/www 			 finished !"

# Restore /etc/letsencrypt
echo "Restoring etc/letsencrypt ... please stand by"
sleep 2
/bin/tar -xvpzf $LAST_LETSENCRYPT_BACKUP -C /etc/letsencrypt
echo ""
echo "/etc/letsencrypt 		 finished !"

# Restore /etc/apache2
echo "Restoring /etc/apache2 ... please stand by "
sleep 2
/bin/tar -xvpzf $LAST_APACHE2_BACKUP -C /etc/apache2
echo ""
echo "/etc/apache2 		 finished !"

# Restore /etc/ssl
echo "restoring /etc/ssl/"
sleep 2
/bin/tar -xvpzf $LAST_SSL_BACKUP -C /etc/ssl
echo ""
echo "/etc/ssl 			 finished !"
