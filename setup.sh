#!/bin/bash
#Setup Development Environment
#base from https://codesandbox.io/s/happy-hopper-lp2cqx?file=/setup.sh:0-2132

echo -e "Let's quickly setup your development environment:"

#1 - Do you have Docker Desktop installed?
read  -p "Do you have Docker Desktop installed and is it currently running? Y/n " IS_DOCKER_DESKTOP_INSTALLED
case $IS_DOCKER_DESKTOP_INSTALLED in
	[yY] | "" ) ;;
	[nN] ) echo 'Please install Desktop Docker before continuing https://www.docker.com/products/docker-desktop/';
		exit;;
	* ) echo $IS_DOCKER_DESKTOP_INSTALLED is an invalid response, please enter y or n;
		exit 1;;
esac

#2 - Do you have Node installed?
read  -p "Do you have Node installed? Y/n " IS_NODEJS_INSTALLED
case $IS_NODEJS_INSTALLED in
	[yY] | "" ) ;;
	[nN] ) echo 'Please install Node before continuing https://nodejs.org/en/';
		exit;;
	* ) echo $IS_NODEJS_INSTALLED is an invalid response, please enter y or n;
		exit 1;;
esac

#2 - Do you have Composer installed?
read  -p "Do you have Composer installed? Y/n " IS_COMPOSER_INSTALLED
case $IS_COMPOSER_INSTALLED in
	[yY] | "" ) ;;
	[nN] ) echo 'Please install Composer before continuing https://getcomposer.org/download/';
		exit;;
	* ) echo $IS_COMPOSER_INSTALLED is an invalid response, please enter y or n;
		exit 1;;
esac

#3 - Copy ENV file:
cd ./apps/docs && cp .env.example .env

#4 - Install Next.js:
echo Installing dependencies...
cd ../.. && pnpm install && composer install

#5 - Install WordPress (Docker Desktop must be running):
cd ./apps/wp/config && chmod +x install.sh && ./install.sh


read  -p "Press [Enter ↩] when you have completed the steps listed above." HAS_IMPORTED_ACF

if [[ "$HAS_IMPORTED_ACF" == "" ]]
then
 cd ../../ && pnpm run dev
fi

exit 0
