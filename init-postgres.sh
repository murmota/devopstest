#!/bin/bash
set -e

mkdir -p /var/lib/postgresql/data/logs

cat > /var/lib/postgresql/data/pg_hba.conf <<EOF
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             0.0.0.0/0               trust
host    all             all             ::/0                    trust
EOF

cat > /var/lib/postgresql/data/postgresql.conf <<EOF
listen_addresses = '*'
logging_collector = on
log_directory = 'logs'
log_filename = 'postgresql-%Y-%m-%d.log'
log_truncate_on_rotation = on
log_rotation_age = 1d
log_rotation_size = 0
EOF

exec docker-entrypoint.sh postgres
