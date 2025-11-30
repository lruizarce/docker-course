MONGODB_IMG="mongodb/mongodb-community-server"
MONGODB_TAG="7.0-ubuntu2204"
source.env.db

# Root credentials
ROOT_USERNAME="root-user"
ROOT_PASSWORD="root-password"

# Key-Value App database
keyValueDb="key-value-db"
keyValueUser="key-value-user"
keyValuePassword="key-value-password"

# Contectivity settings
LOCALHOST=27017
CONTAINER_PORT=27017
source .env.network

#Storage
source .env.volume
VOLUME_CONTAINER_DATA="/data/db"

source setup.sh

if [ "$(docker ps -q -f name=$DB_CONTAINER_NAME)" != "" ]; then
    echo "MongoDB container $DB_CONTAINER_NAME is already running"
    exit 0
fi

docker run --rm -d --name $DB_CONTAINER_NAME \
    -e MONGODB_ROOT_USERNAME=$ROOT_USERNAME \
    -e MONGODB_ROOT_PASSWORD=$ROOT_PASSWORD \
    -e MONGODB_DATABASE=$keyValueDb \
    -e MONGODB_USERNAME=$keyValueUser \
    -e MONGODB_PASSWORD=$keyValuePassword \
    -v ./db-config/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js:ro \
    -v $VOLUME_NAME:$VOLUME_CONTAINER_DATA \
    -p $LOCALHOST:$CONTAINER_PORT \
    --network $NETWORK_NAME \
    $MONGODB_IMG:$MONGODB_TAG
    