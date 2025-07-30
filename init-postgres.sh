#!/bin/bash
set -e

mkdir -p /var/lib/postgresql/data/logs/pglogs
chown -R postgres:postgres /var/lib/postgresql/data/logs/pglogs
chmod 700 /var/lib/postgresql/data/logs/pglogs

mkdir -p /app/logs/applogs/$(date +%F)
chown -R postgres:postgres /app/logs/applogs
chmod 700 /app/logs/applogs

cat > /var/lib/postgresql/data/pg_hba.conf <<EOF
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             0.0.0.0/0               trust
host    all             all             ::/0                    trust
EOF

cat > /var/lib/postgresql/data/postgresql.conf <<EOF
logging_collector = on
log_directory = 'logs/pglogs'
log_filename = 'postgresql-%Y-%m-%d.log'
log_truncate_on_rotation = on
log_rotation_age = 1d
log_rotation_size = 0
EOF
exec docker-entrypoint.sh postgres

