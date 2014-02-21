#!/bin/sh
mysql -uroot -pROOT-PASSWORD DB-name -e "show tables;" > tables.list

for table in `cat tables.list`
do
    tabledata=`mysql -uroot -pROOT-PASSWORD DB-name -e "select * from $table;"`
    echo $tabledata | grep --color=auto "$1" && echo ============= $table
done
