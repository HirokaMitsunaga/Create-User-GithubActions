#!/bin/bash

#環境変数の確認
echo "MYSQL_ROOT_PASSWORD"
echo $MYSQL_ROOT_PASSWORD
echo "HOST_NAME"
echo $HOST_NAME
echo "SCHEMA_NAME"
echo $SCHEMA_NAME
echo "USER_NAME"
echo $USER_NAME
echo "USER_PASSWORD"
echo $USER_PASSWORD

# スキーマの作成（MySQLの例）
echo "Creating schema..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h $HOST_NAME -e "CREATE DATABASE IF NOT EXISTS $SCHEMA_NAME;"

# ユーザーの作成
echo "Creating user..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h $HOST_NAME -e "CREATE USER '${USER_NAME}'@'%' IDENTIFIED BY '$USER_PASSWORD';"

# 権限の付与
echo "Granting privileges..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h $HOST_NAME -e "GRANT ALL PRIVILEGES ON ${SCHEMA_NAME}.* TO '${USER_NAME}'@'%';"
