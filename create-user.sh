set -u
username=$1

mkdir $username
cd $username

openssl req -new -newkey rsa:4096 -nodes \
    -keyout user.key -out user.csr

openssl x509 -req -days 365 -in user.csr -CA ../ca.crt -CAkey ../ca.key -set_serial 01 -out user.crt
openssl pkcs12 -export -out user.pfx -inkey user.key -in user.crt -certfile ../ca.crt

