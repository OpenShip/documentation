The minimal requirements to deploy Purplship is:

- A `database` (fully tested with Postgress)
- A `webserver` (fully tested with Nginx)

## Quick preview

<details>
<summary>Start a postgres SQL Database Instance</summary>

```shell
docker run -d --name db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres
```

And start the purplship-server docker container

</details>

```shell
docker run --name purplship --link=db:db -p5002:5002 purplship/purplship-server:[version]
```

## Using docker-compose

A minimal `docker-compose.yml` file will look like this

```yaml
version: '3'

services:

  db:
    image: postgres
    environment:
      POSTGRES_DB: "[db_name]"
      POSTGRES_USER: "[db_user]"
      POSTGRES_PASSWORD: "[db_paswwor]"
    ports:
      - "5432:5432"
    networks:
      - db_network

  purplship:
    image: purplship/purplship-server:[tag]
    restart: always
    environment:
      DEBUG_MODE: "False"
      ALLOWED_HOSTS: "[domain_name]"
      DATABASE_HOST: "db"
      DATABASE_PORT: 5432
      DATABASE_NAME: "[db_name]"
      DATABASE_USERNAME: "[db_user]"
      DATABASE_PASSWORD: "[db_paswwor]"
    volumes:
      - ./purplship/staticfiles:/usr/local/lib/python3.8/site-packages/staticfiles
    ports:
      - "5002:5002"
    depends_on:
      - db
    networks:
      - db_network
      - purplship_network

  nginx:
    restart: always
    image: "nginx:latest"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx:/etc/nginx/conf.d
      - ./purplship/staticfiles:/static
    networks:
      - purplship_network
    depends_on:
      - purplship


networks:
  db_network:
    driver: bridge
  purplship_network:
    driver: bridge

```

A nginx config in `nginx/purplship.conf`

```conf
upstream purplship {
    server purplship:5002;
}

server {

    listen 80;
    server_name [domain_name];

    location / {
        proxy_pass http://purplship;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_redirect off;
    }

    location /static/ {
        alias /static/;
    }

}
```

!> **Note** \
Set your the values represented using `[value_name]` to the one corresponding to your setup.
