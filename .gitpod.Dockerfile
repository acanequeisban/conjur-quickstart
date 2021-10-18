FROM gitpod/workspace-full

RUN docker-compose pull

RUN docker-compose run --no-deps --rm conjur data-key generate > data_key

RUN export CONJUR_DATA_KEY="$(< data_key)"=value

RUN docker-compose up -d

RUN docker-compose exec conjur conjurctl account create myConjurAccount > admin_data

