set -u
username=$1

mkdir $username
cd $username

openssl req -new -newkey rsa:4096 -nodes \
    -keyout $username.key -out $username.csr

openssl pkcs12 -export -out $username.pfx -inkey $username.key -in $username.crt -certfile ../ca.cert
