# tap-postgres

Singer tap for Postgres

## Automated build

This image is built automatically by Docker Hub:

- master --> latest
- github tag --> image tag

## Sample

A docker-compose and sample files were provided in order to test this component:

- **country.postgresql.sql**: initializes database with a table named "list"
- **config-pg.json**: tap config file (points do database)
- **properties-pg.json**: table/fields selection

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
