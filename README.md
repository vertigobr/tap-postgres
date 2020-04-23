# tap-postgres

Singer tap for Postgres

## Automated build

This image is built automatically by Docker Hub:

- master --> latest
- github tag --> image tag

## How to use

Mount both config files (`config-pg.json` and `properties-pg.json`) on "/opt/config" when running this tap:

```sh
docker run --rm -ti \
  -v <configs>:/opt/config \
  vertigo/tap-postgres
```

The `config-pg.json` file holds the db connection info in the form below:

```json
{
    "host": "postgres",
    "port": "5432",
    "user": "postgres",
    "password": "password",
    "dbname": "postgres"
}
```

## Sample

A docker-compose and sample files were provided in order to test this component:

- `country.postgresql.sql`: initializes database with a table named "list"
- `config-pg.json`: tap config file (points do database)
- `properties-pg.json`: table/fields selection

To run this tap:

```sh
docker-compose up postgres # wait a few seconds for db init
docker-compose run tap-postgres # runs tap in foreground
```

## Notes

The file **properties-pg.json** was generated with:

```sh
docker-compose run tap-postgres -c /opt/sample/config-pg.json --discover > ./sample/properties-pg.json
```

## More links:

- [Config files sample](https://github.com/singer-io/tap-mysql) (MySQL-specific)
- [Tap PostgreSQL](https://transferwise.github.io/pipelinewise/connectors/taps/postgres.html) (Pipelinewise)
- [Postgres Docker Image](https://hub.docker.com/_/postgres)
