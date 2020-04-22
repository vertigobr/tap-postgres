FROM python:3.8-alpine
ARG version=1.6.0
RUN apk update && \
  apk add postgresql-libs && \
  apk add --virtual .build-deps gcc musl-dev postgresql-dev && \
  pip install pipelinewise-tap-postgres==${version} --no-cache-dir && \
  apk --purge del .build-deps

WORKDIR /app
ENTRYPOINT ["tap-postgres"]
