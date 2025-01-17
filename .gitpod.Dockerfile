FROM gitpod/workspace-full:latest

RUN docker-compose pull \
&& docker-compose run --no-deps --rm conjur data-key generate > data_key \
&& export CONJUR_DATA_KEY="$(< data_key)" \
&& docker-compose up -d

