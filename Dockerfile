FROM python:3.8-alpine as builder
ARG version=1.6.0
RUN apk update && \
  apk add postgresql-libs && \
  apk add --virtual .build-deps gcc musl-dev postgresql-dev
RUN pip install --user pipelinewise-tap-postgres==${version} --no-cache-dir

FROM python:3.8-alpine
RUN apk update && \
  apk add --no-cache postgresql-libs
RUN adduser -h /app -D worker
COPY --from=builder --chown=worker:worker /root/.local /app/.local
USER worker
WORKDIR /app
ENV PATH=/app/.local/bin:$PATH
ENTRYPOINT ["tap-postgres"]
CMD ["-c","/opt/config/config-pg.json","-p","/opt/config/properties-pg.json"]
