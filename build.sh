#!/bin/bash

if [ "$(docker container ls -a -f status=exited | grep 'imageMosaicContainer' )" ] 
then 
	docker container start imageMosaicContainer 
elif [ "$(docker container ls -a -f status=running | grep 'imageMosaicContainer')" ] 
then
	echo "Container imageMosaicContainer is running"
else 
	docker container run -d -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work --name imageMosaicContainer jupyter/scipy-notebook
fi