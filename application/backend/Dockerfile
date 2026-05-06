FROM mysql:8.0

# Environment variables
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=app_db
ENV MYSQL_USER=app_user
ENV MYSQL_PASSWORD=app_pass

# Copy initialization script
COPY init.sql /docker-entrypoint-initdb.d/

# Custom MySQL config
COPY my.cnf /etc/mysql/conf.d/my.cnf

EXPOSE 3306
