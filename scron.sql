DROP TABLE IF EXISTS `sys_crontab`;
CREATE TABLE `sys_crontab` (
  `cronId` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(255) NOT NULL COMMENT '任务名',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不可用， 1可用',
  `mhdmd` varchar(255) NOT NULL COMMENT '音间',
  `command` varchar(255) NOT NULL COMMENT '命令',
  `params` varchar(255) NOT NULL COMMENT '参数',
  `process` varchar(255) NOT NULL DEFAULT '1' COMMENT '进程数',
  `isQueue` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1是对列 0不是',
  `runAt` varchar(255) NOT NULL DEFAULT '0' COMMENT '运行时间',
  `host` varchar(15) NOT NULL COMMENT '主机IP',
  `logFile` varchar(255) NOT NULL DEFAULT '' COMMENT '超时之后回调脚本',
  `timeout` int(11) NOT NULL DEFAULT '0' COMMENT '分钟',
  `user` varchar(255) NOT NULL,
  `errorLogUpdatedSize` varchar(255) NOT NULL DEFAULT '0' COMMENT '错误日志大小',
  PRIMARY KEY (`cronId`)
) ENGINE=MyISAM AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

INSERT INTO `sys_crontab` VALUES ('274', '测试', '1', '*/1 * * * *', '/data0/phpfpm/bin/php /root/test.php', '', '1', '0', '1390274563.96', '10.241.9.124', 'test.log', '5', '');

DROP TABLE IF EXISTS `sys_crontab_host`;
CREATE TABLE `sys_crontab_host` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) NOT NULL COMMENT '主机名',
  `host` varchar(15) NOT NULL COMMENT 'IP',
  `is_enable` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `sys_crontab_host` VALUES ('11', 'yiibook', '10.241.9.124', '1');

