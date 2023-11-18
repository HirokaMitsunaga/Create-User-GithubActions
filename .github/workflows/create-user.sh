#!/bin/bash

# スキーマの作成（MySQLの例）
echo "Creating schema..."
mysql -u root -p$DB_PASSWORD -h $HOST_NAME -e "CREATE DATABASE IF NOT EXISTS $SCHEMA_NAME;"

# ユーザーの作成
echo "Creating user..."
mysql -u root -p$DB_PASSWORD -h $HOST_NAME -e "CREATE USER '$USER_NAME'@'localhost' IDENTIFIED BY '$USER_PASSWORD';"

# 権限の付与
echo "Granting privileges..."
mysql -u root -p$DB_PASSWORD -h $HOST_NAME -e "GRANT ALL PRIVILEGES ON $SCHEMA_NAME.* TO '$USER_NAME'@'localhost';"
