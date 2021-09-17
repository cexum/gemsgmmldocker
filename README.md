# gemsgmmldocker
## Docker files to generate a stand-alone gems + gmml container.

### Getting started
* **this guide assumes that the host has docker and docker-compose installed**
* build and start your container by running: docker-compose up -d 
* run docker ps -a to get the name of the new container
* run docker attach <container> to get access to the container's shell

### Test your installation
* attach to your container and run the following:
* cd /programs/gems 
* bash test_installation.bash
* cd ~
* python3 simple.py 1ubq.pdb

### Move information into your container
* the container shares a binding mount with the host at the directory the container was built at: $(pwd):/home/gemsuser
* new gems scripts need to be saved to this directory in order for the container to have access to them
* conversely, the container shares files with the host at the same directory

### System information
* GEMSHOME: /programs/gems
* PYTHON_HOME: /usr/include/python3.7m
* USER: gemsuser

### GEMS documentation
* http://glycam.org/docs/gems/writing-your-own-gems/
* http://glycam.org/docs/gems/using-existing-gems/
