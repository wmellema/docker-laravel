# docker-laravel

## To run:
* Install docker and docker-compose
  * For linux: Run the following command: `sudo ./configure.sh` and reboot
* Run the following command: `./create_stack.sh portainer`

Now you have a full installation of laravel with Portainer as a Docker frontend.

To install without portainer: run the above command without the portainer appended

You can reach the management interface at: `localhost:9000` and the Laravel project at `http://localhost`

## Using the installation

The installation will use the folders of any laravel installation, with the addition of the `laradock` folder. This is used to access your workspace. The folders where you can edit your files will be the `laravel` folder inside of the project root (*The folder where this file resides*)

To access your workspace: run the following command from the `laradock` folder: `docker-compose exec workspace bash`

This workspace is used to run the `artisan` command for example

You will now have a terminal session inside your workspace.

For now: Every file created by artisan will be owned by root, so you'll have to do a chown of those files. For your benefit, there is a script that does that automatically. You can execute it by running `sudo ./own.sh` from the root of this project


For more information: Check out the laradock documentation at [laradock](http://laradock.io/guides/#Digital-Ocean)
