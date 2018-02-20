# docker-laravel

This project is to accomodate the CodeGorilla students with an easy method of installing laravel within docker

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

For this project you will need the following software:
* [docker-ce](https://www.docker.com/community-edition)
* [docker-compose](https://docs.docker.com/compose/)
* Nothing running on ports 80, 443 and 3306

For Fedora linux distributions you can install all dependencies by using:
```
sudo ./configure.sh
```

### Installing

For the installation of this package you will need to clone this project onto your machine. This can be done with the following command.

```
git clone https://github.com/wmellema/docker-laravel.git
```

*If you've got an existing repo: you can clone the repo inside of the `docker-Laravel` repo, and rename it to `laravel`. This will accomodate existing projects within the laradock ecosystem.*

After you've cloned the repository, you need to run the following command:

```
./create_stack.sh
```
This will create a laravel installation within a couple of docker containers. All the code for this will reside within the `laravel` folder.

After running this command, you'll be able to reach your laravel installation at [http://localhost/](http://localhost/)

**After the installation it is not neccesary for the user to change their .env file**

#### Portainer

Pre-bundled with this software is the posibility to use the [portainer](https://portainer.io/) docker image to manage your docker stack. This can be installed as follows:
```
./create_stack portainer-only
```
Portainer can now be reached at [http://localhost:9000/](http://localhost:9000)



## Running the tests

To test if your installation is fully working: Use the following commands in specified order to verify:
```
cd laravel/laradock
docker-compose exec workspace bash
artisan migrate:fresh
```
If this gives any errors, please check your configuration or your installation. It could be that your containers refused to start due to already assigned ports

## Working with the installation

All the laravel files will be available inside the laravel folder.

If you ever find yourself without the server running, just run the `./create_stack.sh` command again.

### Artisan

**UPDATE AS PER v1.1.0**

You can now use the `./artisan.sh` command like you would use the normal `artisan` command without getting ownership issues. Example:

```
./artisan.sh migrate:fresh
```

The `own.sh` script will be left in as a easy solution, but will be removed in the next major release

**v1.0.1 way**

If you want to use the artisan command that laravel provides, it will be neccesary to do this from your workspace. You can enter the workspace by executing the following commands from the project root (laravel folder)
```
cd laradock
docker-compose exec workspace bash
```

You will now be able to use your artisan commands.

One thing to note: All the files that will be generated by the artisan command will be owned by root on the host system. This is why the `own.sh` file exists.

When and if you encounter files that cause permission issues with your host system, you can just run the following command from the `docker-laravel` folder in order to fix them

```
sudo ./own.sh
```


### MySQL

The easiest way to interact with the database is [dbeaver](https://dbeaver.jkiss.org/).

The credentials and host are all generated at the time of installation, and you can find them at the `.env` file inside of the `laravel` folder.

For example:
```
DB_CONNECTION=mysql
DB_HOST=172.20.0.2
DB_PORT=3306
DB_DATABASE=default
DB_USERNAME=default
DB_PASSWORD=secret
```

This means that the host is `172.20.0.2`, the user is `default` with password `secret` and the database is `default`

To interact with the database above, you would run the following command:
`mysql -u default -h 172.20.0.2 -p`
Within the MySQL prompt you would use `use default;` to select the correct database.

## Built With

* [Portainer](https://portainer.io/) - Docker management interface
* [Laravel](https://github.com/laravel/laravel) - Web framework
* [Laradock](https://github.com/laradock/laradock) - Docker-compose library for laravel

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/wmellema/docker-laravel/tags).

## Authors

* **Wouter Mellema** - *Project Setup* - [wmellema](https://github.com/wmellema)

See also the list of [contributors](https://github.com/wmellema/docker-laravel/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
