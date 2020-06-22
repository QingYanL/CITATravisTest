#!/bin/bash
cd ./docker/release || return
echo "ls old" "$(ls)"
cp -r $TRAVIS_BUILD_DIR/cita_secp256k1_sha3 ./
echo "ls new" "$(ls)"
tar czf cita_secp256k1_sha3.tar.gz cita_secp256k1_sha3

CITA_REPOSITORY_NAME=hhliyan/cita-cli-2020-test
DOCKER_USERNAME=hhliyan

docker build . -t "$CITA_REPOSITORY_NAME":"$TRAVIS_TAG"

docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD_CITA"

docker push "$CITA_REPOSITORY_NAME":"$TRAVIS_TAG"
