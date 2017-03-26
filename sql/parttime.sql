/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : parttime

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-26 13:40:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dict_def
-- ----------------------------
DROP TABLE IF EXISTS `dict_def`;
CREATE TABLE `dict_def` (
  `dict_type` decimal(4,0) NOT NULL COMMENT '字典类型',
  `type_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '类型名称',
  `dict_class` decimal(6,0) NOT NULL COMMENT '字典类别',
  `class_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '类别名称',
  `entry_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '条目标识',
  `entry_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '条目名称',
  `entry_desc` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '条目描述',
  `parent_entry_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父条目标识',
  KEY `idx_dict_def1` (`dict_type`,`dict_class`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='数据字典表';

-- ----------------------------
-- Records of dict_def
-- ----------------------------
INSERT INTO `dict_def` VALUES ('100', '兼职时间单位', '1001', '兼职时间单位', '1', '天', null, null);
INSERT INTO `dict_def` VALUES ('100', '兼职时间单位', '1001', '兼职时间单位', '2', '小时', null, null);
INSERT INTO `dict_def` VALUES ('200', '用户状态', '2001', '状态', '0', '待审批', null, null);
INSERT INTO `dict_def` VALUES ('200', '用户状态', '2001', '状态', '1', '正常', null, null);
INSERT INTO `dict_def` VALUES ('200', '用户状态', '2001', '状态', '2', '驳回', null, null);
INSERT INTO `dict_def` VALUES ('300', '用户类型', '3001', '类型', '2', '商家', null, null);
INSERT INTO `dict_def` VALUES ('300', '用户类型', '3001', '类型', '3', '学生', null, null);

-- ----------------------------
-- Table structure for job_user
-- ----------------------------
DROP TABLE IF EXISTS `job_user`;
CREATE TABLE `job_user` (
  `flow_id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `employ_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0 等待答复  1 响应兼职  2 拒绝兼职',
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of job_user
-- ----------------------------

-- ----------------------------
-- Table structure for sm_user
-- ----------------------------
DROP TABLE IF EXISTS `sm_user`;
CREATE TABLE `sm_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `login_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `status` tinyint(4) DEFAULT '0' COMMENT '0 待审批  1 审批通过  2 审批驳回 3 黑名单',
  `user_type` tinyint(4) DEFAULT NULL COMMENT '1 超级管理员 2 商家  3 学生',
  `addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `credit_score` tinyint(4) DEFAULT '100' COMMENT '信用分',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sm_user
-- ----------------------------
INSERT INTO `sm_user` VALUES ('1', '多看卡', '123456', 'duwk', '18060480752', '1', '1', '二恶', '2017-03-22 21:01:10', '100');
INSERT INTO `sm_user` VALUES ('2', '张三', '123456', '张三', '18115', '2', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('3', '2李四', '1233223', '李四', '5244', '1', '3', '554', '2017-03-23 22:30:19', '100');
INSERT INTO `sm_user` VALUES ('4', '张三1', '123456', '张三1', '18115', '0', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('5', '张三2', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('6', '张三3', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('7', '张三4', '123456', '张三1', '18115', '2', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('8', '张三5', '123456', '张三1', '18115', '0', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('9', '张三6', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('10', '张三7', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('11', '张三8', '123456', '张三1', '18115', '0', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('12', '张三9', '123456', '张三1', '18115', '0', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('13', '张三10', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('14', '张三11', '123456', '张三1', '18115', '0', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('15', '张三12', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('16', '张三13', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('17', '张三14', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('18', '张三15', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('19', '张三16', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '80');
INSERT INTO `sm_user` VALUES ('20', '张三17', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '80');
INSERT INTO `sm_user` VALUES ('21', '张三18', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '80');
INSERT INTO `sm_user` VALUES ('22', '张三19', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');
INSERT INTO `sm_user` VALUES ('23', '张三20', '123456', '张三1', '18115', '0', '2', '大幅度', '2017-03-23 22:29:56', '100');
INSERT INTO `sm_user` VALUES ('24', '张三21', '123456', '张三1', '18115', '1', '2', '大幅度', '2017-03-23 22:29:56', '90');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建人',
  `salary` decimal(10,2) NOT NULL COMMENT '薪资',
  `addr` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `begin_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `contact_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `salary_unit` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '单位',
  `status` tinyint(4) DEFAULT '1' COMMENT '2驳回   1正常 ',
  `pic` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', '1', '12.00', '信达实际上看看', '要求女生', '2017-03-24', '2017-03-30', '122121', '彰显', '时', '2', 'aa');
INSERT INTO `t_job` VALUES ('2', '2', '100.00', '飒飒阿萨是', '爱谁谁', '2017-03-20', '2017-03-25', null, '彰显我', '天', '2', null);
INSERT INTO `t_job` VALUES ('3', '2', '77.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-30', null, '彰显', '天', '2', null);
INSERT INTO `t_job` VALUES ('4', '8', '88.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-22', null, '彰显1', '月', '1', null);
INSERT INTO `t_job` VALUES ('5', '2', '99.00', '飒飒阿萨是', '爱谁谁', '2017-03-19', '2017-03-24', null, '彰显2', '天', '1', null);
INSERT INTO `t_job` VALUES ('6', '4', '12.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显3', '天', '2', null);
INSERT INTO `t_job` VALUES ('7', '9', '12.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显', '天', '2', null);
INSERT INTO `t_job` VALUES ('8', '5', '100.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显4', '年', '2', null);
INSERT INTO `t_job` VALUES ('9', '2', '12.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显5', '天', '2', null);
INSERT INTO `t_job` VALUES ('10', '7', '100.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显6', '天', '1', null);
INSERT INTO `t_job` VALUES ('11', '2', '100.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显7', '时', '1', null);
INSERT INTO `t_job` VALUES ('12', '1', '100.00', '飒飒阿萨是', '爱谁谁', '2017-03-21', '2017-03-24', null, '彰显8', '天', '2', null);
INSERT INTO `t_job` VALUES ('13', '2', '22.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显8', '天', '2', null);
INSERT INTO `t_job` VALUES ('14', '3', '100.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显9', '时', '2', null);
INSERT INTO `t_job` VALUES ('15', '4', '77.00', '飒飒阿萨是', '爱谁谁', '2017-03-30', '2017-03-24', null, '彰显23', '天', '2', null);
INSERT INTO `t_job` VALUES ('16', '5', '22.00', '飒飒阿萨是', '爱谁谁', '2017-03-29', '2017-03-24', null, '彰显0', '天', '1', null);
INSERT INTO `t_job` VALUES ('17', '12', '44.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显0', '天', '1', null);
INSERT INTO `t_job` VALUES ('18', '10', '100.00', '飒飒阿萨是', '爱谁谁', '2017-03-24', '2017-03-24', null, '彰显', '天', '2', null);
INSERT INTO `t_job` VALUES ('19', '1', '1806005.00', 'kkkk', '1232', '2017-03-26', '2017-03-28', '18060051051', 'sdsa', '天', '1', null);
INSERT INTO `t_job` VALUES ('20', '1', '11.00', '闽江', '发单 8小时', '2017-03-26', '2017-03-28', '18060480720', '杜武凯', '时', '1', 'b7fecf8cc46b4b0dbf75f70f1e609d10.png');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_content` varchar(255) COLLATE utf8_bin NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '的功夫功夫', '2017-03-25 22:26:23');
INSERT INTO `t_notice` VALUES ('2', '看看我在认真的写代码 你看见了这几个字了没有\n', '2017-03-25 22:28:23');

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `user_id` int(11) NOT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `begin_time` date DEFAULT NULL COMMENT '学生兼职时间段开始',
  `end_time` date DEFAULT NULL COMMENT '学生兼职时间段结束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_detail
-- ----------------------------
