stools
======

## scron定时任务程序
### 功能，
1.一次部署，通过web添加任务
2.日志输出，
3.超时处理或报警

### 依赖 mysql

### 部署

本程序不包含Web操作，可自行设计Web程序，操作数据库即可。

*默认会查找 /etc/scron.conf文件*
python scron.py

*指定scron.conf文件*
python scron.py -c scron.conf

*指定部署环境*
python scron.py -c scron.conf -e dev

### scron.conf

```
[pro]
db_host = 192.168.0.1
db_name = sys
db_port = 3306
db_user = sys
db_pass = 123456
log_path = /data/logs
cron_table_name = sys_crontab
host_table_name = sys_crontab_host
iskill = 1

[test]
db_host = 192.168.1.1
db_name = test
db_port = 3306
db_user = test
db_pass = 123456
log_path = /data/logs
cron_table_name = sys_crontab
host_table_name = sys_crontab_host
iskill = 1

[dev]
db_host = 192.168.2.1
db_name = dev
db_port = 3306
db_user = dev
db_pass = 123456
log_path = /data/logs
cron_table_name = sys_crontab
host_table_name = sys_crontab_host
iskill = 1
```

cron_table_name是任务表名，host_table_name是主机表名, iskill=1表示超时后，会自动杀掉

### 表结构
```
sys_crontab;
+---------+--------------+------+-----+---------+----------------+-----------------------------------------+
| Field   | Type         | Null | Key | Default | Extra          |说明                                     |
+---------+--------------+------+-----+---------+----------------+-----------------------------------------+
| cronId  | int(11)      | NO   | PRI | NULL    | auto_increment |任务id                                   |
| task    | varchar(255) | NO   |     | NULL    |                |任务名                                   |
| active  | tinyint(1)   | NO   |     | 0       |                |是否激活，保有激活才能运行               |
| mhdmd   | varchar(255) | NO   |     | NULL    |                |时间条件，与crontab一样 * * * * *        |
| command | varchar(255) | NO   |     | NULL    |                |脚本或命令                               |
| params  | varchar(255) | NO   |     | NULL    |                |脚本或命令的参数（也可一起写在command中）|
| process | varchar(255) | NO   |     | 1       |                |允许运行的进程数量                       |
| runAt   | varchar(255) | NO   |     | 0       |                |上次运行时间(Web配置也不要操作此项       |
| host    | varchar(15)  | NO   |     | NULL    |                |运行的主机Ip                             |
| logFile | varchar(255) | NO   |     |         |                |日志文件                                 |
| timeout | int(11)      | NO   |     | 0       |                |超时时间（单位：分钟）                   |
| user    | varchar(255) | NO   |     | NULL    |                |运行脚本的linux用户（可留空)             |
+---------+--------------+------+-----+---------+----------------+-----------------------------------------+
```
```
sys_crontab_host;
+-----------+------------------+------+-----+---------+----------------+----------------+
| Field     | Type             | Null | Key | Default | Extra          |说明            |
+-----------+------------------+------+-----+---------+----------------+----------------+
| id        | int(11) unsigned | NO   | PRI | NULL    | auto_increment |主键            |
| host_name | varchar(255)     | NO   |     | NULL    |                |主机名          |
| host      | varchar(15)      | NO   |     | NULL    |                |ip              |
| is_enable | tinyint(3)       | NO   |     | 0       |                |是否可用        |
+-----------+------------------+------+-----+---------+----------------+----------------+
```
