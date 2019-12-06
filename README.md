# PROYECTO ALBARREGAS

## Dependencias

- VirtualBox (https://www.virtualbox.org/wiki/Downloads)
- Vagrant (https://www.vagrantup.com/downloads.html)

## Primera instalación y arrancar backend

    $ git clone https://github.com/galindosvq/SectorSpain.git
    $ cd SectorSpain/
    $ cp .env.default .env
    $ cp frontend/.env.default frontend/.env
    $ vagrant up
    $ vagrant ssh
    $ pip install -r requeriments.txt
    $ psql -U django -W django_db < basename.sql
    $ django
    $ ./run.sh


## Arrancar frontend (nos situamos en la carpeta 'frontend', instalamos las dependencias y arrancamos el servidor)

    $ npm install
    $ npm start

## Configuración

- Proyecto de Django project está en `backend/`
- El archivo manage es `backend/manage.py`
- El archivo de configuración principal es `backend/settings.py`
- El frontend se encuentra en 'frontend'

### Environment variables

La idea es poder configurar el proyecto utilizando variables de entorno. Esto permite un enfoque más modular. Estas variables se pueden configurar tanto en la máquina host como en el archivo `.env`.

Estas son la variables usadas:

| Variable            | Default  | What                                                             | Example                     |
| ------------------- | -------- | ---------------------------------------------------------------- | --------------------------- |
| `ALLOWED_HOSTS`     |          | A colon separated list with the allowed hosts                    | `localhost:mywebsite.local` |
| `ENV`               | `dev`    | The current environment. When `dev`, Django `DEBUG` will be true | `dev`, `staging`, `prod`... |
| `DJANGO_SECRET_KEY` |          | The secret key for Django...                                     |                             |
| `DATABASE_USER`     | `django` | User to connect to postgres                                      |                             |
| `DATABASE_PASS`     | `django` | Password to connect to postgres                                  |                             |
