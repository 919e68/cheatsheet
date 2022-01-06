#### connection

```
$ sudo -i -u postgres
$ psql

# with password
$ psql -h <hostname> -p <port> -d <database> -U <user> -W
```

#### list databases

```
\l
```

#### list database users

```
\du
```

#### rename database

```
ALTER DATABASE <db> RENAME TO <newdb>;
```

#### make superuser

```
ALTER USER <username> WITH SUPERUSER;
```

#### grant user

```
GRANT ALL PRIVILEGES ON DATABASE <db_name> to <username>;
```

#### add uuid extension

```
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

#### export to sql file

```
$ pg_dump -U username dbname > data.sql
```

#### import from sql file

```
$ psql -U postgres -h localhost amaczar_dev < ./db/structure.sql
```

#### export table insert

```
$ pg_dump --table=users --data-only --column-inserts test_db > users_data.sql
```

#### show hba

```
$ postgres - show hba
```

#### allow local and external connection

```
# config
# /etc/postgresql/<version>/main/pg_hba.conf

# allow local user
local      DATABASE  USER  METHOD  [OPTIONS]
# type       DATABASE     USER        ADDRESS         METHOD
local        all          all                         password

# allow remote
# type       DATABASE     USER        ADDRESS         METHOD
host         all          all         0.0.0.0/0       password

# allow certain ip
host all all <source-ip>/32 trust

# /etc/postgresql/<version>/main/postgresql.conf
listen_addresses = '*'
```
