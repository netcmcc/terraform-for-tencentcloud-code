#! /bin/bash
apt update
apt -y install php apache2
rm -f /var/www/html/index.html
cat <<EOF > /var/www/html/index.php
<html><body><p>Hello World! The hostname of the server: <?php echo gethostname(); ?></p></body></html>
EOF
