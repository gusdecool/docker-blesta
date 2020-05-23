# Blesta Docker Setup

Blesta Billing Platform docker setup. See https://www.blesta.com/ to know more about Blesta.

## How to use

1. Put the Blesta web root application in `blesta/` directory.
1. Run `docker-compose up -d` and open `https://localhost:7013` to start install Blesta application
1. When asked for database connection, use these credentials:
    1. host: database
    1. port: 3306
    1. database: blesta_db
    1. user: blesta_user
    1. password: blesta_pass
