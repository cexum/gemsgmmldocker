# gemsgmmldocker
## Docker files to generate a stand-alone gems + gmml container.

### Getting started

#### Install Docker
Before beginning, the host system must have Docker installed. Navigate to: https://docs.docker.com/engine/install/
and follow instructions for installing Docker on your platform and architecture

#### Install Docker Compose
Navigate to: https://docs.docker.com/compose/install/ and follow instructions for installing Docker Compose on your
platform.

#### Build Container
build and start your container by running: 
    bash startcontainer.bash

#### Test your container
1) Run:
    * docker container ls -a
to list your containers.

2) locate your container which will have a name: gemsgmmldocker_gemsgmml_n.

3) Run:
    * docker attach containername
to get access the container's shell.

4) Once attached, run the following inside the container:
    * cd $GEMSHOME
    * bash test_installation.bash
    * cd ~
    * python3 simple.py 1ubq.pdb

### How information is shared between the host and the container
The container shares a binding mount with the host at the gemsgmmldocker directory, and the directory /home/webdev inside the container.

New gems scripts need to be saved to this directory (gemsgmmldocker,) $(pwd), in order for the container to have access to them at: /home/webdev

### Starting your container
From the gemsgmmldocker directory, run:
    * bash startcontainer.bash
    
### Stop your container
1) Get the name of your container via: 
    * docker container ls -a
2) Run:
    * docker stop <containername>

### New GEMS scripts
New GEMS scripts should be added to the gemsgmmldocker directory in the host in order to be shared with the container. Files present in gemsgmmldocker will visible inside the
container at: /home/webdev

### Invoke GEMS scripts
1) Attach to the container

2) GEMS scripts are invoked via:
    * python3 <gemsscript>.py <arg1> ...

### Container information
* GEMSHOME: /programs/gems
* PYTHON_HOME: /usr/include/python3.7m
* USER: webdev

### GEMS documentation
* http://glycam.org/docs/gems/writing-your-own-gems/
* http://glycam.org/docs/gems/using-existing-gems/
