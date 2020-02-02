#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "gutendex" --dbname "gutendex" <<-EOSQL
    CREATE USER gutendex;
    CREATE DATABASE gutendex;
    GRANT ALL PRIVILEGES ON DATABASE gutendex TO gutendex;
EOSQL