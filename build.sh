VERSION=$(cat VERSION)
DOCKER_BUILD=zurajm/hass-configurator-docker
rm -rf ./src/
git clone https://github.com/danielperna84/hass-configurator.git ./src
sed -i 's/GIT = False/GIT = True/g' ./src/configurator.py
docker buildx build --platform linux/amd64,linux/arm64 --push -t ${DOCKER_BUILD} -t ${DOCKER_BUILD}:${VERSION} .