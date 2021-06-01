# Vaultwarden with Docker

## Installation

    git clone git@github.com:dockerguild/vaultwarden.git vaultwarden
    cd vaultwarden
    rm -fr .git
    git init
    git remote add origin <MY_REPOSITORY>

## Configure proxy

Requirement : Nginx

Edit vhost `config/nginx/proxy.conf` and register it to nginx

    cp "${PWD}/config/nginx/proxy.conf" /etc/nginx/sites-enabled/vaultwarden.conf
    service nginx restart

## Configure crontab

Edit vhost `config/crontab/crontab` and register it to crontab

    cp "${PWD}/config/crontab/crontab" /etc/cron.d/vaultwarden

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

    bash /<MY_PROJECT_PATH>/bin/console.sh dump
