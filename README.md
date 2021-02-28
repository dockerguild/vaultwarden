# Bitwarden docker stack

## Installation

    git clone git@github.com:dockerguild/bitwarden.git bitwarden
    cd bitwarden
    rm -fr .git
    git init
    git remote add origin {your_repository}

## Configure proxy

Requirement : Nginx

Edit vhost `config/nginx/proxy.conf` and register it to nginx

    ln -s "${PWD}/config/nginx/proxy.conf" /etc/nginx/sites-enabled/bitwarden.conf
    service nginx restart

## Configure crontab

Edit vhost `config/crontab/crontab` and register it to crontab

    ln -s "${PWD}/config/crontab/crontab" "/etc/cron.d/bitwarden"

## Usage

Start containers

    make start

Restart containers

    make restart

Down containers

    make down

Update containers

    make update

## Backup

**Before your must configure** `.make/filesystem` according to your use.

**You must also set up an external backup system !**

Dump containers files

    make filesystem/dump

Restore containers files

    make filesystem/restore

## Crontab

For crontab usage

    bash /path_to_project/bin/console.sh dump
