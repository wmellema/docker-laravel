# docker-laravel

## To run:
* **MAKE SURE YOU DON'T HAVE ANYTHING RUNNING ON PORTS 80, 443 AND 3306 (AKA Http Https and Mysql)**
  * For Fedora: Run the following command: `sudo ./configure.sh` and reboot
  * For Mac OSX: follow the installation instructions on the [docker website](https://store.docker.com/editions/community/docker-ce-desktop-mac)
  * For other systems: Install docker-ce and docker-compose
* Run the following command: `./create_stack.sh portainer`

Now you have a full installation of laravel with Portainer as a Docker frontend.

To install without portainer: run the above command without the portainer appended

You can reach the management interface at: `localhost:9000` and the Laravel project at `http://localhost`

If for some reason your laravel installation is not running, you can just run the `./create_stack.sh` again in order to start all docker images

## Using the installation

The installation will use the folders of any laravel installation, with the addition of the `laradock` folder. This is used to access your workspace. The folders where you can edit your files will be the `laravel` folder inside of the project root (*The folder where this file resides*)

To access your workspace: run the following command from the `laradock` folder: `docker-compose exec workspace bash`

This workspace is used to run the `artisan` command for example

You will now have a terminal session inside your workspace.

**You don't have to change any of the .env variables in your laravel installation!**
Your settings are already set with the create_stack script.

There is one exeption:
 * If the variable `DB_HOST` in the `laravel/.env` file is still `127.0.0.1`, you'll have to change it manually to the correct one. It can be found inside the portainer management interface. If that is not installed: Install it with `./create_stack.sh portainer-only`

**Note**: Every file created by artisan will be owned by root, so you'll have to do a chown of those files. For your benefit, there is a script that does that automatically. You can execute it by running `sudo ./own.sh` from the root of this project


For more information: Check out the laradock documentation at [laradock](http://laradock.io/guides/#Digital-Ocean)
