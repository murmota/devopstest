#!/bin/bash
set -e

cat > "$PGDATA/pg_hba.conf" <<EOF
local   all             all                                     trust
host    all             all             0.0.0.0/0               trust
host    all             all             ::/0                    trust
EOF

cat >> "$PGDATA/postgresql.conf" <<EOF
listen_addresses = '*'
logging_collector = on
log_directory = '/var/log/postgresql'
log_filename = 'postgresql-%Y-%m-%d.log'
log_truncate_on_rotation = on
log_rotation_age = 1d
log_rotation_size = 0
EOF

exec docker-entrypoint.sh postgres
