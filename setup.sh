set -u
. .env
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=$COUNTRY/ST=$STATE/L=$LOCATION/O=$ORGANIZATION/CN=$COMMON_NAME" \
    -keyout ca.key  -out ca.crt
