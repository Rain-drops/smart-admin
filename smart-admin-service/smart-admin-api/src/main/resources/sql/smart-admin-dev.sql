/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 127.0.0.1:3306
 Source Schema         : smart-admin-dev

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 11/09/2022 15:47:48
*/
CREATE DATABASE IF NOT EXISTS `smart-admin-dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smart-admin-dev`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('devClusteredScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('devClusteredScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('devClusteredScheduler', 'Jackie1662881722916', 1662882268698, 60000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门简称',
  `manager_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '部门负责人id',
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '部门的父级id',
  `sort` int(11) NOT NULL COMMENT '部门排序',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, '1024创新实验室', 'ZWGWL', 16, 0, 1, '2019-04-03 10:41:25', '2019-04-03 10:41:25');
INSERT INTO `t_department` VALUES (2, '二级部门-2', NULL, 15, 1, 17, '2019-04-15 16:45:10', '2019-04-15 16:45:10');
INSERT INTO `t_department` VALUES (4, '二级部门-1', '管理', 14, 1, 20, '2019-04-17 16:14:55', '2019-04-17 16:14:55');
INSERT INTO `t_department` VALUES (8, '三级部门-1', NULL, NULL, 4, 8, '2019-04-25 12:25:52', '2019-04-25 12:25:52');
INSERT INTO `t_department` VALUES (9, '四级部门-1', NULL, NULL, 8, 9, '2019-04-25 12:26:36', '2019-04-25 12:26:36');
INSERT INTO `t_department` VALUES (10, '五级部门-1', NULL, NULL, 9, 10, '2019-04-25 12:26:49', '2019-04-25 12:26:49');
INSERT INTO `t_department` VALUES (11, '六级部门-1', NULL, NULL, 10, 11, '2019-04-25 12:26:59', '2019-04-25 12:26:59');
INSERT INTO `t_department` VALUES (12, '七级部门-1', NULL, NULL, 11, 12, '2019-04-25 12:27:18', '2019-04-25 12:27:18');
INSERT INTO `t_department` VALUES (13, '八级部门-1', NULL, NULL, 12, 13, '2019-04-25 12:27:34', '2019-04-25 12:27:34');
INSERT INTO `t_department` VALUES (14, '九级部门-1', NULL, NULL, 13, 14, '2019-04-25 12:27:47', '2019-04-25 12:27:47');
INSERT INTO `t_department` VALUES (15, '十级部门-1', NULL, NULL, 14, 15, '2019-04-25 12:28:16', '2019-04-25 12:28:16');
INSERT INTO `t_department` VALUES (16, '十一级部门部门部部门门嘻嘻哈哈-1', NULL, 13, 15, 16, '2019-04-25 14:56:40', '2019-04-25 14:56:40');
INSERT INTO `t_department` VALUES (17, '信息中心', NULL, 16, 1, 4, '2019-04-26 11:53:50', '2019-04-26 11:53:50');
INSERT INTO `t_department` VALUES (18, '测试部门', NULL, 16, 17, 18, '2019-04-26 11:54:06', '2019-04-26 11:54:06');
INSERT INTO `t_department` VALUES (19, '张娇测试', NULL, NULL, 2, 22, '2019-04-26 14:36:18', '2019-04-26 14:36:18');
INSERT INTO `t_department` VALUES (20, '子部门', NULL, NULL, 2, 23, '2019-04-26 14:36:28', '2019-04-26 14:36:28');
INSERT INTO `t_department` VALUES (22, '张静如', NULL, 16, 1, 2, '2019-04-28 14:21:44', '2019-04-28 14:21:44');
INSERT INTO `t_department` VALUES (23, '张静如2', NULL, 22, 4, 19, '2019-04-28 14:22:48', '2019-04-28 14:22:48');
INSERT INTO `t_department` VALUES (24, '测试', NULL, 18, 23, 24, '2019-04-29 10:12:42', '2019-04-29 10:12:42');
INSERT INTO `t_department` VALUES (25, '测试', NULL, 18, 23, 25, '2019-04-29 10:12:42', '2019-04-29 10:12:42');

-- ----------------------------
-- Table structure for t_email
-- ----------------------------
DROP TABLE IF EXISTS `t_email`;
CREATE TABLE `t_email`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `to_emails` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人',
  `send_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发送状态 0未发送 1已发送',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_email
-- ----------------------------
INSERT INTO `t_email` VALUES (20, '新增测试12345', '新增测试@11.com', 1, '<p>这是内容</p>', '2019-08-30 15:35:12', '2019-08-30 15:35:12');
INSERT INTO `t_email` VALUES (21, 'b', 'asdf@33.com', 1, '<p>c</p>', '2019-09-06 14:25:33', '2019-09-06 14:25:33');
INSERT INTO `t_email` VALUES (23, 'string', 'string', 0, 'string', '2019-09-06 06:55:01', '2019-09-06 06:55:01');
INSERT INTO `t_email` VALUES (24, 'string', 'string', 0, 'string', '2019-09-06 06:55:01', '2019-09-06 06:55:01');
INSERT INTO `t_email` VALUES (26, 'string', 'string', 0, 'string', '2019-09-06 07:01:32', '2019-09-06 07:01:32');
INSERT INTO `t_email` VALUES (27, 'string', 'string', 0, 'string', '2019-09-06 07:01:32', '2019-09-06 07:01:32');
INSERT INTO `t_email` VALUES (37, 'ewqwe', '适者生存@22.cc', 1, '<p>qweqwe</p>', '2019-11-09 10:00:46', '2019-11-09 10:00:46');
INSERT INTO `t_email` VALUES (38, 'ewqwe', '适者生存@22.cc', 1, '<p>qweqwe</p>', '2019-11-09 10:00:49', '2019-11-09 10:00:49');
INSERT INTO `t_email` VALUES (39, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:54', '2019-11-09 10:04:54');
INSERT INTO `t_email` VALUES (40, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:57', '2019-11-09 10:04:57');
INSERT INTO `t_email` VALUES (41, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:57', '2019-11-09 10:04:57');
INSERT INTO `t_email` VALUES (42, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:58', '2019-11-09 10:04:58');
INSERT INTO `t_email` VALUES (43, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:59', '2019-11-09 10:04:59');
INSERT INTO `t_email` VALUES (44, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:59', '2019-11-09 10:04:59');
INSERT INTO `t_email` VALUES (45, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:05:16', '2019-11-09 10:05:16');
INSERT INTO `t_email` VALUES (46, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:06:29', '2019-11-09 10:06:29');
INSERT INTO `t_email` VALUES (47, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:07:02', '2019-11-09 10:07:02');
INSERT INTO `t_email` VALUES (48, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:07:16', '2019-11-09 10:07:16');
INSERT INTO `t_email` VALUES (49, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:13', '2019-11-09 10:08:13');
INSERT INTO `t_email` VALUES (50, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:30', '2019-11-09 10:08:30');
INSERT INTO `t_email` VALUES (51, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:50', '2019-11-09 10:08:50');
INSERT INTO `t_email` VALUES (52, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:09:09', '2019-11-09 10:09:09');
INSERT INTO `t_email` VALUES (53, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:09:31', '2019-11-09 10:09:31');
INSERT INTO `t_email` VALUES (54, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:12:24', '2019-11-09 10:12:24');
INSERT INTO `t_email` VALUES (55, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:13:13', '2019-11-09 10:13:13');
INSERT INTO `t_email` VALUES (56, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:20:42', '2019-11-09 10:20:42');
INSERT INTO `t_email` VALUES (57, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:20:52', '2019-11-09 10:20:52');
INSERT INTO `t_email` VALUES (58, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:16', '2019-11-09 10:21:16');
INSERT INTO `t_email` VALUES (59, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:24', '2019-11-09 10:21:24');
INSERT INTO `t_email` VALUES (60, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:30', '2019-11-09 10:21:30');
INSERT INTO `t_email` VALUES (61, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:53', '2019-11-09 10:21:53');
INSERT INTO `t_email` VALUES (62, 'a21312', '23423@qq.cc', 0, '<p>asdasdas</p>', '2019-11-09 10:23:40', '2019-11-09 10:23:40');
INSERT INTO `t_email` VALUES (63, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:12', '2019-11-15 15:35:12');
INSERT INTO `t_email` VALUES (64, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:15', '2019-11-15 15:35:15');
INSERT INTO `t_email` VALUES (65, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:16', '2019-11-15 15:35:16');
INSERT INTO `t_email` VALUES (66, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:00', '2019-11-15 17:00:00');
INSERT INTO `t_email` VALUES (67, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:03', '2019-11-15 17:00:03');
INSERT INTO `t_email` VALUES (68, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:04', '2019-11-15 17:00:04');
INSERT INTO `t_email` VALUES (69, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:33', '2019-11-15 17:00:33');
INSERT INTO `t_email` VALUES (70, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:34', '2019-11-15 17:00:34');
INSERT INTO `t_email` VALUES (71, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:34', '2019-11-15 17:00:34');
INSERT INTO `t_email` VALUES (72, '22223', '12232', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:49', '2019-11-15 17:00:49');
INSERT INTO `t_email` VALUES (73, '22223', '12232@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:56', '2019-11-15 17:00:56');
INSERT INTO `t_email` VALUES (74, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 08:51:44', '2019-11-16 08:51:44');
INSERT INTO `t_email` VALUES (75, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:05:10', '2019-11-16 09:05:10');
INSERT INTO `t_email` VALUES (76, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:05:14', '2019-11-16 09:05:14');
INSERT INTO `t_email` VALUES (77, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:06:34', '2019-11-16 09:06:34');
INSERT INTO `t_email` VALUES (78, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:09', '2019-11-16 09:07:09');
INSERT INTO `t_email` VALUES (79, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:30', '2019-11-16 09:07:30');
INSERT INTO `t_email` VALUES (80, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:32', '2019-11-16 09:07:32');
INSERT INTO `t_email` VALUES (81, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:08:29', '2019-11-16 09:08:29');
INSERT INTO `t_email` VALUES (82, 'sdfs', 'ss@ss.cc', 0, '<p>dsdsf</p>', '2019-11-16 09:08:46', '2019-11-16 09:08:46');
INSERT INTO `t_email` VALUES (83, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:18', '2019-11-16 09:09:18');
INSERT INTO `t_email` VALUES (84, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:42', '2019-11-16 09:09:42');
INSERT INTO `t_email` VALUES (85, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:46', '2019-11-16 09:09:46');
INSERT INTO `t_email` VALUES (86, 'dasdad', 'dasda@ss.cc', 1, '<p>dasasdas</p>', '2019-11-16 09:10:05', '2019-11-16 09:10:05');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `login_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `actual_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工名称',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '别名',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `department_id` int(10) UNSIGNED NOT NULL COMMENT '部门id',
  `is_leave` int(11) NOT NULL DEFAULT 0 COMMENT '是否离职1是',
  `is_disabled` int(11) NOT NULL DEFAULT 0 COMMENT '是否被禁用 0否1是',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` int(10) UNSIGNED NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (1, 'sa', 'c655798e4648c540812a1b8f48759af7', '管理员', '15515515515', '13112312131', '410306199202020020', '1992-02-02', NULL, 1, 0, 0, NULL, 0, '2019-04-27 09:56:17', '2018-05-11 09:38:54', 0);
INSERT INTO `t_employee` VALUES (11, 'role1', 'c655798e4648c540812a1b8f48759af7', '角色测试1', '', '18123245230', '', '1970-01-01', '', 4, 0, 0, NULL, 1, '2019-04-27 09:56:17', '2019-04-25 12:30:22', 0);
INSERT INTO `t_employee` VALUES (12, 'role2', 'c655798e4648c540812a1b8f48759af7', '角色测试2', '', '18121451241', '', NULL, '', 4, 0, 0, NULL, 1, '2019-08-01 10:04:38', '2019-04-25 12:31:11', 0);
INSERT INTO `t_employee` VALUES (13, 'lihaifan', 'c655798e4648c540812a1b8f48759af7', 'lihaifan', '', '18399485774', '', NULL, '', 1, 0, 0, NULL, 1, '2019-04-27 09:56:17', '2019-04-25 13:50:44', 0);
INSERT INTO `t_employee` VALUES (14, 'lipeng', 'c655798e4648c540812a1b8f48759af7', '李鹏1', '', '13937988294', '', NULL, '', 2, 0, 0, NULL, 1, '2019-04-27 09:56:17', '2019-04-25 14:34:47', 0);
INSERT INTO `t_employee` VALUES (15, 'huangwenli', 'c655798e4648c540812a1b8f48759af7', '黄文丽', '', '15515515515', '', NULL, '', 16, 0, 0, NULL, 1, '2019-04-27 09:56:17', '2019-04-26 10:05:05', 0);
INSERT INTO `t_employee` VALUES (16, 'huangwenli1', 'c655798e4648c540812a1b8f48759af7', '黄文丽', '', '15515515515', '', NULL, '', 15, 0, 0, NULL, 1, '2019-04-27 14:04:19', '2019-04-26 10:25:04', 0);
INSERT INTO `t_employee` VALUES (17, 'zhangjiao', 'c655798e4648c540812a1b8f48759af7', '张娇', '阿娇', '15670390391', '410305199102020020', '1991-02-02', '86484@qq.com', 19, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-04-26 14:37:23', 0);
INSERT INTO `t_employee` VALUES (18, 'zhangjiao1', 'c655798e4648c540812a1b8f48759af7', '张娇1', '', '15670390391', '', '2019-04-18', '6666@qq.com', 20, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-04-26 14:45:55', 0);
INSERT INTO `t_employee` VALUES (19, 'zhenxiaocang', 'c655798e4648c540812a1b8f48759af7', '珍小藏', '', '15670390391', '', NULL, '', 19, 0, 1, NULL, 1, '2019-09-09 08:34:35', '2019-04-26 14:46:57', 0);
INSERT INTO `t_employee` VALUES (20, 'matengfei', 'c655798e4648c540812a1b8f48759af7', '马腾飞', '', '15670390393', '', NULL, '', 19, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-04-26 14:47:24', 0);
INSERT INTO `t_employee` VALUES (21, 'ceshi123', 'c655798e4648c540812a1b8f48759af7', '测试人员', '', '18829938477', '', NULL, '', 1, 0, 1, NULL, 13, '2019-04-27 09:56:17', '2019-04-27 09:38:07', 1);
INSERT INTO `t_employee` VALUES (22, 'zhangjingru', 'c655798e4648c540812a1b8f48759af7', '张静如', '', '15600000000', '', NULL, '', 1, 0, 0, NULL, 1, '2019-09-04 09:06:47', '2019-04-28 14:05:03', 0);
INSERT INTO `t_employee` VALUES (23, 'sdfsdfdsfsdfdsfdsf', 'c655798e4648c540812a1b8f48759af7', 'werewr', '', '15698585858', '', NULL, '', 19, 0, 0, NULL, 1, '2019-09-05 16:13:03', '2019-04-28 16:26:27', 0);
INSERT INTO `t_employee` VALUES (25, 'shq2019', 'c655798e4648c540812a1b8f48759af7', 'shq', 'shq', '18798801298', '410281199309024040', '1993-09-02', '', 17, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-05-05 09:13:41', 0);
INSERT INTO `t_employee` VALUES (26, 'zhangjiao666', 'c655798e4648c540812a1b8f48759af7', 'tom我是五个字12', '', '15612345678', '', NULL, '', 18, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-05-05 15:34:10', 0);
INSERT INTO `t_employee` VALUES (28, 'dfsfgds', 'c655798e4648c540812a1b8f48759af7', 'fds', '', '15854127845', '', NULL, '', 22, 0, 1, NULL, 1, '2019-09-06 08:58:40', '2019-05-06 10:36:57', 0);
INSERT INTO `t_employee` VALUES (29, 'abcabc', 'c655798e4648c540812a1b8f48759af7', 'abccba', 'aaabac', '13311112222', '', NULL, '', 17, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-07-10 17:00:58', 0);
INSERT INTO `t_employee` VALUES (30, 'gengweigang', 'c655798e4648c540812a1b8f48759af7', '耿为刚', 'geng', '15038588418', '', NULL, '', 17, 0, 0, NULL, 1, '2019-08-08 14:35:51', '2019-08-08 14:35:51', 0);
INSERT INTO `t_employee` VALUES (31, 'gengweigang1', 'c655798e4648c540812a1b8f48759af7', '耿为刚1', '这是别名', '15038588418', '410322193312123232', '1933-12-12', '32@qq.com', 18, 0, 0, NULL, 30, '2019-08-23 09:27:22', '2019-08-23 09:25:50', 0);
INSERT INTO `t_employee` VALUES (32, 'ceshi123', 'c655798e4648c540812a1b8f48759af7', '测试', '测试', '15670702651', '', NULL, '', 17, 0, 0, NULL, 1, '2019-09-04 09:05:48', '2019-09-03 11:48:04', 0);
INSERT INTO `t_employee` VALUES (33, 'ceshi321', 'c655798e4648c540812a1b8f48759af7', '测试', '测试', '15670702651', '', NULL, '', 17, 0, 1, NULL, 1, '2019-09-03 15:51:16', '2019-09-03 11:49:17', 0);
INSERT INTO `t_employee` VALUES (34, 'ceshi123321', 'c655798e4648c540812a1b8f48759af7', '123', '', '15600000000', '', NULL, '', 22, 0, 1, NULL, 1, '2019-09-06 08:58:37', '2019-09-04 09:13:54', 0);
INSERT INTO `t_employee` VALUES (35, 'guoqingfeng', 'c655798e4648c540812a1b8f48759af7', '郭青枫', '', '15670702651', '', NULL, '', 18, 0, 0, NULL, 1, '2019-09-04 15:09:00', '2019-09-04 15:09:00', 0);
INSERT INTO `t_employee` VALUES (36, 'li327263458', 'c655798e4648c540812a1b8f48759af7', 'lipeng', '', '13937988294', '', NULL, '', 17, 0, 0, NULL, 1, '2019-09-09 17:01:39', '2019-09-09 17:01:39', 0);
INSERT INTO `t_employee` VALUES (37, 'test123', 'c655798e4648c540812a1b8f48759af7', 'test', '', '13211110201', '', NULL, '', 18, 0, 1, NULL, 1, '2019-11-14 16:08:08', '2019-11-08 09:32:39', 0);
INSERT INTO `t_employee` VALUES (38, 'tiantian', 'c655798e4648c540812a1b8f48759af7', '天天管理员', '', '13574502368', '', NULL, '', 17, 0, 0, NULL, 1, '2019-11-14 02:08:08', '2019-11-08 11:09:46', 0);
INSERT INTO `t_employee` VALUES (39, 'wang13211111', 'c655798e4648c540812a1b8f48759af7', 'ceshi111', 'dddd', '13244553212', '', NULL, '', 25, 0, 0, NULL, 38, '2019-11-15 17:14:34', '2019-11-15 17:03:04', 0);

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关业务id',
  `module_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关业务类型',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型，程序中枚举控制，文件类型：如身份证正面，三证合一等等',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件key，用于文件下载',
  `file_location_type` int(11) NOT NULL COMMENT '文件位置类型',
  `creater_user` int(11) NOT NULL COMMENT '创建人，即上传人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module_id_module_type`(`module_id`, `module_type`) USING BTREE,
  INDEX `module_type`(`module_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_file
-- ----------------------------
INSERT INTO `t_file` VALUES (1, '1', '1', '阿里云1.jpg', NULL, NULL, 'backUser/config/d1788b717be24f14ba526f25397b936f', 2, 1, NULL, '2019-07-05 10:38:15');
INSERT INTO `t_file` VALUES (2, '2', '1', '1.jpg', NULL, NULL, 'backUser/config/8895ec770c4e4e558c6d9b54eb00dffc', 2, 1, '2019-07-18 09:20:59', '2019-07-18 09:20:25');
INSERT INTO `t_file` VALUES (3, '3', '1', '随笔.txt', NULL, NULL, 'backUser/config/f5cbc4c9a56f4fa7ad0ba58b0aa5d169', 2, 1, NULL, '2019-07-18 09:22:47');
INSERT INTO `t_file` VALUES (4, '3', '1', '1.jpg', NULL, NULL, 'backUser/config/2019071809245603e0a4e449a4bf3aa28ee731c309040.jpg', 1, 1, NULL, '2019-07-18 09:24:51');
INSERT INTO `t_file` VALUES (6, '4', '1', '1.jpg', NULL, NULL, 'backUser/config/ddcb8214ba274dec9bb2c33e0e246391', 3, 1, NULL, '2019-07-19 16:19:43');
INSERT INTO `t_file` VALUES (7, '5', '1', 'sql.txt', NULL, NULL, 'backUser/config/cfbdf9562c894405b5b6f64f71fa812a', 3, 1, NULL, '2019-07-19 17:41:55');
INSERT INTO `t_file` VALUES (9, '1', '1', '20190912023241a6132f5713b54e1fb490f4ea88115747.md', NULL, NULL, 'backUser/config/20190912023241a6132f5713b54e1fb490f4ea88115747.md', 1, 1, '2019-09-12 15:25:35', '2019-09-12 14:32:42');
INSERT INTO `t_file` VALUES (10, '1', '1', '201909120232499804998573f643ff8e58189d23485629.mjs', NULL, NULL, 'backUser/config/201909120232499804998573f643ff8e58189d23485629.mjs', 1, 1, '2019-09-12 15:25:19', '2019-09-12 14:32:50');
INSERT INTO `t_file` VALUES (11, '1', '1', '201909120326564cdc8df7b8cc49cfb273926877f047f5.json', NULL, NULL, 'backUser/config/201909120326564cdc8df7b8cc49cfb273926877f047f5.json', 1, 1, NULL, '2019-09-12 15:26:56');
INSERT INTO `t_file` VALUES (12, '1', '1', '201909120343357104b7f1cc684f5797ada35c06aba770.json', NULL, NULL, 'backUser/config/201909120343357104b7f1cc684f5797ada35c06aba770.json', 1, 1, NULL, '2019-09-12 15:43:36');
INSERT INTO `t_file` VALUES (13, '1', '1', '201909120343427e408141a0ea467ea2e012f7086a6265.json', NULL, NULL, 'backUser/config/201909120343427e408141a0ea467ea2e012f7086a6265.json', 1, 1, NULL, '2019-09-12 15:43:42');
INSERT INTO `t_file` VALUES (14, '1', '1', '20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts', NULL, NULL, 'backUser/config/20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts', 1, 1, NULL, '2019-09-12 15:45:43');
INSERT INTO `t_file` VALUES (15, '1', '1', '20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md', NULL, NULL, 'backUser/config/20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md', 1, 1, NULL, '2019-09-12 15:45:51');
INSERT INTO `t_file` VALUES (16, '1', '1', 'LICENCE', NULL, NULL, 'backUser/config/cc02b99c0ec548f1a2231b70b7d569b8', 2, 1, NULL, '2019-09-12 15:47:22');
INSERT INTO `t_file` VALUES (17, '1', '1', 'bignumber.min.js', NULL, NULL, 'backUser/config/bda49e8ad6d242fe8735b2023dfbf125', 2, 1, NULL, '2019-09-12 15:47:29');
INSERT INTO `t_file` VALUES (18, '1', '1', '20190912034880a881fa8fbc841bfb7194ff312bd1058.json', NULL, NULL, 'backUser/config/20190912034880a881fa8fbc841bfb7194ff312bd1058.json', 1, 1, NULL, '2019-09-12 15:48:08');
INSERT INTO `t_file` VALUES (19, '1', '1', '20190912034816ece14084acf345a79396a0f4347c4e44.md', NULL, NULL, 'backUser/config/20190912034816ece14084acf345a79396a0f4347c4e44.md', 1, 1, NULL, '2019-09-12 15:48:16');
INSERT INTO `t_file` VALUES (20, '1', '1', '20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg', NULL, NULL, 'backUser/config/20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg', 1, 1, NULL, '2019-10-24 17:44:13');
INSERT INTO `t_file` VALUES (21, '1', '1', '20191106042073f7ef01bde3046bd8e01928f397230bd.jpg', NULL, NULL, 'backUser/config/20191106042073f7ef01bde3046bd8e01928f397230bd.jpg', 1, 1, NULL, '2019-11-06 02:20:13');
INSERT INTO `t_file` VALUES (22, '1', '1', '201911130802024b8a2ebf80543a98241bb464682650d.jpg', NULL, NULL, 'backUser/config/201911130802024b8a2ebf80543a98241bb464682650d.jpg', 1, 1, NULL, '2019-11-13 06:02:01');
INSERT INTO `t_file` VALUES (23, '1', '1', '20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg', NULL, NULL, 'backUser/config/20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg', 1, 1, NULL, '2019-11-13 06:02:14');
INSERT INTO `t_file` VALUES (24, '1', '1', '20191115043844e92b25e70fb140a1885614b978469ca9.jpg', NULL, NULL, 'backUser/config/20191115043844e92b25e70fb140a1885614b978469ca9.jpg', 1, 38, NULL, '2019-11-15 02:38:45');
INSERT INTO `t_file` VALUES (25, '1', '1', '20191116060546d3a2c703cb5546b3851612907cc3786f.png', NULL, NULL, 'backUser/config/20191116060546d3a2c703cb5546b3851612907cc3786f.png', 1, 1, NULL, '2019-11-16 10:05:47');

-- ----------------------------
-- Table structure for t_heart_beat_record
-- ----------------------------
DROP TABLE IF EXISTS `t_heart_beat_record`;
CREATE TABLE `t_heart_beat_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `project_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '项目名称',
  `server_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '服务器ip',
  `process_no` int(11) NULL DEFAULT NULL COMMENT '进程号',
  `process_start_time` datetime(0) NULL DEFAULT NULL COMMENT '进程开启时间',
  `heart_beat_time` datetime(0) NULL DEFAULT NULL COMMENT '心跳时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_heart_beat_record
-- ----------------------------
INSERT INTO `t_heart_beat_record` VALUES (1, '/home/server/smart-admin/dev', '192.168.122.1;172.16.0.145', 14843, '2019-11-16 03:11:50', '2019-11-16 03:58:01');
INSERT INTO `t_heart_beat_record` VALUES (2, 'F:\\codespace\\idea\\gangquan360\\foundation', '172.16.1.188;192.168.56.1', 227992, '2019-11-16 10:02:39', '2019-11-16 10:06:50');
INSERT INTO `t_heart_beat_record` VALUES (3, 'E:\\codespace\\zhuoda', '192.168.8.188', 17564, '2020-12-14 07:11:12', '2020-12-14 07:13:34');
INSERT INTO `t_heart_beat_record` VALUES (4, 'E:\\codespace\\zhuoda', '192.168.8.188', 15568, '2020-12-14 07:13:53', '2020-12-14 07:15:00');
INSERT INTO `t_heart_beat_record` VALUES (5, 'E:\\codespace\\zhuoda', '192.168.8.188', 16548, '2020-12-14 07:16:07', '2020-12-14 07:17:14');
INSERT INTO `t_heart_beat_record` VALUES (6, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 12640, '2022-09-03 08:26:27', '2022-09-03 15:27:39');
INSERT INTO `t_heart_beat_record` VALUES (7, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 6592, '2022-09-04 04:22:27', '2022-09-04 04:23:38');
INSERT INTO `t_heart_beat_record` VALUES (8, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 18216, '2022-09-04 04:28:47', '2022-09-04 04:29:59');
INSERT INTO `t_heart_beat_record` VALUES (9, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 16472, '2022-09-04 04:35:36', '2022-09-04 04:36:46');
INSERT INTO `t_heart_beat_record` VALUES (10, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 18920, '2022-09-04 04:37:36', '2022-09-04 04:38:47');
INSERT INTO `t_heart_beat_record` VALUES (11, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 2516, '2022-09-04 04:58:49', '2022-09-04 05:10:00');
INSERT INTO `t_heart_beat_record` VALUES (12, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 2756, '2022-09-04 05:37:16', '2022-09-04 05:38:27');
INSERT INTO `t_heart_beat_record` VALUES (13, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 19248, '2022-09-04 05:46:24', '2022-09-04 05:47:35');
INSERT INTO `t_heart_beat_record` VALUES (14, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 13348, '2022-09-04 05:48:42', '2022-09-04 05:49:53');
INSERT INTO `t_heart_beat_record` VALUES (15, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 13220, '2022-09-04 06:40:25', '2022-09-04 06:46:36');
INSERT INTO `t_heart_beat_record` VALUES (16, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 9132, '2022-09-04 06:51:02', '2022-09-04 06:52:13');
INSERT INTO `t_heart_beat_record` VALUES (17, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 4144, '2022-09-04 06:53:25', '2022-09-04 06:54:37');
INSERT INTO `t_heart_beat_record` VALUES (18, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 19368, '2022-09-04 06:57:32', '2022-09-04 06:58:42');
INSERT INTO `t_heart_beat_record` VALUES (19, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 15084, '2022-09-04 07:00:28', '2022-09-04 07:01:40');
INSERT INTO `t_heart_beat_record` VALUES (20, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 17432, '2022-09-04 07:04:58', '2022-09-04 07:06:10');
INSERT INTO `t_heart_beat_record` VALUES (21, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 18924, '2022-09-04 07:09:16', '2022-09-04 07:10:26');
INSERT INTO `t_heart_beat_record` VALUES (22, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 14244, '2022-09-04 07:13:24', '2022-09-04 07:15:27');
INSERT INTO `t_heart_beat_record` VALUES (23, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 15492, '2022-09-04 07:16:51', '2022-09-04 07:38:02');
INSERT INTO `t_heart_beat_record` VALUES (24, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 19120, '2022-09-04 07:42:04', '2022-09-04 07:53:16');
INSERT INTO `t_heart_beat_record` VALUES (25, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 6152, '2022-09-04 07:55:20', '2022-09-04 07:56:31');
INSERT INTO `t_heart_beat_record` VALUES (26, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 19356, '2022-09-04 08:02:28', '2022-09-04 08:03:38');
INSERT INTO `t_heart_beat_record` VALUES (27, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 13716, '2022-09-04 11:48:10', '2022-09-04 11:49:22');
INSERT INTO `t_heart_beat_record` VALUES (28, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 10760, '2022-09-04 11:57:38', '2022-09-04 11:58:49');
INSERT INTO `t_heart_beat_record` VALUES (29, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 16952, '2022-09-04 12:00:19', '2022-09-04 12:11:30');
INSERT INTO `t_heart_beat_record` VALUES (30, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 2532, '2022-09-04 12:15:13', '2022-09-04 12:16:24');
INSERT INTO `t_heart_beat_record` VALUES (31, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 18312, '2022-09-04 12:18:56', '2022-09-04 12:20:08');
INSERT INTO `t_heart_beat_record` VALUES (32, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 3432, '2022-09-04 12:24:03', '2022-09-04 12:30:15');
INSERT INTO `t_heart_beat_record` VALUES (33, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 10916, '2022-09-04 12:32:39', '2022-09-04 12:33:50');
INSERT INTO `t_heart_beat_record` VALUES (34, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 5132, '2022-09-04 13:20:17', '2022-09-04 13:21:34');
INSERT INTO `t_heart_beat_record` VALUES (35, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 10472, '2022-09-04 13:22:18', '2022-09-04 13:23:46');
INSERT INTO `t_heart_beat_record` VALUES (36, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 16508, '2022-09-04 13:24:16', '2022-09-04 13:25:29');
INSERT INTO `t_heart_beat_record` VALUES (37, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 5932, '2022-09-04 13:30:18', '2022-09-04 13:31:29');
INSERT INTO `t_heart_beat_record` VALUES (38, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 2204, '2022-09-04 13:32:59', '2022-09-04 13:59:12');
INSERT INTO `t_heart_beat_record` VALUES (39, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.69.16;192.168.196.1;172.29.240.1', 19644, '2022-09-04 14:00:36', '2022-09-04 14:01:47');
INSERT INTO `t_heart_beat_record` VALUES (40, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 5820, '2022-09-05 13:46:06', '2022-09-05 15:12:19');
INSERT INTO `t_heart_beat_record` VALUES (41, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 16516, '2022-09-05 15:55:38', '2022-09-05 17:06:51');
INSERT INTO `t_heart_beat_record` VALUES (42, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 2796, '2022-09-05 17:21:19', '2022-09-05 17:27:30');
INSERT INTO `t_heart_beat_record` VALUES (43, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 3480, '2022-09-06 12:23:34', '2022-09-06 13:39:48');
INSERT INTO `t_heart_beat_record` VALUES (44, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 14676, '2022-09-06 13:44:02', '2022-09-06 13:45:13');
INSERT INTO `t_heart_beat_record` VALUES (45, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 2496, '2022-09-06 13:49:26', '2022-09-06 14:05:37');
INSERT INTO `t_heart_beat_record` VALUES (46, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 15540, '2022-09-06 14:07:56', '2022-09-06 14:24:07');
INSERT INTO `t_heart_beat_record` VALUES (47, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 1864, '2022-09-06 14:25:48', '2022-09-06 14:41:58');
INSERT INTO `t_heart_beat_record` VALUES (48, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 16876, '2022-09-06 14:45:15', '2022-09-06 14:46:27');
INSERT INTO `t_heart_beat_record` VALUES (49, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 2828, '2022-09-06 14:46:48', '2022-09-06 16:12:58');
INSERT INTO `t_heart_beat_record` VALUES (50, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1;172.29.240.1', 6272, '2022-09-06 16:17:28', '2022-09-06 17:08:40');
INSERT INTO `t_heart_beat_record` VALUES (51, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 13320, '2022-09-09 13:46:58', '2022-09-09 13:58:11');
INSERT INTO `t_heart_beat_record` VALUES (52, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 9544, '2022-09-09 14:01:36', '2022-09-09 14:07:55');
INSERT INTO `t_heart_beat_record` VALUES (53, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 5428, '2022-09-09 14:08:21', '2022-09-09 14:09:30');
INSERT INTO `t_heart_beat_record` VALUES (54, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 13812, '2022-09-09 14:11:18', '2022-09-09 14:12:28');
INSERT INTO `t_heart_beat_record` VALUES (55, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 6724, '2022-09-09 14:15:32', '2022-09-09 14:16:42');
INSERT INTO `t_heart_beat_record` VALUES (56, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 4408, '2022-09-09 14:18:20', '2022-09-09 14:19:30');
INSERT INTO `t_heart_beat_record` VALUES (57, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 3272, '2022-09-09 14:19:36', '2022-09-09 14:20:46');
INSERT INTO `t_heart_beat_record` VALUES (58, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 15904, '2022-09-09 14:21:18', '2022-09-09 14:22:27');
INSERT INTO `t_heart_beat_record` VALUES (59, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 16060, '2022-09-09 14:25:09', '2022-09-09 16:16:21');
INSERT INTO `t_heart_beat_record` VALUES (60, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 32, '2022-09-09 16:21:09', '2022-09-09 16:22:20');
INSERT INTO `t_heart_beat_record` VALUES (61, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 18388, '2022-09-09 16:23:03', '2022-09-09 16:44:14');
INSERT INTO `t_heart_beat_record` VALUES (62, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 17192, '2022-09-09 16:46:56', '2022-09-09 17:43:08');
INSERT INTO `t_heart_beat_record` VALUES (63, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 14108, '2022-09-10 01:42:09', '2022-09-10 02:43:19');
INSERT INTO `t_heart_beat_record` VALUES (64, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 8652, '2022-09-10 05:34:25', '2022-09-10 05:40:35');
INSERT INTO `t_heart_beat_record` VALUES (65, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 19788, '2022-09-10 05:44:04', '2022-09-10 05:50:16');
INSERT INTO `t_heart_beat_record` VALUES (66, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 8452, '2022-09-10 05:50:53', '2022-09-10 05:52:03');
INSERT INTO `t_heart_beat_record` VALUES (67, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 16668, '2022-09-10 05:56:02', '2022-09-10 05:57:13');
INSERT INTO `t_heart_beat_record` VALUES (68, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 16424, '2022-09-10 06:00:11', '2022-09-10 06:01:21');
INSERT INTO `t_heart_beat_record` VALUES (69, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 18096, '2022-09-10 06:03:19', '2022-09-10 06:04:29');
INSERT INTO `t_heart_beat_record` VALUES (70, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 18764, '2022-09-10 06:08:17', '2022-09-10 07:00:08');
INSERT INTO `t_heart_beat_record` VALUES (71, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 2944, '2022-09-10 07:05:10', '2022-09-10 07:06:20');
INSERT INTO `t_heart_beat_record` VALUES (72, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 16080, '2022-09-10 07:07:16', '2022-09-10 07:23:26');
INSERT INTO `t_heart_beat_record` VALUES (73, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 17008, '2022-09-10 07:27:38', '2022-09-10 07:33:48');
INSERT INTO `t_heart_beat_record` VALUES (74, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 19224, '2022-09-10 07:38:12', '2022-09-10 07:39:22');
INSERT INTO `t_heart_beat_record` VALUES (75, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 9868, '2022-09-10 07:39:55', '2022-09-10 08:31:17');
INSERT INTO `t_heart_beat_record` VALUES (76, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 5028, '2022-09-10 08:32:03', '2022-09-10 08:33:14');
INSERT INTO `t_heart_beat_record` VALUES (77, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 16876, '2022-09-10 08:36:49', '2022-09-10 08:38:16');
INSERT INTO `t_heart_beat_record` VALUES (78, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 18636, '2022-09-10 08:40:36', '2022-09-10 08:41:46');
INSERT INTO `t_heart_beat_record` VALUES (79, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 6780, '2022-09-10 08:42:47', '2022-09-10 08:53:57');
INSERT INTO `t_heart_beat_record` VALUES (80, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 8044, '2022-09-10 08:55:26', '2022-09-10 08:56:36');
INSERT INTO `t_heart_beat_record` VALUES (81, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 19948, '2022-09-10 09:03:25', '2022-09-10 09:04:35');
INSERT INTO `t_heart_beat_record` VALUES (82, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 14508, '2022-09-10 09:05:51', '2022-09-10 09:07:01');
INSERT INTO `t_heart_beat_record` VALUES (83, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 19676, '2022-09-10 09:07:50', '2022-09-10 09:09:00');
INSERT INTO `t_heart_beat_record` VALUES (84, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 18484, '2022-09-10 09:11:29', '2022-09-10 09:12:39');
INSERT INTO `t_heart_beat_record` VALUES (85, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 12956, '2022-09-10 09:16:58', '2022-09-10 09:18:08');
INSERT INTO `t_heart_beat_record` VALUES (86, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 15812, '2022-09-10 09:19:06', '2022-09-10 09:45:16');
INSERT INTO `t_heart_beat_record` VALUES (87, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 1704, '2022-09-10 09:45:30', '2022-09-10 09:46:40');
INSERT INTO `t_heart_beat_record` VALUES (88, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 12304, '2022-09-10 09:48:38', '2022-09-10 12:54:48');
INSERT INTO `t_heart_beat_record` VALUES (89, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 7312, '2022-09-10 12:57:08', '2022-09-10 15:13:21');
INSERT INTO `t_heart_beat_record` VALUES (90, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 10104, '2022-09-10 15:18:23', '2022-09-10 15:29:35');
INSERT INTO `t_heart_beat_record` VALUES (91, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 13388, '2022-09-10 15:32:08', '2022-09-10 15:38:18');
INSERT INTO `t_heart_beat_record` VALUES (92, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 19628, '2022-09-10 15:39:58', '2022-09-10 16:06:08');
INSERT INTO `t_heart_beat_record` VALUES (93, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 20340, '2022-09-10 16:08:05', '2022-09-10 16:09:16');
INSERT INTO `t_heart_beat_record` VALUES (94, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 2152, '2022-09-10 16:10:53', '2022-09-10 16:12:02');
INSERT INTO `t_heart_beat_record` VALUES (95, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 14888, '2022-09-10 16:12:23', '2022-09-10 16:14:45');
INSERT INTO `t_heart_beat_record` VALUES (96, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 20316, '2022-09-10 16:17:42', '2022-09-10 16:18:51');
INSERT INTO `t_heart_beat_record` VALUES (97, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 9104, '2022-09-10 16:23:25', '2022-09-10 16:24:35');
INSERT INTO `t_heart_beat_record` VALUES (98, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 3432, '2022-09-11 02:16:54', '2022-09-11 02:53:08');
INSERT INTO `t_heart_beat_record` VALUES (99, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 6564, '2022-09-11 02:59:16', '2022-09-11 03:25:26');
INSERT INTO `t_heart_beat_record` VALUES (100, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 236, '2022-09-11 03:27:21', '2022-09-11 03:28:45');
INSERT INTO `t_heart_beat_record` VALUES (101, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 5448, '2022-09-11 03:30:01', '2022-09-11 04:41:19');
INSERT INTO `t_heart_beat_record` VALUES (102, 'D:\\Objects\\Github\\smart-admin', '2.0.0.1;192.168.217.1;192.168.0.194;192.168.196.1', 21004, '2022-09-11 07:35:08', '2022-09-11 07:41:23');

-- ----------------------------
-- Table structure for t_id_generator
-- ----------------------------
DROP TABLE IF EXISTS `t_id_generator`;
CREATE TABLE `t_id_generator`  (
  `id` int(11) NULL DEFAULT NULL,
  `key_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '英文key',
  `rule_format` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则格式。no_cycle没有周期, year_cycle 年周期, month_cycle月周期, day_cycle 日周期',
  `rule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '格式[yyyy]表示年,[mm]标识月,[dd]表示日,[nnn]表示三位数字',
  `init_number` int(11) NOT NULL DEFAULT 1 COMMENT '初始值',
  `last_number` int(11) NULL DEFAULT NULL COMMENT '上次产生的id, 默认为空',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  UNIQUE INDEX `key_name`(`key_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'id生成器定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_id_generator
-- ----------------------------
INSERT INTO `t_id_generator` VALUES (2, 'goods_num', '[nnnnnnn]', 'NO_CYCLE', 1, NULL, '商品编号', '2019-04-09 09:48:04', '2019-03-29 14:14:12');
INSERT INTO `t_id_generator` VALUES (1, 'order', '[yyyy][mm][dd][nnnnn]', 'DAY_CYCLE', 1, 1, '订单编号', '2019-03-30 11:25:42', '2019-03-29 14:14:12');

-- ----------------------------
-- Table structure for t_id_generator_record
-- ----------------------------
DROP TABLE IF EXISTS `t_id_generator_record`;
CREATE TABLE `t_id_generator_record`  (
  `generator_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `last_number` int(11) NOT NULL,
  PRIMARY KEY (`generator_id`, `year`, `month`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'id_generator记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_id_generator_record
-- ----------------------------
INSERT INTO `t_id_generator_record` VALUES (1, 2019, 3, 30, 1);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 3, 30, 1);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 4, 3, 2);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 4, 8, 2);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 4, 9, 1);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除状态：0未删除 0删除 ',
  `send_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发送状态 0未发送 1发送',
  `create_user` bigint(20) NOT NULL COMMENT '消息创建人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (93, '大扫把', '晓冬吃大便', 1, 1, 1, '2019-07-13 17:54:13', '2019-07-13 17:54:21');
INSERT INTO `t_notice` VALUES (95, '4444444', '444444444444', 1, 1, 1, '2019-07-13 17:54:53', '2019-09-04 09:42:02');
INSERT INTO `t_notice` VALUES (96, '3434', '444444', 1, 1, 1, '2019-07-13 17:58:42', '2019-11-08 09:05:24');
INSERT INTO `t_notice` VALUES (97, '44444', '555555555555', 1, 1, 1, '2019-07-13 17:58:54', '2019-09-03 16:19:50');
INSERT INTO `t_notice` VALUES (98, '《青花瓷》', '素胚勾勒出青花笔锋浓转淡\n瓶身描绘的牡丹一如你初妆\n冉冉檀香透过窗心事我了然\n周杰伦 青花瓷\n周杰伦 青花瓷\n宣纸上走笔至此搁一半\n釉色渲染仕女图韵味被私藏\n而你嫣然的一笑如含苞待放\n你的美一缕飘散\n去到我去不了的地方\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n色白花青的锦鲤跃然于碗底\n临摹宋体落款时却惦记着你\n你隐藏在窑烧里千年的秘密\n极细腻犹如绣花针落地\n篱外芭蕉惹骤雨门环惹铜绿\n而我路过那江南小镇惹了你\n在泼墨山水画里\n你从墨色深处被隐去\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意 ', 1, 1, 1, '2019-08-05 16:36:44', '2019-09-02 17:53:12');
INSERT INTO `t_notice` VALUES (99, '1', '2', 1, 1, 30, '2019-08-08 14:53:58', '2019-08-08 14:54:07');
INSERT INTO `t_notice` VALUES (100, '呵呵', '呵呵', 1, 1, 1, '2019-08-20 16:52:53', '2019-09-02 17:46:59');
INSERT INTO `t_notice` VALUES (101, 'aa', 'bbcc', 1, 1, 30, '2019-08-23 09:51:01', '2019-08-23 09:51:28');
INSERT INTO `t_notice` VALUES (102, '1', '2', 0, 1, 1, '2019-09-05 14:28:10', '2019-09-05 14:28:10');
INSERT INTO `t_notice` VALUES (103, '12', '22', 0, 1, 1, '2019-09-05 14:29:30', '2019-09-05 14:29:30');
INSERT INTO `t_notice` VALUES (104, 'a', 'b', 1, 1, 30, '2019-09-06 14:21:18', '2019-09-06 14:24:07');
INSERT INTO `t_notice` VALUES (105, '22222222222', '1111', 0, 0, 1, '2019-11-07 19:05:56', '2019-11-07 19:05:56');
INSERT INTO `t_notice` VALUES (106, '423', '234', 0, 0, 37, '2019-11-08 21:48:19', '2019-11-08 21:48:19');
INSERT INTO `t_notice` VALUES (107, 'AAS', 's\'da\'ssdas', 1, 1, 1, '2019-11-13 19:06:55', '2019-11-14 09:07:06');

-- ----------------------------
-- Table structure for t_notice_receive_record
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_receive_record`;
CREATE TABLE `t_notice_receive_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notice_id` bigint(20) NOT NULL COMMENT '消息id',
  `employee_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice_receive_record
-- ----------------------------
INSERT INTO `t_notice_receive_record` VALUES (114, 93, 1, '2019-07-13 17:54:16', '2019-07-13 17:54:16');
INSERT INTO `t_notice_receive_record` VALUES (115, 95, 1, '2019-07-13 17:54:55', '2019-07-13 17:54:55');
INSERT INTO `t_notice_receive_record` VALUES (116, 95, 22, '2019-07-13 17:58:03', '2019-07-13 17:58:03');
INSERT INTO `t_notice_receive_record` VALUES (117, 93, 22, '2019-07-13 17:58:05', '2019-07-13 17:58:05');
INSERT INTO `t_notice_receive_record` VALUES (118, 96, 1, '2019-07-13 17:58:44', '2019-07-13 17:58:44');
INSERT INTO `t_notice_receive_record` VALUES (119, 97, 1, '2019-07-13 17:58:58', '2019-07-13 17:58:58');
INSERT INTO `t_notice_receive_record` VALUES (120, 98, 1, '2019-08-05 16:37:01', '2019-08-05 16:37:01');
INSERT INTO `t_notice_receive_record` VALUES (121, 99, 30, '2019-08-08 14:54:05', '2019-08-08 14:54:05');
INSERT INTO `t_notice_receive_record` VALUES (122, 99, 1, '2019-08-08 15:15:44', '2019-08-08 15:15:44');
INSERT INTO `t_notice_receive_record` VALUES (123, 100, 1, '2019-08-20 16:53:29', '2019-08-20 16:53:29');
INSERT INTO `t_notice_receive_record` VALUES (124, 101, 30, '2019-08-23 09:51:11', '2019-08-23 09:51:11');
INSERT INTO `t_notice_receive_record` VALUES (125, 101, 1, '2019-08-23 12:46:27', '2019-08-23 12:46:27');
INSERT INTO `t_notice_receive_record` VALUES (126, 102, 1, '2019-09-05 14:28:32', '2019-09-05 14:28:32');
INSERT INTO `t_notice_receive_record` VALUES (127, 104, 30, '2019-09-06 14:23:58', '2019-09-06 14:23:58');
INSERT INTO `t_notice_receive_record` VALUES (128, 104, 1, '2019-09-06 15:25:13', '2019-09-06 15:25:13');
INSERT INTO `t_notice_receive_record` VALUES (129, 101, 14, '2019-11-02 21:46:13', '2019-11-02 21:46:13');
INSERT INTO `t_notice_receive_record` VALUES (130, 102, 14, '2019-11-02 21:46:14', '2019-11-02 21:46:14');
INSERT INTO `t_notice_receive_record` VALUES (131, 104, 14, '2019-11-02 21:46:15', '2019-11-02 21:46:15');
INSERT INTO `t_notice_receive_record` VALUES (132, 98, 14, '2019-11-02 21:46:18', '2019-11-02 21:46:18');
INSERT INTO `t_notice_receive_record` VALUES (133, 103, 37, '2019-11-07 19:58:06', '2019-11-07 19:58:06');
INSERT INTO `t_notice_receive_record` VALUES (134, 103, 1, '2019-11-07 20:03:54', '2019-11-07 20:03:54');
INSERT INTO `t_notice_receive_record` VALUES (135, 107, 1, '2019-11-13 19:07:02', '2019-11-13 19:07:02');
INSERT INTO `t_notice_receive_record` VALUES (136, 107, 38, '2019-11-15 02:11:04', '2019-11-15 02:11:04');
INSERT INTO `t_notice_receive_record` VALUES (137, 104, 38, '2019-11-15 02:11:17', '2019-11-15 02:11:17');
INSERT INTO `t_notice_receive_record` VALUES (138, 101, 38, '2019-11-15 02:26:33', '2019-11-15 02:26:33');
INSERT INTO `t_notice_receive_record` VALUES (139, 98, 38, '2019-11-15 02:29:32', '2019-11-15 02:29:32');
INSERT INTO `t_notice_receive_record` VALUES (140, 100, 38, '2019-11-15 03:19:18', '2019-11-15 03:19:18');

-- ----------------------------
-- Table structure for t_order_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_order_operate_log`;
CREATE TABLE `t_order_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '各种单据的id',
  `order_type` int(11) NOT NULL COMMENT '单据类型',
  `operate_type` int(11) NOT NULL COMMENT '操作类型',
  `operate_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作类型 对应的中文',
  `operate_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '操作备注',
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `employee_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工名称',
  `ext_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '额外信息',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id_order_type`(`order_id`, `order_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '各种单据操作记录\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_peony
-- ----------------------------
DROP TABLE IF EXISTS `t_peony`;
CREATE TABLE `t_peony`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `kind` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品种',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `color` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `image_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片链接',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '牡丹花' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_peony
-- ----------------------------
INSERT INTO `t_peony` VALUES (5, '复色类', '什样锦', '红色', 'https://bkimg.cdn.bcebos.com/pic/3c6d55fbb2fb43160ee185da2aa4462308f7d390?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UxNTA=,xp_5,yp_5', '2020-04-06 22:02:32', '2020-04-06 22:03:30');
INSERT INTO `t_peony` VALUES (6, '绿色', '绿香球', '绿色', '11', '2020-04-06 22:14:35', '2020-04-06 22:17:51');
INSERT INTO `t_peony` VALUES (7, '墨紫色类', '冠世墨玉', '紫色', '34534534534', '2020-04-06 22:15:19', '2020-04-06 22:18:21');

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位描述',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES (1, 'java develop', 'java develop is good job', '2019-07-03 15:18:45', '2019-07-03 15:18:45');
INSERT INTO `t_position` VALUES (2, 'android develop', 'android develop is good job', '2019-07-04 16:11:11', '2019-07-04 16:11:00');
INSERT INTO `t_position` VALUES (3, '测试岗位1', '这是内容11', '2019-09-02 16:39:33', '2019-07-10 14:03:50');
INSERT INTO `t_position` VALUES (8, '测试岗位2', '测试岗位2.。', '2019-09-04 10:19:40', '2019-09-04 10:19:32');
INSERT INTO `t_position` VALUES (9, '测试岗位3', '测试岗位3', '2019-09-05 14:39:43', '2019-09-05 14:39:43');
INSERT INTO `t_position` VALUES (10, '测试岗位4', '测试岗位4', '2019-09-05 14:39:48', '2019-09-05 14:39:48');
INSERT INTO `t_position` VALUES (11, '测试岗位5', '测试岗位5', '2019-09-05 14:39:53', '2019-09-05 14:39:53');
INSERT INTO `t_position` VALUES (12, '测试岗位6', '测试岗位6', '2019-09-05 14:39:58', '2019-09-05 14:39:58');
INSERT INTO `t_position` VALUES (13, '测试岗位7', '测试岗位7', '2019-09-05 14:40:03', '2019-09-05 14:40:03');
INSERT INTO `t_position` VALUES (14, '测试岗位8', '测试岗位8', '2019-09-05 14:40:09', '2019-09-05 14:40:09');
INSERT INTO `t_position` VALUES (15, '测试岗位9', '测试岗位9', '2019-09-05 14:40:19', '2019-09-05 14:40:19');
INSERT INTO `t_position` VALUES (16, 'aaa22222', 'ddddddddddd', '2019-11-15 17:04:29', '2019-11-06 15:58:37');
INSERT INTO `t_position` VALUES (17, 'ddd', 'fsdef', '2019-11-15 17:04:40', '2019-11-15 17:04:40');

-- ----------------------------
-- Table structure for t_position_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_position_relation`;
CREATE TABLE `t_position_relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NULL DEFAULT NULL COMMENT '岗位ID',
  `employee_id` int(11) NULL DEFAULT NULL COMMENT '员工ID',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_id`(`position_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_position_relation
-- ----------------------------
INSERT INTO `t_position_relation` VALUES (14, 1, 28, '2019-07-10 16:40:14', '2019-07-10 16:40:14');
INSERT INTO `t_position_relation` VALUES (18, 1, 29, '2019-07-11 10:18:22', '2019-07-11 10:18:22');
INSERT INTO `t_position_relation` VALUES (19, 3, 29, '2019-07-11 10:18:22', '2019-07-11 10:18:22');
INSERT INTO `t_position_relation` VALUES (20, 2, 29, '2019-07-11 10:18:22', '2019-07-11 10:18:22');
INSERT INTO `t_position_relation` VALUES (21, 1, 30, '2019-08-08 14:35:51', '2019-08-08 14:35:51');
INSERT INTO `t_position_relation` VALUES (22, 2, 30, '2019-08-08 14:35:51', '2019-08-08 14:35:51');
INSERT INTO `t_position_relation` VALUES (23, 3, 30, '2019-08-08 14:35:51', '2019-08-08 14:35:51');
INSERT INTO `t_position_relation` VALUES (26, 2, 31, '2019-08-23 09:26:44', '2019-08-23 09:26:44');
INSERT INTO `t_position_relation` VALUES (27, 3, 31, '2019-08-23 09:26:44', '2019-08-23 09:26:44');
INSERT INTO `t_position_relation` VALUES (28, 3, 32, '2019-09-04 09:05:47', '2019-09-04 09:05:47');
INSERT INTO `t_position_relation` VALUES (29, 2, 32, '2019-09-04 09:05:47', '2019-09-04 09:05:47');
INSERT INTO `t_position_relation` VALUES (30, 3, 22, '2019-09-04 09:06:46', '2019-09-04 09:06:46');
INSERT INTO `t_position_relation` VALUES (31, 2, 22, '2019-09-04 09:06:46', '2019-09-04 09:06:46');
INSERT INTO `t_position_relation` VALUES (35, 8, 35, '2019-09-04 15:09:00', '2019-09-04 15:09:00');
INSERT INTO `t_position_relation` VALUES (36, 3, 35, '2019-09-04 15:09:00', '2019-09-04 15:09:00');
INSERT INTO `t_position_relation` VALUES (37, 15, 23, '2019-09-05 16:13:02', '2019-09-05 16:13:02');
INSERT INTO `t_position_relation` VALUES (38, 14, 23, '2019-09-05 16:13:02', '2019-09-05 16:13:02');
INSERT INTO `t_position_relation` VALUES (39, 13, 23, '2019-09-05 16:13:02', '2019-09-05 16:13:02');
INSERT INTO `t_position_relation` VALUES (40, 3, 34, '2019-09-06 08:55:18', '2019-09-06 08:55:18');
INSERT INTO `t_position_relation` VALUES (41, 2, 34, '2019-09-06 08:55:18', '2019-09-06 08:55:18');
INSERT INTO `t_position_relation` VALUES (42, 1, 34, '2019-09-06 08:55:18', '2019-09-06 08:55:18');
INSERT INTO `t_position_relation` VALUES (43, 14, 36, '2019-09-09 17:01:39', '2019-09-09 17:01:39');
INSERT INTO `t_position_relation` VALUES (44, 3, 37, '2019-11-08 09:32:39', '2019-11-08 09:32:39');
INSERT INTO `t_position_relation` VALUES (46, 8, 38, '2019-11-14 16:08:05', '2019-11-14 16:08:05');
INSERT INTO `t_position_relation` VALUES (50, 16, 39, '2019-11-15 17:07:04', '2019-11-15 17:07:04');
INSERT INTO `t_position_relation` VALUES (51, 13, 39, '2019-11-15 17:07:04', '2019-11-15 17:07:04');
INSERT INTO `t_position_relation` VALUES (52, 14, 39, '2019-11-15 17:07:04', '2019-11-15 17:07:04');

-- ----------------------------
-- Table structure for t_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '功能权限表主键id',
  `type` tinyint(4) NOT NULL COMMENT '1.菜单 2.功能点',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由name 英文关键字',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '路由path/type=3为API接口',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `parent_key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级key',
  `update_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `parent_key`(`parent_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------
INSERT INTO `t_privilege` VALUES (1, 1, '人员管理', 'Employee', '/employee', 20, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (2, 1, '角色管理', 'RoleManage', '/employee/role', 21, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (3, 1, '岗位管理', 'PositionList', '/employee/position', 22, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (4, 1, '员工管理', 'RoleEmployeeManage', '/employee/role-employee-manage', 23, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (5, 1, '系统设置', 'SystemSetting', '/system-setting', 29, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (6, 1, '系统参数', 'SystemConfig', '/system-setting/system-config', 30, 'SystemSetting', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (8, 1, '菜单设置', 'SystemPrivilege', '/system-setting/system-privilege', 31, 'SystemSetting', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (9, 1, '消息管理', 'Notice', '/notice', 10, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (10, 1, '通知管理', 'NoticeList', '/notice/notice-list', 11, 'Notice', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (11, 1, '个人消息', 'PersonNotice', '/notice/person-notice', 12, 'Notice', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (12, 1, '邮件管理', 'Email', '/email', 4, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (13, 1, '邮件管理', 'EmailList', '/email/email-list', 5, 'Email', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (14, 1, '发送邮件', 'SendMail', '/email/send-mail', 6, 'Email', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (15, 1, '用户日志', 'UserLog', '/user-log', 26, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (16, 1, '用户操作日志', 'UserOperateLog', '/user-log/user-operate-log', 27, 'UserLog', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (17, 1, '用户登录日志', 'UserLoginLog', '/user-log/user-login-log', 28, 'UserLog', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (18, 1, '系统监控', 'Monitor', '/monitor', 37, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (19, 1, '在线人数', 'OnlineUser', '/monitor/online-user', 38, 'Monitor', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (20, 1, 'SQL监控', 'Sql', '/monitor/sql', 39, 'Monitor', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (21, 1, '定时任务', 'Task', '/task', 42, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (22, 1, '任务管理', 'TaskList', '/system-setting/task-list', 43, 'Task', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (23, 1, '动态加载', 'Reload', '/reload', 40, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (24, 1, 'SmartReload', 'SmartReloadList', '/reload/smart-reload-list', 41, 'Reload', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (25, 1, '接口文档', 'ApiDoc', '/api-doc', 33, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (26, 1, 'Swagger接口文档', 'Swagger', '/api-doc/swagger', 34, 'ApiDoc', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (27, 1, '三级路由', 'ThreeRouter', '/three-router', 14, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (28, 1, '三级菜单', 'LevelTwo', '/three-router/level-two', 15, 'ThreeRouter', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (30, 1, '三级菜单子哈', 'RoleTwoTwo', '/three-router/level-two/level-three2', 17, 'LevelTwo', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (31, 1, '二级菜单', 'RoleOneOne', '/three-router/level-two2', 18, 'ThreeRouter', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (32, 1, 'KeepAlive', 'KeepAlive', '/keep-alive', 7, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (33, 1, 'KeepAlive列表', 'KeepAliveContentList', '/keep-alive/content-list', 8, 'KeepAlive', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (34, 1, 'KeepAlive表单', 'KeepAliveAddContent', '/keep-alive/add-content', 9, 'KeepAlive', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (35, 1, '心跳服务', 'HeartBeat', '/heart-beat', 35, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (36, 1, '心跳服务', 'HeartBeatList', '/heart-beat/heart-beat-list', 36, 'HeartBeat', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (37, 1, '文件服务', 'File', '/file', 24, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (38, 1, '文件列表', 'FileList', '/file/file-list', 25, 'File', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (39, 2, '添加角色', 'add-role', 'roleController.addRole', 0, 'RoleManage', '2019-11-01 11:47:29', '2019-11-01 11:47:29');
INSERT INTO `t_privilege` VALUES (40, 2, '删除角色', 'delete-role', 'roleController.deleteRole', 1, 'RoleManage', '2019-11-01 11:47:43', '2019-11-01 11:47:43');
INSERT INTO `t_privilege` VALUES (41, 2, '编辑角色', 'update-role', 'roleController.updateRole', 2, 'RoleManage', '2019-11-01 11:47:55', '2019-11-01 11:47:55');
INSERT INTO `t_privilege` VALUES (42, 2, '修改角色权限', 'update-role-privilege', 'rolePrivilegeController.updateRolePrivilege', 3, 'RoleManage', '2019-11-01 11:48:09', '2019-11-01 11:48:09');
INSERT INTO `t_privilege` VALUES (43, 2, '添加成员', 'add-employee-role', 'roleEmployeeController.addEmployeeList', 4, 'RoleManage', '2019-11-05 10:38:11', '2019-11-05 10:38:11');
INSERT INTO `t_privilege` VALUES (44, 2, '查询成员', 'search-employee-list', 'roleEmployeeController.listAllEmployeeRoleId,roleEmployeeController.listEmployeeByName,roleController.getAllRole,rolePrivilegeController.listPrivilegeByRoleId', 7, 'RoleManage', '2019-11-05 10:39:04', '2019-11-05 10:39:04');
INSERT INTO `t_privilege` VALUES (45, 2, '移除成员', 'delete-employee-role', 'roleEmployeeController.removeEmployee', 5, 'RoleManage', '2019-11-05 10:40:09', '2019-11-05 10:40:09');
INSERT INTO `t_privilege` VALUES (46, 2, '批量移除', 'delete-employee-role-batch', 'roleEmployeeController.removeEmployeeList', 6, 'RoleManage', '2019-11-05 10:40:27', '2019-11-05 10:40:27');
INSERT INTO `t_privilege` VALUES (47, 2, '查询数据范围', 'query-data-scope', 'dataScopeController.dataScopeList,dataScopeController.dataScopeListByRole,rolePrivilegeController.listPrivilegeByRoleId,privilegeController.queryAll,privilegeController.getAllUrl', 8, 'RoleManage', '2019-11-05 10:40:57', '2019-11-05 10:40:57');
INSERT INTO `t_privilege` VALUES (48, 2, '更新数据范围', 'update-data-scope', 'dataScopeController.dataScopeBatchSet', 9, 'RoleManage', '2019-11-05 10:41:03', '2019-11-05 10:41:03');
INSERT INTO `t_privilege` VALUES (49, 2, '查询', 'search-position', 'positionController.queryJobById,positionController.getJobPage', 0, 'PositionList', '2019-11-05 10:41:30', '2019-11-05 10:41:30');
INSERT INTO `t_privilege` VALUES (50, 2, '添加', 'add-position', 'positionController.addJob', 1, 'PositionList', '2019-11-05 10:41:40', '2019-11-05 10:41:40');
INSERT INTO `t_privilege` VALUES (51, 2, '修改', 'update-position', 'positionController.updateJob', 2, 'PositionList', '2019-11-05 10:41:49', '2019-11-05 10:41:49');
INSERT INTO `t_privilege` VALUES (52, 2, '删除', 'delete-position', 'positionController.removeJob', 3, 'PositionList', '2019-11-05 10:41:57', '2019-11-05 10:41:57');
INSERT INTO `t_privilege` VALUES (53, 2, '添加部门', 'add-department', 'departmentController.addDepartment', 0, 'RoleEmployeeManage', '2019-11-05 11:11:18', '2019-11-05 11:11:18');
INSERT INTO `t_privilege` VALUES (54, 2, '编辑部门', 'update-department', 'departmentController.updateDepartment', 1, 'RoleEmployeeManage', '2019-11-05 11:11:29', '2019-11-05 11:11:29');
INSERT INTO `t_privilege` VALUES (55, 2, '删除部门', 'delete-department', 'departmentController.delDepartment', 2, 'RoleEmployeeManage', '2019-11-05 11:11:48', '2019-11-05 11:11:48');
INSERT INTO `t_privilege` VALUES (56, 2, '查询', 'search-department', 'departmentController.listAll,departmentController.getDepartment,departmentController.listDepartmentEmployee,departmentController.listDepartment,employeeController.query', 3, 'RoleEmployeeManage', '2019-11-05 11:12:09', '2019-11-05 11:12:09');
INSERT INTO `t_privilege` VALUES (57, 2, '添加成员', 'add-employee', 'employeeController.addEmployee', 4, 'RoleEmployeeManage', '2019-11-05 17:06:23', '2019-11-05 17:06:23');
INSERT INTO `t_privilege` VALUES (58, 2, '编辑成员', 'update-employee', 'employeeController.updateEmployee', 5, 'RoleEmployeeManage', '2019-11-05 17:06:57', '2019-11-05 17:06:57');
INSERT INTO `t_privilege` VALUES (59, 2, '禁用', 'disabled-employee', 'employeeController.updateStatus', 6, 'RoleEmployeeManage', '2019-11-05 17:14:35', '2019-11-05 17:14:35');
INSERT INTO `t_privilege` VALUES (60, 2, '批量操作', 'disabled-employee-batch', 'employeeController.batchUpdateStatus', 7, 'RoleEmployeeManage', '2019-11-05 17:19:23', '2019-11-05 17:19:23');
INSERT INTO `t_privilege` VALUES (61, 2, '员工角色编辑', 'update-employee-role', 'employeeController.updateRoles', 8, 'RoleEmployeeManage', '2019-11-05 17:21:15', '2019-11-05 17:21:15');
INSERT INTO `t_privilege` VALUES (62, 2, '重置密码', 'reset-employee-password', 'employeeController.resetPasswd', 10, 'RoleEmployeeManage', '2019-11-05 17:22:13', '2019-11-05 17:22:13');
INSERT INTO `t_privilege` VALUES (63, 2, '删除员工', 'delete-employee', 'employeeController.deleteEmployeeById', 9, 'RoleEmployeeManage', '2019-11-05 17:22:27', '2019-11-05 17:22:27');
INSERT INTO `t_privilege` VALUES (64, 2, '查询系统参数', 'system-params-search', 'systemConfigController.selectByKey,systemConfigController.getListByGroup,systemConfigController.getSystemConfigPage', 0, 'SystemConfig', '2019-11-05 17:23:41', '2019-11-05 17:23:41');
INSERT INTO `t_privilege` VALUES (65, 2, '添加系统参数', 'system-params-add', 'systemConfigController.addSystemConfig', 1, 'SystemConfig', '2019-11-05 17:26:00', '2019-11-05 17:26:00');
INSERT INTO `t_privilege` VALUES (66, 2, '修改系统参数', 'system-config-update', 'systemConfigController.updateSystemConfig', 2, 'SystemConfig', '2019-11-05 17:26:07', '2019-11-05 17:26:07');
INSERT INTO `t_privilege` VALUES (67, 2, '搜索系统参数', 'system-config-search', 'systemConfigController.selectByKey,systemConfigController.getListByGroup,systemConfigController.getSystemConfigPage', 3, 'SystemConfig', '2019-11-05 17:26:44', '2019-11-05 17:26:44');
INSERT INTO `t_privilege` VALUES (69, 2, '编辑', 'privilege-main-update', 'privilegeController.menuBatchSave,privilegeController.functionSaveOrUpdate', 1, 'SystemPrivilege', '2020-12-14 15:17:11', '2019-11-05 17:27:28');
INSERT INTO `t_privilege` VALUES (70, 2, '查询', 'privilege-main-search', 'privilegeController.queryAll,privilegeController.getAllUrl,privilegeController.functionQuery', 3, 'SystemPrivilege', '2020-12-14 15:17:11', '2019-11-05 17:28:45');
INSERT INTO `t_privilege` VALUES (71, 2, '查询', 'notice-query', 'noticeController.queryReceiveByPage,noticeController.queryUnreadByPage,noticeController.queryByPage,noticeController.detail', 0, 'NoticeList', '2019-11-05 17:30:16', '2019-11-05 17:30:16');
INSERT INTO `t_privilege` VALUES (72, 2, '添加', 'notice-add', 'noticeController.add', 1, 'NoticeList', '2019-11-05 17:30:28', '2019-11-05 17:30:28');
INSERT INTO `t_privilege` VALUES (73, 2, '修改', 'notice-edit', 'noticeController.update', 2, 'NoticeList', '2019-11-05 17:31:24', '2019-11-05 17:31:24');
INSERT INTO `t_privilege` VALUES (74, 2, '删除', 'notice-delete', 'noticeController.delete', 3, 'NoticeList', '2019-11-06 11:12:32', '2019-11-06 11:12:32');
INSERT INTO `t_privilege` VALUES (75, 2, '详情', 'notice-detail', 'noticeController.detail', 4, 'NoticeList', '2019-11-06 11:12:44', '2019-11-06 11:12:44');
INSERT INTO `t_privilege` VALUES (76, 2, '发送', 'notice-send', 'noticeController.send', 5, 'NoticeList', '2019-11-06 11:12:51', '2019-11-06 11:12:51');
INSERT INTO `t_privilege` VALUES (77, 2, '查询', 'person-notice-query', 'noticeController.queryReceiveByPage,noticeController.queryUnreadByPage,noticeController.queryByPage', 0, 'PersonNotice', '2019-11-06 11:13:27', '2019-11-06 11:13:27');
INSERT INTO `t_privilege` VALUES (78, 2, '详情', 'person-notice-detail', 'noticeController.detail', 1, 'PersonNotice', '2019-11-06 11:13:35', '2019-11-06 11:13:35');
INSERT INTO `t_privilege` VALUES (79, 2, '查询', 'email-query', 'emailController.queryByPage,emailController.detail', 0, 'EmailList', '2019-11-06 11:13:49', '2019-11-06 11:13:49');
INSERT INTO `t_privilege` VALUES (80, 2, '新增', 'email-add', 'emailController.add', 1, 'EmailList', '2019-11-06 11:14:02', '2019-11-06 11:14:02');
INSERT INTO `t_privilege` VALUES (81, 2, '编辑', 'email-update', 'emailController.update', 2, 'EmailList', '2019-11-06 11:14:08', '2019-11-06 11:14:08');
INSERT INTO `t_privilege` VALUES (82, 2, '删除', 'email-delete', 'emailController.delete', 3, 'EmailList', '2019-11-06 11:14:16', '2019-11-06 11:14:16');
INSERT INTO `t_privilege` VALUES (83, 2, '发送', 'email-send', 'emailController.send', 0, 'SendMail', '2019-11-06 11:14:40', '2019-11-06 11:14:40');
INSERT INTO `t_privilege` VALUES (84, 2, '查询', 'user-operate-log-search', 'userOperateLogController.queryByPage', 0, 'UserOperateLog', '2019-11-06 11:15:04', '2019-11-06 11:15:04');
INSERT INTO `t_privilege` VALUES (85, 2, '详情', 'user-operate-log-detail', 'userOperateLogController.detail', 1, 'UserOperateLog', '2019-11-06 11:15:16', '2019-11-06 11:15:16');
INSERT INTO `t_privilege` VALUES (86, 2, '删除', 'user-operate-log-delete', 'userOperateLogController.delete', 2, 'UserOperateLog', '2019-11-06 11:15:25', '2019-11-06 11:15:25');
INSERT INTO `t_privilege` VALUES (87, 2, '查询', 'user-login-log-search', 'userLoginLogController.queryByPage', 0, 'UserLoginLog', '2019-11-06 11:15:43', '2019-11-06 11:15:43');
INSERT INTO `t_privilege` VALUES (88, 2, '删除', 'user-login-log-delete', 'userLoginLogController.delete', 1, 'UserLoginLog', '2019-11-06 11:15:49', '2019-11-06 11:15:49');
INSERT INTO `t_privilege` VALUES (89, 2, '查询', 'online-user-search', 'userLoginLogController.queryUserOnLine', 0, 'OnlineUser', '2019-11-06 11:16:05', '2019-11-06 11:16:05');
INSERT INTO `t_privilege` VALUES (90, 2, '查询任务', 'task-search', 'quartzController.query', 0, 'TaskList', '2019-11-06 11:16:24', '2019-11-06 11:16:24');
INSERT INTO `t_privilege` VALUES (91, 2, '刷新任务', 'task-refresh', 'quartzController.query', 1, 'TaskList', '2019-11-06 11:16:50', '2019-11-06 11:16:50');
INSERT INTO `t_privilege` VALUES (92, 2, '添加任务', 'task-add', 'quartzController.saveOrUpdateTask', 2, 'TaskList', '2019-11-06 11:17:04', '2019-11-06 11:17:04');
INSERT INTO `t_privilege` VALUES (93, 2, '编辑任务', 'task-update', 'quartzController.saveOrUpdateTask', 3, 'TaskList', '2019-11-06 11:17:17', '2019-11-06 11:17:17');
INSERT INTO `t_privilege` VALUES (94, 2, '暂停任务', 'task-pause', 'quartzController.pauseTask', 4, 'TaskList', '2019-11-06 11:17:25', '2019-11-06 11:17:25');
INSERT INTO `t_privilege` VALUES (95, 2, '恢复任务', 'task-resume', 'quartzController.resumeTask', 5, 'TaskList', '2019-11-06 11:17:31', '2019-11-06 11:17:31');
INSERT INTO `t_privilege` VALUES (96, 2, '立即运行任务', 'task-run', 'quartzController.runTask', 6, 'TaskList', '2019-11-06 11:17:38', '2019-11-06 11:17:38');
INSERT INTO `t_privilege` VALUES (97, 2, '查看任务日志', 'task-query-log', 'quartzController.queryLog', 7, 'TaskList', '2019-11-06 11:17:47', '2019-11-06 11:17:47');
INSERT INTO `t_privilege` VALUES (98, 2, '删除任务', 'task-delete', 'quartzController.deleteTask', 8, 'TaskList', '2019-11-06 11:17:53', '2019-11-06 11:17:53');
INSERT INTO `t_privilege` VALUES (99, 2, '查询', 'smart-reload-search', 'smartReloadController.listAllReloadItem', 0, 'SmartReloadList', '2019-11-06 11:18:06', '2019-11-06 11:18:06');
INSERT INTO `t_privilege` VALUES (100, 2, '执行reload', 'smart-reload-update', 'smartReloadController.updateByTag', 1, 'SmartReloadList', '2019-11-06 11:18:14', '2019-11-06 11:18:14');
INSERT INTO `t_privilege` VALUES (101, 2, '查看执行结果', 'smart-reload-result', 'smartReloadController.queryReloadResult', 2, 'SmartReloadList', '2019-11-06 11:18:19', '2019-11-06 11:18:19');
INSERT INTO `t_privilege` VALUES (102, 2, '查询任务', 'heart-beat-query', 'heartBeatController.query', 0, 'HeartBeatList', '2019-11-06 11:18:38', '2019-11-06 11:18:38');
INSERT INTO `t_privilege` VALUES (103, 2, '查询', 'file-filePage-query', 'fileController.queryListByPage,fileController.localGetFile,fileController.downLoadById', 0, 'FileList', '2019-11-06 11:19:06', '2019-11-06 11:19:06');
INSERT INTO `t_privilege` VALUES (104, 2, '上传', 'file-filePage-upload', 'fileController.qiNiuUpload,fileController.localUpload,fileController.aliYunUpload,fileController.saveFile', 1, 'FileList', '2019-11-06 11:19:36', '2019-11-06 11:19:36');
INSERT INTO `t_privilege` VALUES (105, 2, '下载', 'file-filePage-download', 'fileController.downLoadById', 2, 'FileList', '2019-11-16 10:05:02', '2019-11-16 10:05:02');
INSERT INTO `t_privilege` VALUES (106, 1, '业务功能', 'Business', '/business', 0, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (107, 1, '牡丹管理', 'Peony', '/peony', 1, 'Business', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (108, 1, '牡丹花列表', 'PeonyList', '/peony/peony-list', 2, 'Peony', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (109, 1, '牡丹花列表1', 'PeonyList1', '/peony/peony-list1', 3, 'Peony', '2022-09-03 22:59:30', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (110, 1, '消息详情', 'NoticeDetail', '/notice/notice-detail', 13, 'Notice', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (111, 1, '三级菜单子颗粒', 'ThreeLevelRouterView', '/three-router/level-two/level-three1', 16, 'LevelTwo', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (112, 1, '系统设置', 'System', '/system', 19, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (113, 1, '开发专用', 'Support', '/support', 32, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (114, 2, '查询', 'peony-list-query', '', 1, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (115, 2, '新增', 'peony-list-add', '', 2, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (116, 2, '编辑', 'peony-list-update', '', 3, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (117, 2, '批量删除', 'peony-list-batch-delete', '', 4, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (118, 2, '批量导出', 'peony-list-batch-export', '', 5, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (119, 2, '导出全部', 'peony-list-export-all', '', 6, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (120, 2, '查询', 'peony1-list-query', '', 1, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (121, 2, '新增', 'peony1-list-add', '', 2, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (122, 2, '编辑', 'peony1-list-update', '', 3, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (123, 2, '批量删除', 'peony1-list-batch-delete', '', 4, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (124, 2, '批量导出', 'peony1-list-batch-export', '', 5, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (125, 2, '导出全部', 'peony1-list-export-all', '', 6, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (126, 2, '批量保存功能点', 'privilege-batch-save-points', 'privilegeController.functionSaveOrUpdate', 1, 'SystemPrivilege', '2020-12-14 15:17:11', '2020-12-14 15:17:11');
INSERT INTO `t_privilege` VALUES (127, 1, '站点状态', 'StationList', '/peony/station_list', 4, 'Peony', '2022-09-03 22:59:41', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (128, 1, '车辆明细查询', 'OrderList', '/peony/order_list', 5, 'Peony', '2022-09-03 23:01:44', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (129, 1, '车辆识别情况跟踪', 'CarNumberMatchTrackList', '/peony/car_number_match_track', 6, 'Peony', '2022-09-03 23:12:35', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (130, 1, '车牌矫正', 'CarNumberReviseList', '/peony/car_number_revise', 7, 'Peony', '2022-09-03 23:03:02', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (131, 1, '同比(环比)', 'CarGrowthAnalyseList', '/peony/car_growth_analyse', 8, 'Peony', '2022-09-10 13:34:10', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (132, 1, '车牌出入站频次', 'CarNumberInOutList', '/peony/car_number_in_out_list', 9, 'Peony', '2022-09-03 23:11:24', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (133, 1, '车牌跟踪', 'CarNumberTraceList', '/peony/car_number_trace', 10, 'Peony', '2022-09-07 00:06:52', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (134, 1, '油枪车辆识别情况跟踪', 'NozzleNoMatchTrackList', '/peony/nozzle_no_match_track', 11, 'Peony', '2022-09-07 01:03:27', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (135, 1, '车流走势', 'CarTrafficFlowList', '/peony/car_traffic_flow', 12, 'Peony', '2022-09-10 01:07:30', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (136, 1, '车牌追踪', 'CarNumberTraceList3', '/peony/car_number_trace', 13, 'Peony', '2022-09-07 00:05:13', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (137, 1, '车牌追踪', 'CarNumberTraceList4', '/peony/car_number_trace', 14, 'Peony', '2022-09-07 00:05:14', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (138, 1, '车牌追踪', 'CarNumberTraceList5', '/peony/car_number_trace', 15, 'Peony', '2022-09-07 00:05:15', '2020-12-14 15:16:26');

-- ----------------------------
-- Table structure for t_quartz_task
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_task`;
CREATE TABLE `t_quartz_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_bean` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'spring bean名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务参数',
  `task_cron` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行cron表达式',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态0:正常，1:暂停',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_quartz_task
-- ----------------------------
INSERT INTO `t_quartz_task` VALUES (9, '2312332', 'exampleTask', '21314', '*/5 * * * * ?', 1, NULL, '2019-09-06 14:41:55', '2019-04-19 15:24:26');
INSERT INTO `t_quartz_task` VALUES (13, '567', 'exampleTask', 'ads', '*/5 * * * * ?', 1, NULL, '2019-09-04 16:37:25', '2019-04-23 15:32:17');
INSERT INTO `t_quartz_task` VALUES (21, '11', 'exampleTask', '11', '*/5 * * * * ?', 1, NULL, '2019-09-04 16:37:30', '2019-04-26 17:29:21');
INSERT INTO `t_quartz_task` VALUES (22, '33', 'exampleTask', '333', '*/5 * * * * ?', 1, NULL, '2019-04-26 17:29:36', '2019-04-26 17:29:36');
INSERT INTO `t_quartz_task` VALUES (23, '1', 'exampleTask', '3', '*/5 * * * * ?', 0, NULL, '2019-09-05 17:21:12', '2019-04-26 17:29:50');

-- ----------------------------
-- Table structure for t_quartz_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_task_log`;
CREATE TABLE `t_quartz_task_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务参数',
  `process_status` tinyint(4) NOT NULL COMMENT '任务处理状态0:成功，1:失败',
  `process_duration` bigint(20) NOT NULL DEFAULT 0 COMMENT '运行时长',
  `process_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '日志',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运行主机ip',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 732881 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_quartz_task_log
-- ----------------------------
INSERT INTO `t_quartz_task_log` VALUES (732870, 9, '231233', '2131', 0, 5, NULL, '127.0.0.1', '2019-05-05 15:28:01', '2019-05-05 15:28:01');
INSERT INTO `t_quartz_task_log` VALUES (732871, 9, '231233', '2131', 0, 32, NULL, '172.16.0.145', '2019-05-05 15:54:40', '2019-05-05 15:54:40');
INSERT INTO `t_quartz_task_log` VALUES (732872, 22, '33', '333', 0, 31, NULL, '172.16.0.145', '2019-05-07 16:20:31', '2019-05-07 16:20:31');
INSERT INTO `t_quartz_task_log` VALUES (732873, 9, '231233', '2131', 0, 304, NULL, '172.16.0.145', '2019-08-02 09:29:36', '2019-08-02 09:29:36');
INSERT INTO `t_quartz_task_log` VALUES (732874, 9, '231233', '2131', 0, 24, NULL, '172.16.0.145', '2019-08-08 16:48:49', '2019-08-08 16:48:49');
INSERT INTO `t_quartz_task_log` VALUES (732875, 9, '231233', '2131', 0, 147, NULL, '172.16.0.145', '2019-08-23 09:41:08', '2019-08-23 09:41:08');
INSERT INTO `t_quartz_task_log` VALUES (732876, 9, '231233', '2131', 0, 610, NULL, '172.16.0.145', '2019-08-26 16:16:34', '2019-08-26 16:16:34');
INSERT INTO `t_quartz_task_log` VALUES (732877, 9, '2312332', '2131', 0, 27, NULL, '172.16.0.145', '2019-09-05 14:34:51', '2019-09-05 14:34:51');
INSERT INTO `t_quartz_task_log` VALUES (732878, 9, '2312332', '2131', 0, 5, NULL, '172.16.0.145', '2019-09-05 17:18:17', '2019-09-05 17:18:17');
INSERT INTO `t_quartz_task_log` VALUES (732879, 9, '2312332', '2131', 0, 1, NULL, '172.16.0.145', '2019-09-05 17:20:15', '2019-09-05 17:20:15');
INSERT INTO `t_quartz_task_log` VALUES (732880, 9, '2312332', '2131', 0, 5, NULL, '172.16.0.145', '2019-09-06 14:42:04', '2019-09-06 14:42:04');

-- ----------------------------
-- Table structure for t_reload_item
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_item`;
CREATE TABLE `t_reload_item`  (
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项名称',
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数 可选',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运行标识',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_reload_item
-- ----------------------------
INSERT INTO `t_reload_item` VALUES ('system_config', '234', 'xxxx', '2019-11-14 16:46:21', '2019-04-18 11:48:27');

-- ----------------------------
-- Table structure for t_reload_result
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_result`;
CREATE TABLE `t_reload_result`  (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行标识',
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `result` tinyint(3) UNSIGNED NOT NULL COMMENT '是否成功 ',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_reload_result
-- ----------------------------
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:26:04');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:28:16');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:35:39');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:42:58');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-09 08:30:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 10:38:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 10:42:46');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 10:49:27');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:09:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:10:06');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:18:17');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:41:18');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:45:41');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:46:37');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:50:35');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 14:55:00');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:26:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:35:51');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:36:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:36:53');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:37:58');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:41:37');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-16 10:12:29');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:14:08');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:18:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:23:07');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:24:17');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:30:17');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:31:40');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:32:34');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:52:31');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:55:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:55:47');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:58:49');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-21 10:53:47');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-22 18:24:21');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-24 09:04:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-15 11:06:12');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-15 11:22:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-15 16:42:16');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-19 15:18:54');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-19 16:50:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-21 15:52:25');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 10:24:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 10:28:45');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 16:35:45');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 16:38:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-25 08:52:22');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-28 16:04:30');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-30 19:59:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 14:29:26');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 14:35:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 15:58:39');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 17:34:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-01 11:23:26');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-01 14:55:34');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 08:49:44');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:40:52');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:42:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:47:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:50:57');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:51:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:51:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 15:48:21');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 20:48:44');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 21:27:50');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-03 22:10:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-03 22:10:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-04 09:10:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-05 10:24:51');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:22:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:25:54');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:27:04');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:28:00');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:34:06');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:34:43');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:53:11');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:56:05');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 13:52:39');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 15:29:29');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:05:36');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:06:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:13:22');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:19:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:21:37');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:22:23');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-08 08:50:08');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-08 13:37:34');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 08:35:08');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 08:54:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:00:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:01:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:24:16');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:26:46');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:43:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:44:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 10:28:30');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 11:24:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-11 09:40:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-13 17:25:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '2423', 1, NULL, '2019-11-13 20:29:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '2423', 1, NULL, '2019-11-13 20:29:23');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:43:57');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:50:18');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:51:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:52:03');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:53:02');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:49:11');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:51:05');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:53:53');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:55:57');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 16:15:44');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 16:39:36');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343234234', '234', 1, NULL, '2019-11-14 16:41:05');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343234234', '234', 1, NULL, '2019-11-14 16:41:05');
INSERT INTO `t_reload_result` VALUES ('system_config', 'aaaa', '234', 1, NULL, '2019-11-14 16:41:20');
INSERT INTO `t_reload_result` VALUES ('system_config', 'aaaa', '234', 1, NULL, '2019-11-14 16:41:25');
INSERT INTO `t_reload_result` VALUES ('system_config', '111', '234', 1, NULL, '2019-11-14 16:43:20');
INSERT INTO `t_reload_result` VALUES ('system_config', '111', '234', 1, NULL, '2019-11-14 16:44:13');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-14 16:46:26');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-14 16:46:39');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-14 16:48:47');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-15 14:39:55');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-16 08:47:43');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-16 17:12:10');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-16 18:02:57');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:09:53');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:13:33');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:14:09');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:16:23');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-03 16:26:46');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 10:12:04');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 12:06:28');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 12:22:47');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 12:29:07');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 12:35:55');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 12:37:55');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 12:59:09');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 13:13:12');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 13:37:35');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 13:46:43');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 13:49:01');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 13:53:13');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 13:54:34');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 14:40:44');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 14:50:10');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 14:51:21');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 14:53:45');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 14:57:51');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:00:48');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:05:18');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:08:19');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:09:35');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:13:44');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:17:11');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:42:24');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:54:40');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 15:55:39');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 16:02:46');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 19:48:30');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 19:57:57');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 20:00:38');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 20:15:32');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 20:18:07');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 20:19:16');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 20:24:23');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 20:32:58');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 21:20:36');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 21:22:43');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 21:24:37');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 21:29:16');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 21:30:37');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 21:33:19');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 21:59:50');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 22:00:55');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-04 22:05:18');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-05 21:46:27');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-05 23:55:59');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 01:21:38');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 20:23:55');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 21:44:21');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 21:49:45');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 22:08:15');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 22:26:06');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 22:45:35');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-06 22:47:06');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-07 00:17:48');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 21:47:18');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:01:56');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:08:39');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:11:36');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:15:50');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:18:38');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:19:54');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:21:36');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-09 22:25:28');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 00:21:28');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 00:23:22');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 00:47:16');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 09:42:27');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 13:34:44');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 13:44:24');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 13:51:11');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 13:56:20');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 14:00:29');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 14:03:37');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 14:08:35');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 15:05:28');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 15:07:35');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 15:27:56');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 15:38:30');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 15:40:14');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 16:32:22');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 16:37:07');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 16:40:54');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 16:43:06');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 16:55:44');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:03:43');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:06:09');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:08:09');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:11:47');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:13:40');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:14:50');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:16:06');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:17:16');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:19:24');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:45:48');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 17:48:56');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 20:57:28');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 23:18:43');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 23:32:27');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-10 23:40:16');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 00:08:24');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 00:11:11');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 00:12:48');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 00:18:00');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 00:23:43');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 10:17:16');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 10:58:28');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 10:59:34');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 11:27:42');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 11:30:27');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2022-09-11 15:35:31');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '', '2019-06-21 12:09:34', '2019-06-21 12:09:34');
INSERT INTO `t_role` VALUES (34, '销售', '', '2019-08-30 09:30:50', '2019-08-30 09:30:50');
INSERT INTO `t_role` VALUES (35, '总经理', '', '2019-08-30 09:31:05', '2019-08-30 09:31:05');
INSERT INTO `t_role` VALUES (36, '董事长', '', '2019-08-30 09:31:11', '2019-08-30 09:31:11');
INSERT INTO `t_role` VALUES (37, '财务', '', '2019-08-30 09:31:16', '2019-08-30 09:31:16');
INSERT INTO `t_role` VALUES (38, '运营', '', '2019-08-30 09:31:22', '2019-08-30 09:31:22');
INSERT INTO `t_role` VALUES (40, '测试角色1', '测试角色1', '2019-09-05 15:05:38', '2019-09-05 15:05:38');
INSERT INTO `t_role` VALUES (41, '测试角色2', '测试角色2', '2019-09-05 15:05:43', '2019-09-05 15:05:43');
INSERT INTO `t_role` VALUES (42, '测试角色3', '测试角色3', '2019-09-05 15:05:49', '2019-09-05 15:05:49');
INSERT INTO `t_role` VALUES (43, '测试角色4', '测试角色4', '2019-09-05 15:05:56', '2019-09-05 15:05:56');
INSERT INTO `t_role` VALUES (45, '测试角色6', '测试角色6', '2019-09-05 15:06:06', '2019-09-05 15:06:06');
INSERT INTO `t_role` VALUES (46, '测试角色7', '测试角色7', '2019-09-05 15:06:18', '2019-09-05 15:06:18');
INSERT INTO `t_role` VALUES (47, '测试角色8', '测试角色8', '2019-09-05 15:06:25', '2019-09-05 15:06:25');
INSERT INTO `t_role` VALUES (48, '测试角色9', '测试角色9', '2019-11-15 17:06:11', '2019-09-05 15:06:30');

-- ----------------------------
-- Table structure for t_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `t_role_data_scope`;
CREATE TABLE `t_role_data_scope`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_scope_type` int(11) NOT NULL COMMENT '数据范围id',
  `view_type` int(11) NOT NULL COMMENT '数据范围类型',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_data_scope
-- ----------------------------
INSERT INTO `t_role_data_scope` VALUES (5, 0, 2, 9, '2019-04-29 15:01:04', '2019-04-29 15:01:04');
INSERT INTO `t_role_data_scope` VALUES (14, 0, 2, 40, '2019-09-05 15:25:37', '2019-09-05 15:25:37');
INSERT INTO `t_role_data_scope` VALUES (15, 0, 0, 1, '2019-09-06 08:35:45', '2019-09-06 08:35:45');
INSERT INTO `t_role_data_scope` VALUES (16, 0, 3, 34, '2019-11-06 16:08:02', '2019-11-06 16:08:02');

-- ----------------------------
-- Table structure for t_role_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_role_employee`;
CREATE TABLE `t_role_employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色员工功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_employee
-- ----------------------------
INSERT INTO `t_role_employee` VALUES (121, 38, 22, '2019-09-04 09:23:09', '2019-09-04 09:23:09');
INSERT INTO `t_role_employee` VALUES (130, 1, 30, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (131, 1, 17, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (132, 1, 26, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (135, 1, 12, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (136, 1, 11, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (137, 1, 16, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (138, 1, 18, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (139, 1, 19, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (140, 1, 20, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (141, 1, 23, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (147, 1, 35, '2019-09-06 09:00:27', '2019-09-06 09:00:27');
INSERT INTO `t_role_employee` VALUES (148, 40, 35, '2019-09-06 09:00:27', '2019-09-06 09:00:27');
INSERT INTO `t_role_employee` VALUES (165, 40, 32, '2019-11-08 10:39:35', '2019-11-08 10:39:35');
INSERT INTO `t_role_employee` VALUES (166, 34, 32, '2019-11-08 10:39:35', '2019-11-08 10:39:35');
INSERT INTO `t_role_employee` VALUES (167, 38, 32, '2019-11-08 10:39:35', '2019-11-08 10:39:35');
INSERT INTO `t_role_employee` VALUES (168, 38, 36, '2019-11-08 10:40:16', '2019-11-08 10:40:16');
INSERT INTO `t_role_employee` VALUES (169, 40, 36, '2019-11-08 10:40:16', '2019-11-08 10:40:16');
INSERT INTO `t_role_employee` VALUES (170, 37, 36, '2019-11-08 10:40:16', '2019-11-08 10:40:16');
INSERT INTO `t_role_employee` VALUES (174, 38, 37, '2019-11-08 11:05:39', '2019-11-08 11:05:39');
INSERT INTO `t_role_employee` VALUES (175, 42, 37, '2019-11-08 11:05:39', '2019-11-08 11:05:39');
INSERT INTO `t_role_employee` VALUES (188, 1, 1, '2019-11-15 16:05:33', '2019-11-15 16:05:33');
INSERT INTO `t_role_employee` VALUES (211, 40, 38, '2019-11-15 16:54:54', '2019-11-15 16:54:54');
INSERT INTO `t_role_employee` VALUES (212, 34, 29, '2019-11-16 18:04:04', '2019-11-16 18:04:04');
INSERT INTO `t_role_employee` VALUES (213, 45, 29, '2019-11-16 18:04:04', '2019-11-16 18:04:04');

-- ----------------------------
-- Table structure for t_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_role_privilege`;
CREATE TABLE `t_role_privilege`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `privilege_key` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限key',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11700 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色权限功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_privilege
-- ----------------------------
INSERT INTO `t_role_privilege` VALUES (3506, 48, 'search-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3507, 48, 'add-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3508, 48, 'update-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3509, 48, 'delete-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3510, 48, 'add-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3511, 48, 'delete-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3512, 48, 'update-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3513, 48, 'update-role-privilege', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3514, 48, 'add-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3515, 48, 'delete-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3516, 48, 'delete-employee-role-batch', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3517, 48, 'search-employee-list', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3518, 48, 'query-data-scope', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3519, 48, 'update-data-scope', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3520, 48, 'add-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3521, 48, 'update-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3522, 48, 'delete-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3523, 48, 'search-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3524, 48, 'add-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3525, 48, 'update-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3526, 48, 'delete-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3527, 48, 'disabled-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3528, 48, 'reset-employee-password', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3529, 48, 'set-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3530, 48, 'disabled-employee-batch', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3531, 48, 'update-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3533, 48, 'system-params-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3534, 48, 'system-params-add', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3535, 48, 'system-config-update', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3536, 48, 'system-config-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3537, 48, 'privilegeMainSearch', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3538, 48, 'privilegeMainUpdate', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3539, 48, 'task-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3540, 48, 'task-refresh', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3541, 48, 'task-add', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3542, 48, 'task-update', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3543, 48, 'task-pause', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3544, 48, 'task-resume', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3545, 48, 'task-run', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3546, 48, 'task-query-log', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3547, 48, 'task-delete', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3548, 48, 'systemCodeVersionsQuery', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3552, 48, 'roleOneTwo-add', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3555, 48, 'apiDocument', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3557, 48, 'reload', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3559, 48, 'smart-reload-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3560, 48, 'smart-reload-update', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3561, 48, 'smart-reload-result', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3575, 45, 'task-search', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3576, 45, 'task-refresh', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3577, 45, 'task-add', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3578, 45, 'task-update', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3579, 45, 'task-pause', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3580, 45, 'task-resume', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3581, 45, 'task-run', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3582, 45, 'task-query-log', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3583, 45, 'task-delete', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3586, 45, 'add-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3587, 45, 'delete-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3588, 45, 'update-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3589, 45, 'update-role-privilege', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3590, 45, 'add-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3591, 45, 'delete-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3592, 45, 'delete-employee-role-batch', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3593, 45, 'search-employee-list', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3594, 45, 'query-data-scope', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3595, 45, 'update-data-scope', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3597, 45, 'search-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3598, 45, 'add-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3599, 45, 'update-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3600, 45, 'delete-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3602, 45, 'add-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3603, 45, 'set-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3604, 45, 'update-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3605, 45, 'delete-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3606, 45, 'search-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3607, 45, 'add-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3608, 45, 'update-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3609, 45, 'disabled-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3610, 45, 'disabled-employee-batch', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3611, 45, 'update-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3612, 45, 'delete-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3613, 45, 'reset-employee-password', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (8112, 41, 'SystemSetting', '2019-11-08 11:21:22', '2019-11-08 11:21:22');
INSERT INTO `t_role_privilege` VALUES (8113, 41, 'SystemPrivilege', '2019-11-08 11:21:22', '2019-11-08 11:21:22');
INSERT INTO `t_role_privilege` VALUES (8114, 41, 'privilege-main-update', '2019-11-08 11:21:22', '2019-11-08 11:21:22');
INSERT INTO `t_role_privilege` VALUES (8115, 41, 'privilege-main-search', '2019-11-08 11:21:22', '2019-11-08 11:21:22');
INSERT INTO `t_role_privilege` VALUES (8549, 35, 'SystemSetting', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8550, 35, 'SystemConfig', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8551, 35, 'SystemPrivilege', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8552, 35, 'Notice', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8553, 35, 'NoticeList', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8554, 35, 'PersonNotice', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8555, 35, 'Email', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8556, 35, 'EmailList', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8557, 35, 'UserLog', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8558, 35, 'UserOperateLog', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8559, 35, 'UserLoginLog', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8560, 35, 'system-config-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8561, 35, 'privilege-main-update', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8562, 35, 'privilege-main-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8563, 35, 'notice-query', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8564, 35, 'notice-add', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8565, 35, 'notice-edit', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8566, 35, 'notice-delete', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8567, 35, 'person-notice-query', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8568, 35, 'person-notice-detail', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8569, 35, 'email-query', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8570, 35, 'email-add', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8571, 35, 'email-update', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8572, 35, 'user-operate-log-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8573, 35, 'user-login-log-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8574, 35, 'system-config-update', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (9005, 37, 'SystemSetting', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9006, 37, 'SystemConfig', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9007, 37, 'system-params-search', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9008, 37, 'system-params-add', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9009, 37, 'system-config-update', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9368, 34, 'SystemSetting', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9369, 34, 'SystemConfig', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9370, 34, 'SystemPrivilege', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9371, 34, 'system-params-search', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9372, 34, 'system-params-add', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9373, 34, 'privilege-main-search', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9374, 34, 'Task', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9375, 34, 'TaskList', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9376, 34, 'task-search', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9377, 34, 'task-refresh', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9378, 34, 'task-add', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9379, 34, 'task-update', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9380, 34, 'task-pause', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9381, 34, 'task-resume', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9382, 34, 'task-run', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9383, 34, 'task-query-log', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9384, 34, 'task-delete', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9536, 42, 'Task', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9537, 42, 'TaskList', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9538, 42, 'task-search', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9539, 42, 'task-add', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9540, 42, 'task-update', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9541, 42, 'task-query-log', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9674, 38, 'Employee', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9675, 38, 'PositionList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9676, 38, 'SystemSetting', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9677, 38, 'SystemConfig', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9678, 38, 'Notice', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9679, 38, 'PersonNotice', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9680, 38, 'Email', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9681, 38, 'EmailList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9682, 38, 'SendMail', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9683, 38, 'Monitor', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9684, 38, 'OnlineUser', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9685, 38, 'Task', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9686, 38, 'TaskList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9687, 38, 'KeepAlive', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9688, 38, 'KeepAliveContentList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9689, 38, 'HeartBeat', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9690, 38, 'HeartBeatList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9691, 38, 'File', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9692, 38, 'FileList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9693, 38, 'search-position', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9694, 38, 'system-params-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9695, 38, 'system-config-update', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9696, 38, 'system-config-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9697, 38, 'person-notice-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9698, 38, 'person-notice-detail', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9699, 38, 'email-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9700, 38, 'email-send', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9701, 38, 'online-user-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9702, 38, 'task-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9703, 38, 'heart-beat-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9704, 38, 'file-filePage-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9705, 38, 'file-filePage-upload', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9706, 38, 'task-refresh', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (10585, 40, 'Employee', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10586, 40, 'RoleManage', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10587, 40, 'PositionList', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10588, 40, 'RoleEmployeeManage', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10589, 40, 'SystemSetting', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10590, 40, 'SystemConfig', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10591, 40, 'SystemPrivilege', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10592, 40, 'Notice', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10593, 40, 'NoticeList', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10594, 40, 'PersonNotice', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10595, 40, 'Email', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10596, 40, 'SendMail', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10597, 40, 'Task', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10598, 40, 'TaskList', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10599, 40, 'add-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10600, 40, 'delete-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10601, 40, 'update-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10602, 40, 'update-role-privilege', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10603, 40, 'add-employee-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10604, 40, 'search-employee-list', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10605, 40, 'delete-employee-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10606, 40, 'delete-employee-role-batch', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10607, 40, 'query-data-scope', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10608, 40, 'update-data-scope', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10609, 40, 'search-position', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10610, 40, 'add-position', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10611, 40, 'update-position', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10612, 40, 'search-department', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10613, 40, 'system-params-add', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10614, 40, 'system-config-search', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10615, 40, 'privilege-main-search', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10616, 40, 'notice-query', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10617, 40, 'notice-add', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10618, 40, 'notice-edit', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10619, 40, 'notice-delete', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10620, 40, 'notice-detail', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10621, 40, 'notice-send', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10622, 40, 'person-notice-query', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10623, 40, 'email-send', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10624, 40, 'task-search', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10625, 40, 'task-refresh', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10626, 40, 'task-add', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10627, 40, 'task-update', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10628, 40, 'task-query-log', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10629, 40, 'task-delete', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10630, 40, 'delete-department', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (11570, 1, 'Employee', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11571, 1, 'RoleManage', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11572, 1, 'PositionList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11573, 1, 'RoleEmployeeManage', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11574, 1, 'SystemSetting', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11575, 1, 'SystemConfig', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11576, 1, 'SystemPrivilege', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11577, 1, 'UserLog', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11578, 1, 'UserOperateLog', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11579, 1, 'UserLoginLog', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11580, 1, 'Monitor', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11581, 1, 'OnlineUser', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11582, 1, 'Sql', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11583, 1, 'Task', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11584, 1, 'TaskList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11585, 1, 'Reload', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11586, 1, 'SmartReloadList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11587, 1, 'ApiDoc', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11588, 1, 'Swagger', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11589, 1, 'HeartBeat', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11590, 1, 'HeartBeatList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11591, 1, 'File', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11592, 1, 'FileList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11593, 1, 'add-role', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11594, 1, 'delete-role', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11595, 1, 'update-role', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11596, 1, 'update-role-privilege', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11597, 1, 'add-employee-role', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11598, 1, 'search-employee-list', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11599, 1, 'delete-employee-role', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11600, 1, 'delete-employee-role-batch', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11601, 1, 'query-data-scope', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11602, 1, 'update-data-scope', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11603, 1, 'search-position', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11604, 1, 'add-position', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11605, 1, 'update-position', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11606, 1, 'delete-position', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11607, 1, 'add-department', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11608, 1, 'update-department', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11609, 1, 'delete-department', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11610, 1, 'search-department', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11611, 1, 'add-employee', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11612, 1, 'update-employee', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11613, 1, 'disabled-employee', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11614, 1, 'disabled-employee-batch', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11615, 1, 'update-employee-role', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11616, 1, 'reset-employee-password', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11617, 1, 'delete-employee', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11618, 1, 'system-params-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11619, 1, 'system-params-add', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11620, 1, 'system-config-update', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11621, 1, 'system-config-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11622, 1, 'privilege-main-update', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11623, 1, 'privilege-main-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11624, 1, 'user-operate-log-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11625, 1, 'user-operate-log-detail', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11626, 1, 'user-operate-log-delete', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11627, 1, 'user-login-log-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11628, 1, 'user-login-log-delete', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11629, 1, 'online-user-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11630, 1, 'task-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11631, 1, 'task-refresh', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11632, 1, 'task-add', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11633, 1, 'task-update', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11634, 1, 'task-pause', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11635, 1, 'task-resume', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11636, 1, 'task-run', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11637, 1, 'task-query-log', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11638, 1, 'task-delete', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11639, 1, 'smart-reload-search', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11640, 1, 'smart-reload-update', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11641, 1, 'smart-reload-result', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11642, 1, 'heart-beat-query', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11643, 1, 'file-filePage-query', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11644, 1, 'file-filePage-upload', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11645, 1, 'Business', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11646, 1, 'Peony', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11647, 1, 'PeonyList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11648, 1, 'PeonyList1', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11649, 1, 'peony-list-query', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11650, 1, 'peony-list-add', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11651, 1, 'peony-list-update', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11652, 1, 'peony-list-batch-delete', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11653, 1, 'peony-list-batch-export', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11654, 1, 'peony-list-export-all', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11655, 1, 'peony1-list-query', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11656, 1, 'peony1-list-add', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11657, 1, 'peony1-list-update', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11658, 1, 'peony1-list-batch-delete', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11659, 1, 'peony1-list-batch-export', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11660, 1, 'peony1-list-export-all', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11661, 1, 'StationList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11662, 1, 'OrderList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11663, 1, 'CarNumberMatchTrackList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11664, 1, 'CarNumberReviseList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11665, 1, 'CarNumberInOutList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11666, 1, 'CarNumberTraceList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11667, 1, 'NozzleNoMatchTrackList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11668, 1, 'CarTrafficFlowList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11669, 1, 'CarNumberTraceList3', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11670, 1, 'CarNumberTraceList4', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11671, 1, 'CarNumberTraceList5', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11672, 1, 'Email', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11673, 1, 'EmailList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11674, 1, 'email-query', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11675, 1, 'email-add', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11676, 1, 'email-update', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11677, 1, 'email-delete', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11678, 1, 'SendMail', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11679, 1, 'email-send', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11680, 1, 'KeepAlive', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11681, 1, 'KeepAliveContentList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11682, 1, 'KeepAliveAddContent', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11683, 1, 'Notice', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11684, 1, 'NoticeList', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11685, 1, 'notice-query', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11686, 1, 'notice-add', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11687, 1, 'notice-edit', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11688, 1, 'notice-delete', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11689, 1, 'notice-detail', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11690, 1, 'notice-send', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11691, 1, 'PersonNotice', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11692, 1, 'person-notice-query', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11693, 1, 'person-notice-detail', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11694, 1, 'NoticeDetail', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11695, 1, 'ThreeRouter', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11696, 1, 'LevelTwo', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11697, 1, 'ThreeLevelRouterView', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11698, 1, 'RoleTwoTwo', '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_role_privilege` VALUES (11699, 1, 'RoleOneOne', '2022-09-11 10:20:53', '2022-09-11 10:20:53');

-- ----------------------------
-- Table structure for t_system_config
-- ----------------------------
DROP TABLE IF EXISTS `t_system_config`;
CREATE TABLE `t_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数名字',
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数key',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数类别',
  `is_using` int(11) NOT NULL COMMENT '是否使用0 否 1 是',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system_config
-- ----------------------------
INSERT INTO `t_system_config` VALUES (1, '超级管理员', 'employee_superman', '12,13,1', 'employee', 1, '123r8566456', '2019-11-14 16:40:48', '2018-08-18 16:28:03');
INSERT INTO `t_system_config` VALUES (13, '本地上传URL前缀', 'local_upload_url_prefix', 'http://172.16.0.145/smartAdmin/file/', 'upload', 1, '', '2019-09-04 16:23:49', '2019-04-26 17:06:53');
INSERT INTO `t_system_config` VALUES (14, '阿里云上传配置', 'ali_oss', '{\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"bucketName\":\"sit\",\"endpoint\":\"http://oss-cn-beijing.aliyuncs.com\"}', 'upload', 1, 'eefwfwfds', '2019-11-16 18:04:30', '2019-05-11 18:00:06');
INSERT INTO `t_system_config` VALUES (15, '邮件发配置', 'email_config', '{\"password\":\"smartadmin\",\"smtpHost\":\"smtp.163.com\",\"username\":\"smartadmin1024@163.com\"}', 'email', 1, NULL, '2019-09-04 16:42:17', '2019-05-13 16:57:48');
INSERT INTO `t_system_config` VALUES (16, '七牛云上传配置', 'qi_niu_oss', '{\"accessKeyId\":\"rX7HgY1ZLpUD25JrA-uwMM_jj-\",\"accessKeySecret\":\"\",\"bucketName\":\"sun-smart-admin\",\"endpoint\":\"http://puvpyay08.bkt.clouddn.com\"}', 'upload', 1, NULL, '2019-11-16 18:04:42', '2019-07-19 16:05:56');
INSERT INTO `t_system_config` VALUES (17, 'test', 'ww_1', 'ewr', '3', 1, 'testoo', '2019-11-08 09:43:36', '2019-11-08 09:27:19');
INSERT INTO `t_system_config` VALUES (18, '4234', '42342', '423423', '23423', 1, '423423111111111111111111111111111111111111423423111111111111111111111111111111111111423423111111111111111111111111111111111111423423111111111111111111111111111111111111423423111111111111111111111111111111111111', '2019-11-14 14:58:39', '2019-11-14 11:22:49');
INSERT INTO `t_system_config` VALUES (19, 'test323@', 'test', '123456', '11_', 1, 'gggggg', '2019-11-15 16:24:52', '2019-11-15 16:24:52');

-- ----------------------------
-- Table structure for t_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_login_log`;
CREATE TABLE `t_user_login_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '员工id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `remote_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ip',
  `remote_port` int(11) NULL DEFAULT NULL COMMENT '用户端口',
  `remote_browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器',
  `remote_os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `login_status` tinyint(4) NOT NULL COMMENT '登录状态 0 失败  1成功',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`user_id`) USING BTREE,
  INDEX `auditor_id`(`remote_browser`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1754 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_login_log
-- ----------------------------
INSERT INTO `t_user_login_log` VALUES (1501, 30, '耿为刚', '172.16.1.234', 61406, 'Chrome', 'Windows 10', 1, '2019-09-06 14:19:47', '2019-09-06 14:19:47');
INSERT INTO `t_user_login_log` VALUES (1502, 30, '耿为刚', '172.16.1.234', 61405, 'Chrome', 'Windows 10', 1, '2019-09-06 14:20:46', '2019-09-06 14:20:46');
INSERT INTO `t_user_login_log` VALUES (1503, 30, '耿为刚', '172.16.1.234', 62213, 'Chrome', 'Windows 10', 1, '2019-09-06 14:28:50', '2019-09-06 14:28:50');
INSERT INTO `t_user_login_log` VALUES (1505, 30, '耿为刚', '172.16.1.234', 62478, 'Chrome', 'Windows 10', 1, '2019-09-06 14:32:57', '2019-09-06 14:32:57');
INSERT INTO `t_user_login_log` VALUES (1506, 1, '管理员', '127.0.0.1', 55613, 'Chrome', 'Windows 10', 1, '2019-09-06 14:35:48', '2019-09-06 14:35:48');
INSERT INTO `t_user_login_log` VALUES (1507, 1, '管理员', '172.16.1.234', 63132, 'Chrome', 'Windows 10', 1, '2019-09-06 14:38:43', '2019-09-06 14:38:43');
INSERT INTO `t_user_login_log` VALUES (1508, 30, '耿为刚', '172.16.1.234', 63132, 'Chrome', 'Windows 10', 1, '2019-09-06 14:41:36', '2019-09-06 14:41:36');
INSERT INTO `t_user_login_log` VALUES (1509, 1, '管理员', '172.16.1.234', 63332, 'Chrome', 'Windows 10', 1, '2019-09-06 14:42:37', '2019-09-06 14:42:37');
INSERT INTO `t_user_login_log` VALUES (1511, 1, '管理员', '172.16.1.166', 29923, 'Chrome', 'Windows 10', 1, '2019-09-06 15:09:22', '2019-09-06 15:09:22');
INSERT INTO `t_user_login_log` VALUES (1512, 1, '管理员', '172.16.1.113', 58150, 'Chrome', 'Windows 7', 1, '2019-09-06 15:23:31', '2019-09-06 15:23:31');
INSERT INTO `t_user_login_log` VALUES (1513, 1, '管理员', '172.16.1.166', 31226, 'Chrome', 'Windows 10', 1, '2019-09-06 15:24:51', '2019-09-06 15:24:51');
INSERT INTO `t_user_login_log` VALUES (1514, 1, '管理员', '172.16.1.113', 58300, 'Chrome', 'Windows 7', 1, '2019-09-06 15:25:04', '2019-09-06 15:25:04');
INSERT INTO `t_user_login_log` VALUES (1515, 1, '管理员', '172.16.1.113', 58300, 'Chrome', 'Windows 7', 1, '2019-09-06 15:25:26', '2019-09-06 15:25:26');
INSERT INTO `t_user_login_log` VALUES (1516, 1, '管理员', '172.16.1.166', 31243, 'Chrome', 'Windows 10', 1, '2019-09-06 15:25:29', '2019-09-06 15:25:29');
INSERT INTO `t_user_login_log` VALUES (1517, 1, '管理员', '172.16.1.221', 61458, 'Chrome', 'Windows 10', 1, '2019-09-06 15:27:07', '2019-09-06 15:27:07');
INSERT INTO `t_user_login_log` VALUES (1518, 1, '管理员', '172.16.1.166', 31243, 'Chrome', 'Windows 10', 1, '2019-09-06 15:27:09', '2019-09-06 15:27:09');
INSERT INTO `t_user_login_log` VALUES (1519, 1, '管理员', '172.16.1.113', 58300, 'Chrome', 'Windows 7', 1, '2019-09-06 15:27:10', '2019-09-06 15:27:10');
INSERT INTO `t_user_login_log` VALUES (1520, 1, '管理员', '172.16.1.166', 31551, 'Chrome', 'Windows 10', 1, '2019-09-06 15:30:01', '2019-09-06 15:30:01');
INSERT INTO `t_user_login_log` VALUES (1521, 1, '管理员', '172.16.4.160', 50527, 'Chrome', 'Windows 10', 1, '2019-09-06 15:50:20', '2019-09-06 15:50:20');
INSERT INTO `t_user_login_log` VALUES (1522, 1, '管理员', '172.16.1.166', 36381, 'Chrome', 'Windows 10', 1, '2019-09-06 16:20:46', '2019-09-06 16:20:46');
INSERT INTO `t_user_login_log` VALUES (1523, 1, '管理员', '172.16.1.166', 40039, 'Chrome', 'Windows 10', 1, '2019-09-06 17:02:33', '2019-09-06 17:02:33');
INSERT INTO `t_user_login_log` VALUES (1524, 1, '管理员', '172.16.1.166', 41014, 'Chrome', 'Windows 10', 1, '2019-09-06 17:16:09', '2019-09-06 17:16:09');
INSERT INTO `t_user_login_log` VALUES (1525, 1, '管理员', '172.16.1.188', 56577, 'Chrome', 'Windows 7', 1, '2019-09-07 08:36:31', '2019-09-07 08:36:31');
INSERT INTO `t_user_login_log` VALUES (1526, 1, '管理员', '172.16.1.48', 60852, 'Chrome', 'Windows 10', 1, '2019-09-07 08:45:02', '2019-09-07 08:45:02');
INSERT INTO `t_user_login_log` VALUES (1527, 1, '管理员', '172.16.4.85', 4818, 'Chrome', 'Windows 10', 1, '2019-09-07 09:04:44', '2019-09-07 09:04:44');
INSERT INTO `t_user_login_log` VALUES (1528, 1, '管理员', '172.16.4.85', 5230, 'Chrome', 'Windows 10', 1, '2019-09-07 09:25:41', '2019-09-07 09:25:41');
INSERT INTO `t_user_login_log` VALUES (1529, 1, '管理员', '172.16.1.166', 10251, 'Chrome', 'Windows 10', 1, '2019-09-07 10:15:20', '2019-09-07 10:15:20');
INSERT INTO `t_user_login_log` VALUES (1530, 1, '管理员', '172.16.1.48', 63877, 'Chrome', 'Windows 10', 1, '2019-09-07 11:26:19', '2019-09-07 11:26:19');
INSERT INTO `t_user_login_log` VALUES (1531, 1, '管理员', '172.16.1.166', 26667, 'Chrome', 'Windows 10', 1, '2019-09-07 14:08:15', '2019-09-07 14:08:15');
INSERT INTO `t_user_login_log` VALUES (1532, 1, '管理员', '172.16.4.85', 10604, 'Chrome', 'Windows 10', 1, '2019-09-07 14:08:33', '2019-09-07 14:08:33');
INSERT INTO `t_user_login_log` VALUES (1533, 1, '管理员', '172.16.4.85', 10604, 'Chrome', 'Windows 10', 1, '2019-09-07 14:08:50', '2019-09-07 14:08:50');
INSERT INTO `t_user_login_log` VALUES (1534, 1, '管理员', '172.16.1.166', 26812, 'Chrome', 'Windows 10', 1, '2019-09-07 14:14:09', '2019-09-07 14:14:09');
INSERT INTO `t_user_login_log` VALUES (1535, 1, '管理员', '172.16.1.188', 52924, 'Chrome', 'Windows 7', 1, '2019-09-07 14:37:16', '2019-09-07 14:37:16');
INSERT INTO `t_user_login_log` VALUES (1536, 1, '管理员', '172.16.1.188', 56721, 'Chrome', 'Windows 7', 1, '2019-09-07 14:49:37', '2019-09-07 14:49:37');
INSERT INTO `t_user_login_log` VALUES (1537, 1, '管理员', '172.16.1.188', 52839, 'Chrome', 'Windows 7', 1, '2019-09-07 15:33:04', '2019-09-07 15:33:04');
INSERT INTO `t_user_login_log` VALUES (1538, 1, '管理员', '172.16.1.166', 32489, 'Chrome', 'Windows 10', 1, '2019-09-07 15:48:02', '2019-09-07 15:48:02');
INSERT INTO `t_user_login_log` VALUES (1539, 1, '管理员', '172.16.1.166', 32847, 'Chrome', 'Windows 10', 1, '2019-09-07 15:52:25', '2019-09-07 15:52:25');
INSERT INTO `t_user_login_log` VALUES (1540, 1, '管理员', '172.16.1.166', 33456, 'Chrome', 'Windows 10', 1, '2019-09-07 16:00:01', '2019-09-07 16:00:01');
INSERT INTO `t_user_login_log` VALUES (1541, 1, '管理员', '172.16.1.188', 61015, 'Chrome', 'Windows 7', 1, '2019-09-07 17:05:49', '2019-09-07 17:05:49');
INSERT INTO `t_user_login_log` VALUES (1542, 1, '管理员', '127.0.0.1', 51566, 'Chrome', 'Windows 7', 1, '2019-09-07 17:31:20', '2019-09-07 17:31:20');
INSERT INTO `t_user_login_log` VALUES (1543, 1, '管理员', '127.0.0.1', 54228, 'Chrome', 'Windows 7', 1, '2019-09-07 17:41:12', '2019-09-07 17:41:12');
INSERT INTO `t_user_login_log` VALUES (1544, 1, '管理员', '127.0.0.1', 54957, 'Chrome', 'Windows 7', 1, '2019-09-07 17:43:21', '2019-09-07 17:43:21');
INSERT INTO `t_user_login_log` VALUES (1545, 1, '管理员', '172.16.4.85', 2336, 'Chrome', 'Windows 10', 1, '2019-09-07 18:25:51', '2019-09-07 18:25:51');
INSERT INTO `t_user_login_log` VALUES (1546, 1, '管理员', '127.0.0.1', 52161, 'Chrome', 'Windows 7', 1, '2019-09-09 08:30:47', '2019-09-09 08:30:47');
INSERT INTO `t_user_login_log` VALUES (1547, 1, '管理员', '172.16.4.85', 5903, 'Chrome', 'Windows 10', 1, '2019-09-09 08:47:47', '2019-09-09 08:47:47');
INSERT INTO `t_user_login_log` VALUES (1548, 1, '管理员', '172.16.1.243', 55673, 'Chrome', 'Windows 10', 1, '2019-09-09 11:25:02', '2019-09-09 11:25:02');
INSERT INTO `t_user_login_log` VALUES (1549, 1, '管理员', '172.16.4.85', 4672, 'Chrome', 'Windows 10', 1, '2019-09-09 11:25:34', '2019-09-09 11:25:34');
INSERT INTO `t_user_login_log` VALUES (1550, 1, '管理员', '172.16.1.188', 61186, 'Chrome', 'Windows 7', 1, '2019-09-09 11:39:24', '2019-09-09 11:39:24');
INSERT INTO `t_user_login_log` VALUES (1551, 1, '管理员', '172.16.4.85', 3032, 'Chrome', 'Windows 10', 1, '2019-09-09 14:17:53', '2019-09-09 14:17:53');
INSERT INTO `t_user_login_log` VALUES (1552, 1, '管理员', '172.16.4.85', 5829, 'Chrome', 'Windows 10', 1, '2019-09-09 14:54:27', '2019-09-09 14:54:27');
INSERT INTO `t_user_login_log` VALUES (1553, 1, '管理员', '172.16.1.166', 23398, 'Chrome', 'Windows 10', 1, '2019-09-09 15:06:50', '2019-09-09 15:06:50');
INSERT INTO `t_user_login_log` VALUES (1554, 1, '管理员', '172.16.5.60', 61094, 'Chrome', 'Windows 10', 1, '2019-09-09 15:20:50', '2019-09-09 15:20:50');
INSERT INTO `t_user_login_log` VALUES (1555, 1, '管理员', '172.16.4.85', 10566, 'Chrome', 'Windows 10', 1, '2019-09-09 15:51:22', '2019-09-09 15:51:22');
INSERT INTO `t_user_login_log` VALUES (1556, 1, '管理员', '172.16.1.166', 32190, 'Chrome', 'Windows 10', 1, '2019-09-09 17:00:59', '2019-09-09 17:00:59');
INSERT INTO `t_user_login_log` VALUES (1557, 1, '管理员', '172.16.5.60', 54502, 'Chrome', 'Windows 10', 1, '2019-09-10 09:10:48', '2019-09-10 09:10:48');
INSERT INTO `t_user_login_log` VALUES (1558, 1, '管理员', '172.16.4.85', 10659, 'Chrome', 'Windows 10', 1, '2019-09-10 09:21:48', '2019-09-10 09:21:48');
INSERT INTO `t_user_login_log` VALUES (1559, 1, '管理员', '172.16.4.85', 3363, 'Chrome', 'Windows 10', 1, '2019-09-10 10:56:23', '2019-09-10 10:56:23');
INSERT INTO `t_user_login_log` VALUES (1560, 1, '管理员', '172.16.4.85', 4460, 'Chrome', 'Windows 10', 1, '2019-09-10 14:23:44', '2019-09-10 14:23:44');
INSERT INTO `t_user_login_log` VALUES (1561, 1, '管理员', '172.16.4.85', 7344, 'Chrome', 'Windows 10', 1, '2019-09-10 14:59:52', '2019-09-10 14:59:52');
INSERT INTO `t_user_login_log` VALUES (1562, 1, '管理员', '172.16.5.89', 49996, 'Chrome', 'Windows 10', 1, '2019-09-10 18:08:04', '2019-09-10 18:08:04');
INSERT INTO `t_user_login_log` VALUES (1563, 1, '管理员', '172.16.1.38', 50152, 'Chrome', 'Windows 10', 1, '2019-09-11 10:19:27', '2019-09-11 10:19:27');
INSERT INTO `t_user_login_log` VALUES (1564, 1, '管理员', '172.16.1.38', 50173, 'Chrome', 'Windows 10', 1, '2019-09-11 10:20:38', '2019-09-11 10:20:38');
INSERT INTO `t_user_login_log` VALUES (1565, 1, '管理员', '172.16.4.141', 60881, 'Chrome', 'Windows 10', 1, '2019-09-11 14:52:02', '2019-09-11 14:52:02');
INSERT INTO `t_user_login_log` VALUES (1566, 1, '管理员', '172.16.4.93', 52688, 'Chrome', 'Windows 10', 1, '2019-09-11 15:15:14', '2019-09-11 15:15:14');
INSERT INTO `t_user_login_log` VALUES (1567, 1, '管理员', '172.16.5.127', 54993, 'Chrome', 'Windows 10', 1, '2019-09-12 14:29:58', '2019-09-12 14:29:58');
INSERT INTO `t_user_login_log` VALUES (1568, 1, '管理员', '172.16.5.127', 57424, 'Chrome', 'Windows 10', 1, '2019-09-12 15:26:46', '2019-09-12 15:26:46');
INSERT INTO `t_user_login_log` VALUES (1569, 1, '管理员', '172.16.5.127', 58073, 'Chrome', 'Windows 10', 1, '2019-09-12 15:41:54', '2019-09-12 15:41:54');
INSERT INTO `t_user_login_log` VALUES (1570, 1, '管理员', '172.16.5.146', 63230, 'Chrome', 'Windows 10', 1, '2019-09-16 10:17:15', '2019-09-16 10:17:15');
INSERT INTO `t_user_login_log` VALUES (1571, 1, '管理员', '172.16.5.146', 52857, 'Chrome', 'Windows 10', 1, '2019-09-16 11:17:18', '2019-09-16 11:17:18');
INSERT INTO `t_user_login_log` VALUES (1572, 1, '管理员', '172.16.1.190', 64527, 'Chrome', 'Windows 10', 1, '2019-09-19 14:06:45', '2019-09-19 14:06:45');
INSERT INTO `t_user_login_log` VALUES (1573, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:24:33', '2019-09-20 17:24:33');
INSERT INTO `t_user_login_log` VALUES (1574, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:24:43', '2019-09-20 17:24:43');
INSERT INTO `t_user_login_log` VALUES (1575, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:24:59', '2019-09-20 17:24:59');
INSERT INTO `t_user_login_log` VALUES (1576, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:26:05', '2019-09-20 17:26:05');
INSERT INTO `t_user_login_log` VALUES (1577, 1, '管理员', '127.0.0.1', 60612, 'Chrome', 'Windows 7', 1, '2019-09-20 17:56:06', '2019-09-20 17:56:06');
INSERT INTO `t_user_login_log` VALUES (1578, 1, '管理员', '172.16.1.202', 58066, 'Chrome', 'Windows 7', 1, '2019-09-22 18:25:03', '2019-09-22 18:25:03');
INSERT INTO `t_user_login_log` VALUES (1579, 1, '管理员', '172.16.1.48', 52290, 'Chrome', 'Windows 10', 1, '2019-09-23 16:01:16', '2019-09-23 16:01:16');
INSERT INTO `t_user_login_log` VALUES (1580, 1, '管理员', '172.16.4.141', 60997, 'Chrome', 'Windows 10', 1, '2019-09-23 17:16:55', '2019-09-23 17:16:55');
INSERT INTO `t_user_login_log` VALUES (1581, 1, '管理员', '172.16.5.146', 53246, 'Chrome', 'Windows 10', 1, '2019-09-23 17:54:14', '2019-09-23 17:54:14');
INSERT INTO `t_user_login_log` VALUES (1582, 1, '管理员', '127.0.0.1', 51987, 'Chrome', 'Windows 7', 1, '2019-09-24 09:16:37', '2019-09-24 09:16:37');
INSERT INTO `t_user_login_log` VALUES (1583, 1, '管理员', '172.16.1.202', 55724, 'Chrome', 'Windows 7', 1, '2019-09-24 12:57:39', '2019-09-24 12:57:39');
INSERT INTO `t_user_login_log` VALUES (1584, 1, '管理员', '172.16.1.166', 51876, 'Chrome', 'Windows 10', 1, '2019-09-24 16:24:37', '2019-09-24 16:24:37');
INSERT INTO `t_user_login_log` VALUES (1585, 1, '管理员', '172.16.1.202', 51648, 'Chrome', 'Windows 7', 1, '2019-09-24 19:26:39', '2019-09-24 19:26:39');
INSERT INTO `t_user_login_log` VALUES (1586, 1, '管理员', '172.16.1.234', 60984, 'Chrome', 'Windows 10', 1, '2019-09-26 10:52:07', '2019-09-26 10:52:07');
INSERT INTO `t_user_login_log` VALUES (1587, 1, '管理员', '172.16.1.234', 63440, 'Chrome', 'Windows 10', 1, '2019-09-26 11:30:54', '2019-09-26 11:30:54');
INSERT INTO `t_user_login_log` VALUES (1588, 1, '管理员', '172.16.1.202', 51956, 'Chrome', 'Windows 7', 1, '2019-09-27 20:55:08', '2019-09-27 20:55:08');
INSERT INTO `t_user_login_log` VALUES (1589, 1, '管理员', '172.16.1.48', 56166, 'Chrome', 'Windows 10', 1, '2019-09-30 08:59:13', '2019-09-30 08:59:13');
INSERT INTO `t_user_login_log` VALUES (1590, 1, '管理员', '172.16.1.202', 51448, 'Chrome', 'Windows 7', 1, '2019-09-30 09:00:13', '2019-09-30 09:00:13');
INSERT INTO `t_user_login_log` VALUES (1591, 1, '管理员', '172.16.1.188', 62679, 'Chrome', 'Windows 7', 1, '2019-10-15 11:25:26', '2019-10-15 11:25:26');
INSERT INTO `t_user_login_log` VALUES (1592, 1, '管理员', '172.16.1.234', 54034, 'Chrome', 'Windows 10', 1, '2019-10-18 10:47:14', '2019-10-18 10:47:14');
INSERT INTO `t_user_login_log` VALUES (1593, 1, '管理员', '172.16.1.234', 64515, 'Chrome', 'Windows 10', 1, '2019-10-18 13:32:10', '2019-10-18 13:32:10');
INSERT INTO `t_user_login_log` VALUES (1594, 1, '管理员', '172.16.1.234', 50211, 'Chrome', 'Windows 10', 1, '2019-10-18 13:56:19', '2019-10-18 13:56:19');
INSERT INTO `t_user_login_log` VALUES (1595, 1, '管理员', '172.16.1.234', 55469, 'Chrome', 'Windows 10', 1, '2019-10-18 14:56:24', '2019-10-18 14:56:24');
INSERT INTO `t_user_login_log` VALUES (1596, 1, '管理员', '172.16.1.234', 56392, 'Chrome', 'Windows 10', 1, '2019-10-18 15:08:25', '2019-10-18 15:08:25');
INSERT INTO `t_user_login_log` VALUES (1597, 1, '管理员', '172.16.1.234', 60896, 'Chrome', 'Windows 10', 1, '2019-10-18 16:14:15', '2019-10-18 16:14:15');
INSERT INTO `t_user_login_log` VALUES (1598, 1, '管理员', '172.16.1.234', 50590, 'Chrome', 'Windows 10', 1, '2019-10-19 08:38:54', '2019-10-19 08:38:54');
INSERT INTO `t_user_login_log` VALUES (1599, 1, '管理员', '172.16.1.166', 4879, 'Chrome', 'Windows 10', 1, '2019-10-19 09:19:08', '2019-10-19 09:19:08');
INSERT INTO `t_user_login_log` VALUES (1600, 1, '管理员', '172.16.1.188', 62895, 'Chrome', 'Windows 7', 1, '2019-10-19 13:49:29', '2019-10-19 13:49:29');
INSERT INTO `t_user_login_log` VALUES (1601, 1, '管理员', '172.16.1.234', 58144, 'Chrome', 'Windows 10', 1, '2019-10-19 14:55:50', '2019-10-19 14:55:50');
INSERT INTO `t_user_login_log` VALUES (1602, 1, '管理员', '127.0.0.1', 61033, 'Chrome', 'Windows 7', 1, '2019-10-19 15:19:38', '2019-10-19 15:19:38');
INSERT INTO `t_user_login_log` VALUES (1603, 1, '管理员', '172.16.1.188', 58944, 'Chrome', 'Windows 7', 1, '2019-10-19 16:48:49', '2019-10-19 16:48:49');
INSERT INTO `t_user_login_log` VALUES (1604, 1, '管理员', '172.16.1.188', 63950, 'Chrome', 'Windows 7', 1, '2019-10-21 08:10:38', '2019-10-21 08:10:38');
INSERT INTO `t_user_login_log` VALUES (1605, 1, '管理员', '172.16.1.188', 64899, 'Chrome', 'Windows 7', 1, '2019-10-21 08:17:40', '2019-10-21 08:17:40');
INSERT INTO `t_user_login_log` VALUES (1606, 1, '管理员', '172.16.1.221', 53180, 'Chrome', 'Windows 10', 1, '2019-10-21 15:52:36', '2019-10-21 15:52:36');
INSERT INTO `t_user_login_log` VALUES (1607, 1, '管理员', '172.16.1.221', 56067, 'Chrome', 'Windows 10', 1, '2019-10-23 10:19:39', '2019-10-23 10:19:39');
INSERT INTO `t_user_login_log` VALUES (1608, 1, '管理员', '172.16.1.221', 57692, 'Chrome', 'Windows 10', 1, '2019-10-23 16:36:39', '2019-10-23 16:36:39');
INSERT INTO `t_user_login_log` VALUES (1609, 1, '管理员', '172.16.1.188', 57180, 'Chrome', 'Windows 7', 1, '2019-10-24 08:26:21', '2019-10-24 08:26:21');
INSERT INTO `t_user_login_log` VALUES (1610, 1, '管理员', '172.16.0.196', 61409, 'Chrome', 'Windows 10', 1, '2019-10-24 08:26:55', '2019-10-24 08:26:55');
INSERT INTO `t_user_login_log` VALUES (1611, 1, '管理员', '172.16.1.234', 51906, 'Chrome', 'Windows 10', 1, '2019-10-24 15:56:50', '2019-10-24 15:56:50');
INSERT INTO `t_user_login_log` VALUES (1612, 1, '管理员', '172.16.1.234', 56793, 'Chrome', 'Windows 10', 1, '2019-10-24 17:04:54', '2019-10-24 17:04:54');
INSERT INTO `t_user_login_log` VALUES (1613, 30, '耿为刚', '172.16.1.234', 60368, 'Chrome', 'Windows 10', 1, '2019-10-24 17:51:13', '2019-10-24 17:51:13');
INSERT INTO `t_user_login_log` VALUES (1614, 1, '管理员', '172.16.1.234', 60368, 'Chrome', 'Windows 10', 1, '2019-10-24 17:51:56', '2019-10-24 17:51:56');
INSERT INTO `t_user_login_log` VALUES (1615, 30, '耿为刚', '172.16.1.234', 60589, 'Chrome 65', 'Windows 10', 1, '2019-10-24 17:52:52', '2019-10-24 17:52:52');
INSERT INTO `t_user_login_log` VALUES (1616, 1, '管理员', '172.16.1.234', 52998, 'Chrome', 'Windows 10', 1, '2019-10-25 09:28:13', '2019-10-25 09:28:13');
INSERT INTO `t_user_login_log` VALUES (1617, 1, '管理员', '172.16.1.234', 54948, 'Chrome', 'Windows 10', 1, '2019-10-25 10:01:34', '2019-10-25 10:01:34');
INSERT INTO `t_user_login_log` VALUES (1618, 1, '管理员', '172.16.1.234', 56800, 'Chrome', 'Windows 10', 1, '2019-10-25 10:32:53', '2019-10-25 10:32:53');
INSERT INTO `t_user_login_log` VALUES (1619, 1, '管理员', '127.0.0.1', 59071, 'Chrome', 'Windows 7', 1, '2019-10-28 16:05:21', '2019-10-28 16:05:21');
INSERT INTO `t_user_login_log` VALUES (1620, 1, '管理员', '127.0.0.1', 60106, 'Chrome', 'Windows 7', 1, '2019-10-28 16:11:29', '2019-10-28 16:11:29');
INSERT INTO `t_user_login_log` VALUES (1621, 1, '管理员', '127.0.0.1', 63479, 'Chrome', 'Windows 7', 1, '2019-10-28 16:28:59', '2019-10-28 16:28:59');
INSERT INTO `t_user_login_log` VALUES (1622, 1, '管理员', '127.0.0.1', 63479, 'Chrome', 'Windows 7', 1, '2019-10-28 16:29:55', '2019-10-28 16:29:55');
INSERT INTO `t_user_login_log` VALUES (1623, 1, '管理员', '127.0.0.1', 57588, 'Chrome', 'Windows 7', 1, '2019-10-29 15:37:03', '2019-10-29 15:37:03');
INSERT INTO `t_user_login_log` VALUES (1741, 1, '管理员', '127.0.0.1', 54621, 'Chrome', 'Windows 7', 1, '2019-11-16 18:03:45', '2019-11-16 18:03:45');
INSERT INTO `t_user_login_log` VALUES (1742, 1, '管理员', '127.0.0.1', 60932, 'Chrome 8', 'Windows 10', 1, '2020-12-14 15:14:55', '2020-12-14 15:14:55');
INSERT INTO `t_user_login_log` VALUES (1743, 1, '管理员', '127.0.0.1', 56164, 'Chrome 10', 'Windows 10', 1, '2022-09-03 16:27:12', '2022-09-03 16:27:12');
INSERT INTO `t_user_login_log` VALUES (1744, 1, '管理员', '127.0.0.1', 58498, 'Chrome 10', 'Windows 10', 1, '2022-09-03 18:16:37', '2022-09-03 18:16:37');
INSERT INTO `t_user_login_log` VALUES (1745, 1, '管理员', '127.0.0.1', 54340, 'Chrome 10', 'Windows 10', 1, '2022-09-03 22:32:11', '2022-09-03 22:32:11');
INSERT INTO `t_user_login_log` VALUES (1746, 1, '管理员', '127.0.0.1', 63302, 'Robot/Spider', 'Unknown', 1, '2022-09-04 13:03:47', '2022-09-04 13:03:47');
INSERT INTO `t_user_login_log` VALUES (1747, 1, '管理员', '127.0.0.1', 63927, 'Chrome 10', 'Windows 10', 1, '2022-09-04 13:09:46', '2022-09-04 13:09:46');
INSERT INTO `t_user_login_log` VALUES (1748, 1, '管理员', '127.0.0.1', 53677, 'Robot/Spider', 'Unknown', 1, '2022-09-04 13:47:03', '2022-09-04 13:47:03');
INSERT INTO `t_user_login_log` VALUES (1749, 1, '管理员', '127.0.0.1', 63944, 'Chrome 10', 'Windows 10', 1, '2022-09-04 20:31:48', '2022-09-04 20:31:48');
INSERT INTO `t_user_login_log` VALUES (1750, 1, '管理员', '127.0.0.1', 54130, 'Chrome 10', 'Windows 10', 1, '2022-09-05 21:47:22', '2022-09-05 21:47:22');
INSERT INTO `t_user_login_log` VALUES (1751, 1, '管理员', '127.0.0.1', 52792, 'Chrome 10', 'Windows 10', 1, '2022-09-06 20:25:52', '2022-09-06 20:25:52');
INSERT INTO `t_user_login_log` VALUES (1752, 1, '管理员', '127.0.0.1', 53388, 'Chrome 10', 'Windows 10', 1, '2022-09-09 21:47:44', '2022-09-09 21:47:44');
INSERT INTO `t_user_login_log` VALUES (1753, 1, '管理员', '127.0.0.1', 49611, 'Chrome 10', 'Windows 10', 1, '2022-09-10 21:50:02', '2022-09-10 21:50:02');

-- ----------------------------
-- Table structure for t_user_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_operate_log`;
CREATE TABLE `t_user_operate_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作模块',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求路径',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方法',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `result` tinyint(4) NULL DEFAULT NULL COMMENT '请求结果 0失败 1成功',
  `fail_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '失败原因',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 520 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_operate_log
-- ----------------------------
INSERT INTO `t_user_operate_log` VALUES (1, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (2, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.gangquan360.smartadmin.module.role.basic.RoleController.getAllRole', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (3, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (4, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.gangquan360.smartadmin.module.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true,\"sort\":false}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (5, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.gangquan360.smartadmin.module.role.basic.RoleController.getAllRole', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (6, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.gangquan360.smartadmin.module.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (7, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.gangquan360.smartadmin.module.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (8, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.gangquan360.smartadmin.module.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (9, 1, '管理员', '管理端-用户', '员工重置密码', '/smart-admin-api/employee/resetPasswd/29', 'com.gangquan360.smartadmin.module.employee.EmployeeController.resetPasswd', 'Integer[29]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (10, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.gangquan360.smartadmin.module.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (11, 1, '管理员', '管理端-角色用户', '通过员工id获取所有角色以及员工具有的角色', '/smart-admin-api/role/getRoles/29', 'com.gangquan360.smartadmin.module.role.roleemployee.RoleEmployeeController.getRoleByEmployeeId', 'Long[29]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (12, 1, '管理员', '管理端-用户', '单个员工角色授权', '/smart-admin-api/employee/updateRoles', 'com.gangquan360.smartadmin.module.employee.EmployeeController.updateRoles', 'EmployeeUpdateRolesDTO[{\"employeeId\":29,\"roleIds\":[34,45]}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (13, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.gangquan360.smartadmin.module.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (14, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"Notice\",\"NoticeList\",\"PersonNotice\",\"Email\",\"EmailList\",\"SendMail\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"ThreeRouter\",\"LevelTwo\",\"RoleOneTwo\",\"RoleTwoTwo\",\"RoleOneOne\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"email-send\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\"],\"roleId\":1}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (15, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (16, 1, '管理员', '管理端-系统配置', '分页查询所有系统配置', '/smart-admin-api/systemConfig/getListPage', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.getSystemConfigPage', 'SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (17, 1, '管理员', '管理端-系统配置', '修改配置参数', '/smart-admin-api/systemConfig/update', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.updateSystemConfig', 'SystemConfigUpdateDTO[{\"configGroup\":\"upload\",\"configKey\":\"ali_oss\",\"configName\":\"阿里云上传配置\",\"configValue\":\"{\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"sit\\\",\\\"endpoint\\\":\\\"http://oss-cn-beijing.aliyuncs.com\\\"}\",\"id\":14,\"remark\":\"eefwfwfds\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (18, 1, '管理员', '管理端-系统配置', '分页查询所有系统配置', '/smart-admin-api/systemConfig/getListPage', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.getSystemConfigPage', 'SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (19, 1, '管理员', '管理端-系统配置', '修改配置参数', '/smart-admin-api/systemConfig/update', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.updateSystemConfig', 'SystemConfigUpdateDTO[{\"configGroup\":\"upload\",\"configKey\":\"qi_niu_oss\",\"configName\":\"七牛云上传配置\",\"configValue\":\"{\\\"accessKeyId\\\":\\\"rX7HgY1ZLpUD25JrA-uwMM_jj-\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"sun-smart-admin\\\",\\\"endpoint\\\":\\\"http://puvpyay08.bkt.clouddn.com\\\"}\",\"id\":16}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (20, 1, '管理员', '管理端-系统配置', '分页查询所有系统配置', '/smart-admin-api/systemConfig/getListPage', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.getSystemConfigPage', 'SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (21, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (22, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (23, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/FileList', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.functionQuery', 'String[\"FileList\"]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (24, 1, '管理员', '通用-权限', '保存更新功能点', '/smart-admin-api/privilege/function/saveOrUpdate', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.functionSaveOrUpdate', 'PrivilegeFunctionDTO[{\"functionKey\":\"file-filePage-download\",\"functionName\":\"下载\",\"menuKey\":\"FileList\",\"sort\":2,\"url\":\"fileController.downLoadById\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (25, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/FileList', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.functionQuery', 'String[\"FileList\"]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (26, 1, '管理员', '通用-邮件发送', '分页查询', '/smart-admin-api/email/page/query', 'com.gangquan360.smartadmin.module.email.EmailController.queryByPage', 'EmailQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (27, 1, '管理员', '管理端-用户操作日志', '分页查询', '/smart-admin-api/userOperateLog/page/query', 'com.gangquan360.smartadmin.module.log.useroperatelog.UserOperateLogController.queryByPage', 'UserOperateLogQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"sort\":false,\"startDate\":\"\",\"userName\":\"\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (28, 1, '管理员', '管理端-用户登录日志', '分页查询用户登录日志', '/smart-admin-api/userLoginLog/page/query', 'com.gangquan360.smartadmin.module.log.userloginlog.UserLoginLogController.queryByPage', 'UserLoginLogQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"sort\":false,\"startDate\":\"\",\"userName\":\"\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (29, 1, '管理员', '管理端-用户登录日志', '查询员工在线状态', '/smart-admin-api/userOnLine/query', 'com.gangquan360.smartadmin.module.log.userloginlog.UserLoginLogController.queryUserOnLine', 'EmployeeQueryDTO[{\"actualName\":\"\",\"employeeIds\":[1],\"isDelete\":0,\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (30, 1, '管理员', '管理端-任务调度', '查询任务', '/smart-admin-api/quartz/task/query', 'com.gangquan360.smartadmin.module.quartz.controller.QuartzController.query', 'QuartzQueryDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (31, 1, '管理员', '管理端-smart reload', '获取全部Smart-reload项', '/smart-admin-api/smartReload/all', 'com.gangquan360.smartadmin.module.smartreload.SmartReloadController.listAllReloadItem', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (32, 1, '管理员', '通用-心跳服务', '查询心跳记录 @author zhuoda', '/smart-admin-api/heartBeat/query', 'com.gangquan360.smartadmin.module.heartbeat.HeartBeatController.query', 'PageParamDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (33, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2020-12-14 15:15:06', '2020-12-14 15:15:06');
INSERT INTO `t_user_operate_log` VALUES (34, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:15:06', '2020-12-14 15:15:06');
INSERT INTO `t_user_operate_log` VALUES (35, 1, '管理员', '通用-权限', '菜单批量保存', '/smart-admin-api/privilege/menu/batchSaveMenu', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.menuBatchSave', 'ValidateList[[{\"menuKey\":\"Business\",\"menuName\":\"业务功能\",\"sort\":0,\"type\":1,\"url\":\"/business\"},{\"menuKey\":\"Peony\",\"menuName\":\"牡丹管理\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/peony\"},{\"menuKey\":\"PeonyList\",\"menuName\":\"牡丹花列表\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/peony-list\"},{\"menuKey\":\"PeonyList1\",\"menuName\":\"牡丹花列表1\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/peony-list1\"},{\"menuKey\":\"StationList\",\"menuName\":\"站点状态\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/station_list\"},{\"menuKey\":\"OrderList\",\"menuName\":\"车辆明细查询\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/order_list\"},{\"menuKey\":\"CarNumberMatchTrackList\",\"menuName\":\"加油站车辆识别情况跟踪\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/car_number_match_track\"},{\"menuKey\":\"CarNumberReviseList\",\"menuName\":\"车牌矫正\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/car_number_revise\"},{\"menuKey\":\"GrowthAnalyseList\",\"menuName\":\"同比(环比)\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/growth_analyse\"},{\"menuKey\":\"Email\",\"menuName\":\"邮件管理\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/email\"},{\"menuKey\":\"EmailList\",\"menuName\":\"邮件管理\",\"parentKey\":\"Email\",\"sort\":0,\"type\":1,\"url\":\"/email/email-list\"},{\"menuKey\":\"SendMail\",\"menuName\":\"发送邮件\",\"parentKey\":\"Email\",\"sort\":0,\"type\":1,\"url\":\"/email/send-mail\"},{\"menuKey\":\"KeepAlive\",\"menuName\":\"KeepAlive\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/keep-alive\"},{\"menuKey\":\"KeepAliveContentList\",\"menuName\":\"KeepAlive列表\",\"parentKey\":\"KeepAlive\",\"sort\":0,\"type\":1,\"url\":\"/keep-alive/content-list\"},{\"menuKey\":\"KeepAliveAddContent\",\"menuName\":\"KeepAlive表单\",\"parentKey\":\"KeepAlive\",\"sort\":0,\"type\":1,\"url\":\"/keep-alive/add-content\"},{\"menuKey\":\"Notice\",\"menuName\":\"消息管理\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/notice\"},{\"menuKey\":\"NoticeList\",\"menuName\":\"通知管理\",\"parentKey\":\"Notice\",\"sort\":0,\"type\":1,\"url\":\"/notice/notice-list\"},{\"menuKey\":\"PersonNotice\",\"menuName\":\"个人消息\",\"parentKey\":\"Notice\",\"sort\":0,\"type\":1,\"url\":\"/notice/person-notice\"},{\"menuKey\":\"NoticeDetail\",\"menuName\":\"消息详情\",\"parentKey\":\"Notice\",\"sort\":0,\"type\":1,\"url\":\"/notice/notice-detail\"},{\"menuKey\":\"ThreeRouter\",\"menuName\":\"三级路由\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/three-router\"},{\"menuKey\":\"LevelTwo\",\"menuName\":\"三级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two\"},{\"menuKey\":\"ThreeLevelRouterView\",\"menuName\":\"三级菜单子颗粒\",\"parentKey\":\"LevelTwo\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two/level-three1\"},{\"menuKey\":\"RoleTwoTwo\",\"menuName\":\"三级菜单子哈\",\"parentKey\":\"LevelTwo\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two/level-three2\"},{\"menuKey\":\"RoleOneOne\",\"menuName\":\"二级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two2\"},{\"menuKey\":\"System\",\"menuName\":\"系统设置\",\"sort\":0,\"type\":1,\"url\":\"/system\"},{\"menuKey\":\"Employee\",\"menuName\":\"人员管理\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/employee\"},{\"menuKey\":\"RoleManage\",\"menuName\":\"角色管理\",\"parentKey\":\"Employee\",\"sort\":0,\"type\":1,\"url\":\"/employee/role\"},{\"menuKey\":\"PositionList\",\"menuName\":\"岗位管理\",\"parentKey\":\"Employee\",\"sort\":0,\"type\":1,\"url\":\"/employee/position\"},{\"menuKey\":\"RoleEmployeeManage\",\"menuName\":\"员工管理\",\"parentKey\":\"Employee\",\"sort\":0,\"type\":1,\"url\":\"/employee/role-employee-manage\"},{\"menuKey\":\"File\",\"menuName\":\"文件服务\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/file\"},{\"menuKey\":\"FileList\",\"menuName\":\"文件列表\",\"parentKey\":\"File\",\"sort\":0,\"type\":1,\"url\":\"/file/file-list\"},{\"menuKey\":\"UserLog\",\"menuName\":\"用户日志\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/user-log\"},{\"menuKey\":\"UserOperateLog\",\"menuName\":\"用户操作日志\",\"parentKey\":\"UserLog\",\"sort\":0,\"type\":1,\"url\":\"/user-log/user-operate-log\"},{\"menuKey\":\"UserLoginLog\",\"menuName\":\"用户登录日志\",\"parentKey\":\"UserLog\",\"sort\":0,\"type\":1,\"url\":\"/user-log/user-login-log\"},{\"menuKey\":\"SystemSetting\",\"menuName\":\"系统设置\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/system-setting\"},{\"menuKey\":\"SystemConfig\",\"menuName\":\"系统参数\",\"parentKey\":\"SystemSetting\",\"sort\":0,\"type\":1,\"url\":\"/system-setting/system-config\"},{\"menuKey\":\"SystemPrivilege\",\"menuName\":\"菜单设置\",\"parentKey\":\"SystemSetting\",\"sort\":0,\"type\":1,\"url\":\"/system-setting/system-privilege\"},{\"menuKey\":\"Support\",\"menuName\":\"开发专用\",\"sort\":0,\"type\":1,\"url\":\"/support\"},{\"menuKey\":\"ApiDoc\",\"menuName\":\"接口文档\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/api-doc\"},{\"menuKey\":\"Swagger\",\"menuName\":\"Swagger接口文档\",\"parentKey\":\"ApiDoc\",\"sort\":0,\"type\":1,\"url\":\"/api-doc/swagger\"},{\"menuKey\":\"HeartBeat\",\"menuName\":\"心跳服务\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/heart-beat\"},{\"menuKey\":\"HeartBeatList\",\"menuName\":\"心跳服务\",\"parentKey\":\"HeartBeat\",\"sort\":0,\"type\":1,\"url\":\"/heart-beat/heart-beat-list\"},{\"menuKey\":\"Monitor\",\"menuName\":\"系统监控\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/monitor\"},{\"menuKey\":\"OnlineUser\",\"menuName\":\"在线人数\",\"parentKey\":\"Monitor\",\"sort\":0,\"type\":1,\"url\":\"/monitor/online-user\"},{\"menuKey\":\"Sql\",\"menuName\":\"SQL监控\",\"parentKey\":\"Monitor\",\"sort\":0,\"type\":1,\"url\":\"/monitor/sql\"},{\"menuKey\":\"Reload\",\"menuName\":\"动态加载\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/reload\"},{\"menuKey\":\"SmartReloadList\",\"menuName\":\"SmartReload\",\"parentKey\":\"Reload\",\"sort\":0,\"type\":1,\"url\":\"/reload/smart-reload-list\"},{\"menuKey\":\"Task\",\"menuName\":\"定时任务\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/task\"},{\"menuKey\":\"TaskList\",\"menuName\":\"任务管理\",\"parentKey\":\"Task\",\"sort\":0,\"type\":1,\"url\":\"/system-setting/task-list\"}]]', 1, NULL, '2022-09-03 22:55:26', '2020-12-14 15:15:07');
INSERT INTO `t_user_operate_log` VALUES (36, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:15:07', '2020-12-14 15:15:07');
INSERT INTO `t_user_operate_log` VALUES (37, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2020-12-14 15:15:29', '2020-12-14 15:15:29');
INSERT INTO `t_user_operate_log` VALUES (38, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2020-12-14 15:16:25', '2020-12-14 15:16:25');
INSERT INTO `t_user_operate_log` VALUES (39, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:16:25', '2020-12-14 15:16:25');
INSERT INTO `t_user_operate_log` VALUES (40, 1, '管理员', '通用-权限', '菜单批量保存', '/smart-admin-api/privilege/menu/batchSaveMenu', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.menuBatchSave', 'ValidateList[[{\"menuKey\":\"Business\",\"menuName\":\"业务功能\",\"sort\":0,\"type\":1,\"url\":\"/business\"},{\"menuKey\":\"Peony\",\"menuName\":\"牡丹管理\",\"parentKey\":\"Business\",\"sort\":1,\"type\":1,\"url\":\"/peony\"},{\"menuKey\":\"PeonyList\",\"menuName\":\"牡丹花列表\",\"parentKey\":\"Peony\",\"sort\":2,\"type\":1,\"url\":\"/peony/peony-list\"},{\"menuKey\":\"PeonyList1\",\"menuName\":\"牡丹花列表1\",\"parentKey\":\"Peony\",\"sort\":3,\"type\":1,\"url\":\"/peony/peony-list1\"},{\"menuKey\":\"Email\",\"menuName\":\"邮件管理\",\"parentKey\":\"Business\",\"sort\":4,\"type\":1,\"url\":\"/email\"},{\"menuKey\":\"EmailList\",\"menuName\":\"邮件管理\",\"parentKey\":\"Email\",\"sort\":5,\"type\":1,\"url\":\"/email/email-list\"},{\"menuKey\":\"SendMail\",\"menuName\":\"发送邮件\",\"parentKey\":\"Email\",\"sort\":6,\"type\":1,\"url\":\"/email/send-mail\"},{\"menuKey\":\"KeepAlive\",\"menuName\":\"KeepAlive\",\"parentKey\":\"Business\",\"sort\":7,\"type\":1,\"url\":\"/keep-alive\"},{\"menuKey\":\"KeepAliveContentList\",\"menuName\":\"KeepAlive列表\",\"parentKey\":\"KeepAlive\",\"sort\":8,\"type\":1,\"url\":\"/keep-alive/content-list\"},{\"menuKey\":\"KeepAliveAddContent\",\"menuName\":\"KeepAlive表单\",\"parentKey\":\"KeepAlive\",\"sort\":9,\"type\":1,\"url\":\"/keep-alive/add-content\"},{\"menuKey\":\"Notice\",\"menuName\":\"消息管理\",\"parentKey\":\"Business\",\"sort\":10,\"type\":1,\"url\":\"/notice\"},{\"menuKey\":\"NoticeList\",\"menuName\":\"通知管理\",\"parentKey\":\"Notice\",\"sort\":11,\"type\":1,\"url\":\"/notice/notice-list\"},{\"menuKey\":\"PersonNotice\",\"menuName\":\"个人消息\",\"parentKey\":\"Notice\",\"sort\":12,\"type\":1,\"url\":\"/notice/person-notice\"},{\"menuKey\":\"NoticeDetail\",\"menuName\":\"消息详情\",\"parentKey\":\"Notice\",\"sort\":13,\"type\":1,\"url\":\"/notice/notice-detail\"},{\"menuKey\":\"ThreeRouter\",\"menuName\":\"三级路由\",\"parentKey\":\"Business\",\"sort\":14,\"type\":1,\"url\":\"/three-router\"},{\"menuKey\":\"LevelTwo\",\"menuName\":\"三级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":15,\"type\":1,\"url\":\"/three-router/level-two\"},{\"menuKey\":\"ThreeLevelRouterView\",\"menuName\":\"三级菜单子颗粒\",\"parentKey\":\"LevelTwo\",\"sort\":16,\"type\":1,\"url\":\"/three-router/level-two/level-three1\"},{\"menuKey\":\"RoleTwoTwo\",\"menuName\":\"三级菜单子哈\",\"parentKey\":\"LevelTwo\",\"sort\":17,\"type\":1,\"url\":\"/three-router/level-two/level-three2\"},{\"menuKey\":\"RoleOneOne\",\"menuName\":\"二级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":18,\"type\":1,\"url\":\"/three-router/level-two2\"},{\"menuKey\":\"System\",\"menuName\":\"系统设置\",\"sort\":19,\"type\":1,\"url\":\"/system\"},{\"menuKey\":\"Employee\",\"menuName\":\"人员管理\",\"parentKey\":\"System\",\"sort\":20,\"type\":1,\"url\":\"/employee\"},{\"menuKey\":\"RoleManage\",\"menuName\":\"角色管理\",\"parentKey\":\"Employee\",\"sort\":21,\"type\":1,\"url\":\"/employee/role\"},{\"menuKey\":\"PositionList\",\"menuName\":\"岗位管理\",\"parentKey\":\"Employee\",\"sort\":22,\"type\":1,\"url\":\"/employee/position\"},{\"menuKey\":\"RoleEmployeeManage\",\"menuName\":\"员工管理\",\"parentKey\":\"Employee\",\"sort\":23,\"type\":1,\"url\":\"/employee/role-employee-manage\"},{\"menuKey\":\"File\",\"menuName\":\"文件服务\",\"parentKey\":\"System\",\"sort\":24,\"type\":1,\"url\":\"/file\"},{\"menuKey\":\"FileList\",\"menuName\":\"文件列表\",\"parentKey\":\"File\",\"sort\":25,\"type\":1,\"url\":\"/file/file-list\"},{\"menuKey\":\"UserLog\",\"menuName\":\"用户日志\",\"parentKey\":\"System\",\"sort\":26,\"type\":1,\"url\":\"/user-log\"},{\"menuKey\":\"UserOperateLog\",\"menuName\":\"用户操作日志\",\"parentKey\":\"UserLog\",\"sort\":27,\"type\":1,\"url\":\"/user-log/user-operate-log\"},{\"menuKey\":\"UserLoginLog\",\"menuName\":\"用户登录日志\",\"parentKey\":\"UserLog\",\"sort\":28,\"type\":1,\"url\":\"/user-log/user-login-log\"},{\"menuKey\":\"SystemSetting\",\"menuName\":\"系统设置\",\"parentKey\":\"System\",\"sort\":29,\"type\":1,\"url\":\"/system-setting\"},{\"menuKey\":\"SystemConfig\",\"menuName\":\"系统参数\",\"parentKey\":\"SystemSetting\",\"sort\":30,\"type\":1,\"url\":\"/system-setting/system-config\"},{\"menuKey\":\"SystemPrivilege\",\"menuName\":\"菜单设置\",\"parentKey\":\"SystemSetting\",\"sort\":31,\"type\":1,\"url\":\"/system-setting/system-privilege\"},{\"menuKey\":\"Support\",\"menuName\":\"开发专用\",\"sort\":32,\"type\":1,\"url\":\"/support\"},{\"menuKey\":\"ApiDoc\",\"menuName\":\"接口文档\",\"parentKey\":\"Support\",\"sort\":33,\"type\":1,\"url\":\"/api-doc\"},{\"menuKey\":\"Swagger\",\"menuName\":\"Swagger接口文档\",\"parentKey\":\"ApiDoc\",\"sort\":34,\"type\":1,\"url\":\"/api-doc/swagger\"},{\"menuKey\":\"HeartBeat\",\"menuName\":\"心跳服务\",\"parentKey\":\"Support\",\"sort\":35,\"type\":1,\"url\":\"/heart-beat\"},{\"menuKey\":\"HeartBeatList\",\"menuName\":\"心跳服务\",\"parentKey\":\"HeartBeat\",\"sort\":36,\"type\":1,\"url\":\"/heart-beat/heart-beat-list\"},{\"menuKey\":\"Monitor\",\"menuName\":\"系统监控\",\"parentKey\":\"Support\",\"sort\":37,\"type\":1,\"url\":\"/monitor\"},{\"menuKey\":\"OnlineUser\",\"menuName\":\"在线人数\",\"parentKey\":\"Monitor\",\"sort\":38,\"type\":1,\"url\":\"/monitor/online-user\"},{\"menuKey\":\"Sql\",\"menuName\":\"SQL监控\",\"parentKey\":\"Monitor\",\"sort\":39,\"type\":1,\"url\":\"/monitor/sql\"},{\"menuKey\":\"Reload\",\"menuName\":\"动态加载\",\"parentKey\":\"Support\",\"sort\":40,\"type\":1,\"url\":\"/reload\"},{\"menuKey\":\"SmartReloadList\",\"menuName\":\"SmartReload\",\"parentKey\":\"Reload\",\"sort\":41,\"type\":1,\"url\":\"/reload/smart-reload-list\"},{\"menuKey\":\"Task\",\"menuName\":\"定时任务\",\"parentKey\":\"Support\",\"sort\":42,\"type\":1,\"url\":\"/task\"},{\"menuKey\":\"TaskList\",\"menuName\":\"任务管理\",\"parentKey\":\"Task\",\"sort\":43,\"type\":1,\"url\":\"/system-setting/task-list\"}]]', 1, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_user_operate_log` VALUES (41, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_user_operate_log` VALUES (42, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList\"]', 1, NULL, '2020-12-14 15:16:28', '2020-12-14 15:16:28');
INSERT INTO `t_user_operate_log` VALUES (43, 1, '管理员', '通用-权限', '批量保存功能点', '/smart-admin-api/privilege/function/batchSave', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.batchSaveFunctionList', 'ValidateList[[{\"functionKey\":\"peony-list-query\",\"functionName\":\"查询\",\"menuKey\":\"PeonyList\",\"sort\":1},{\"functionKey\":\"peony-list-add\",\"functionName\":\"新增\",\"menuKey\":\"PeonyList\",\"sort\":2},{\"functionKey\":\"peony-list-update\",\"functionName\":\"编辑\",\"menuKey\":\"PeonyList\",\"sort\":3},{\"functionKey\":\"peony-list-batch-delete\",\"functionName\":\"批量删除\",\"menuKey\":\"PeonyList\",\"sort\":4},{\"functionKey\":\"peony-list-batch-export\",\"functionName\":\"批量导出\",\"menuKey\":\"PeonyList\",\"sort\":5},{\"functionKey\":\"peony-list-export-all\",\"functionName\":\"导出全部\",\"menuKey\":\"PeonyList\",\"sort\":6}]]', 1, NULL, '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_user_operate_log` VALUES (44, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList\"]', 1, NULL, '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_user_operate_log` VALUES (45, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList1', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList1\"]', 1, NULL, '2020-12-14 15:16:32', '2020-12-14 15:16:32');
INSERT INTO `t_user_operate_log` VALUES (46, 1, '管理员', '通用-权限', '批量保存功能点', '/smart-admin-api/privilege/function/batchSave', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.batchSaveFunctionList', 'ValidateList[[{\"functionKey\":\"peony1-list-query\",\"functionName\":\"查询\",\"menuKey\":\"PeonyList1\",\"sort\":1},{\"functionKey\":\"peony1-list-add\",\"functionName\":\"新增\",\"menuKey\":\"PeonyList1\",\"sort\":2},{\"functionKey\":\"peony1-list-update\",\"functionName\":\"编辑\",\"menuKey\":\"PeonyList1\",\"sort\":3},{\"functionKey\":\"peony1-list-batch-delete\",\"functionName\":\"批量删除\",\"menuKey\":\"PeonyList1\",\"sort\":4},{\"functionKey\":\"peony1-list-batch-export\",\"functionName\":\"批量导出\",\"menuKey\":\"PeonyList1\",\"sort\":5},{\"functionKey\":\"peony1-list-export-all\",\"functionName\":\"导出全部\",\"menuKey\":\"PeonyList1\",\"sort\":6}]]', 1, NULL, '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_user_operate_log` VALUES (47, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList1', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList1\"]', 1, NULL, '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_user_operate_log` VALUES (48, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/EmailList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"EmailList\"]', 1, NULL, '2020-12-14 15:16:34', '2020-12-14 15:16:34');
INSERT INTO `t_user_operate_log` VALUES (49, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SendMail', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SendMail\"]', 1, NULL, '2020-12-14 15:16:36', '2020-12-14 15:16:36');
INSERT INTO `t_user_operate_log` VALUES (50, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/KeepAliveContentList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"KeepAliveContentList\"]', 1, NULL, '2020-12-14 15:16:38', '2020-12-14 15:16:38');
INSERT INTO `t_user_operate_log` VALUES (51, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/KeepAliveAddContent', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"KeepAliveAddContent\"]', 1, NULL, '2020-12-14 15:16:38', '2020-12-14 15:16:38');
INSERT INTO `t_user_operate_log` VALUES (52, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/NoticeList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"NoticeList\"]', 1, NULL, '2020-12-14 15:16:40', '2020-12-14 15:16:40');
INSERT INTO `t_user_operate_log` VALUES (53, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PersonNotice', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PersonNotice\"]', 1, NULL, '2020-12-14 15:16:41', '2020-12-14 15:16:41');
INSERT INTO `t_user_operate_log` VALUES (54, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/NoticeDetail', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"NoticeDetail\"]', 1, NULL, '2020-12-14 15:16:42', '2020-12-14 15:16:42');
INSERT INTO `t_user_operate_log` VALUES (55, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/ThreeLevelRouterView', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"ThreeLevelRouterView\"]', 1, NULL, '2020-12-14 15:16:44', '2020-12-14 15:16:44');
INSERT INTO `t_user_operate_log` VALUES (56, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/RoleManage', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"RoleManage\"]', 1, NULL, '2020-12-14 15:16:47', '2020-12-14 15:16:47');
INSERT INTO `t_user_operate_log` VALUES (57, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PositionList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PositionList\"]', 1, NULL, '2020-12-14 15:16:48', '2020-12-14 15:16:48');
INSERT INTO `t_user_operate_log` VALUES (58, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/RoleEmployeeManage', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"RoleEmployeeManage\"]', 1, NULL, '2020-12-14 15:16:53', '2020-12-14 15:16:53');
INSERT INTO `t_user_operate_log` VALUES (59, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/FileList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"FileList\"]', 1, NULL, '2020-12-14 15:17:00', '2020-12-14 15:17:00');
INSERT INTO `t_user_operate_log` VALUES (60, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/UserOperateLog', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"UserOperateLog\"]', 1, NULL, '2020-12-14 15:17:03', '2020-12-14 15:17:03');
INSERT INTO `t_user_operate_log` VALUES (61, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/UserLoginLog', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"UserLoginLog\"]', 1, NULL, '2020-12-14 15:17:03', '2020-12-14 15:17:03');
INSERT INTO `t_user_operate_log` VALUES (62, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemConfig', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemConfig\"]', 1, NULL, '2020-12-14 15:17:04', '2020-12-14 15:17:04');
INSERT INTO `t_user_operate_log` VALUES (63, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemPrivilege', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemPrivilege\"]', 1, NULL, '2020-12-14 15:17:06', '2020-12-14 15:17:06');
INSERT INTO `t_user_operate_log` VALUES (64, 1, '管理员', '通用-权限', '批量保存功能点', '/smart-admin-api/privilege/function/batchSave', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.batchSaveFunctionList', 'ValidateList[[{\"functionKey\":\"privilege-main-update\",\"functionName\":\"编辑\",\"menuKey\":\"SystemPrivilege\",\"sort\":1},{\"functionKey\":\"privilege-batch-save-points\",\"functionName\":\"批量保存功能点\",\"menuKey\":\"SystemPrivilege\",\"sort\":2},{\"functionKey\":\"privilege-main-search\",\"functionName\":\"查询\",\"menuKey\":\"SystemPrivilege\",\"sort\":3}]]', 1, NULL, '2020-12-14 15:17:11', '2020-12-14 15:17:11');
INSERT INTO `t_user_operate_log` VALUES (65, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemPrivilege', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemPrivilege\"]', 1, NULL, '2020-12-14 15:17:11', '2020-12-14 15:17:11');
INSERT INTO `t_user_operate_log` VALUES (66, 1, '管理员', '通用-权限', '保存更新功能点', '/smart-admin-api/privilege/function/saveOrUpdate', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionSaveOrUpdate', 'PrivilegeFunctionDTO[{\"functionKey\":\"privilege-batch-save-points\",\"functionName\":\"批量保存功能点\",\"menuKey\":\"SystemPrivilege\",\"sort\":1,\"url\":\"privilegeController.functionSaveOrUpdate\"}]', 1, NULL, '2020-12-14 15:17:30', '2020-12-14 15:17:30');
INSERT INTO `t_user_operate_log` VALUES (67, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemPrivilege', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemPrivilege\"]', 1, NULL, '2020-12-14 15:17:30', '2020-12-14 15:17:30');
INSERT INTO `t_user_operate_log` VALUES (68, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/Swagger', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"Swagger\"]', 1, NULL, '2020-12-14 15:17:36', '2020-12-14 15:17:36');
INSERT INTO `t_user_operate_log` VALUES (69, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/HeartBeatList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"HeartBeatList\"]', 1, NULL, '2020-12-14 15:17:37', '2020-12-14 15:17:37');
INSERT INTO `t_user_operate_log` VALUES (70, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SmartReloadList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SmartReloadList\"]', 1, NULL, '2020-12-14 15:17:42', '2020-12-14 15:17:42');
INSERT INTO `t_user_operate_log` VALUES (71, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/TaskList', 'net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"TaskList\"]', 1, NULL, '2020-12-14 15:17:43', '2020-12-14 15:17:43');
INSERT INTO `t_user_operate_log` VALUES (72, 1, '管理员', '通用-邮件发送', '分页查询', '/smart-admin-api/email/page/query', 'net.lab1024.smartadmin.module.business.email.EmailController.queryByPage', 'EmailQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\"}]', 1, NULL, '2020-12-14 15:17:57', '2020-12-14 15:17:57');
INSERT INTO `t_user_operate_log` VALUES (73, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2020-12-14 15:18:14', '2020-12-14 15:18:14');
INSERT INTO `t_user_operate_log` VALUES (74, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2020-12-14 15:18:27', '2020-12-14 15:18:27');
INSERT INTO `t_user_operate_log` VALUES (75, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:44:24', '2022-09-03 16:44:24');
INSERT INTO `t_user_operate_log` VALUES (76, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:46:06', '2022-09-03 16:46:06');
INSERT INTO `t_user_operate_log` VALUES (77, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:46:32', '2022-09-03 16:46:32');
INSERT INTO `t_user_operate_log` VALUES (78, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:51:02', '2022-09-03 16:51:02');
INSERT INTO `t_user_operate_log` VALUES (79, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:52:14', '2022-09-03 16:52:14');
INSERT INTO `t_user_operate_log` VALUES (80, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:54:11', '2022-09-03 16:54:11');
INSERT INTO `t_user_operate_log` VALUES (81, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:55:44', '2022-09-03 16:55:44');
INSERT INTO `t_user_operate_log` VALUES (82, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:56:28', '2022-09-03 16:56:28');
INSERT INTO `t_user_operate_log` VALUES (83, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 16:59:54', '2022-09-03 16:59:54');
INSERT INTO `t_user_operate_log` VALUES (84, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:02:40', '2022-09-03 17:02:40');
INSERT INTO `t_user_operate_log` VALUES (85, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:03:04', '2022-09-03 17:03:04');
INSERT INTO `t_user_operate_log` VALUES (86, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:07:01', '2022-09-03 17:07:01');
INSERT INTO `t_user_operate_log` VALUES (87, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:07:23', '2022-09-03 17:07:23');
INSERT INTO `t_user_operate_log` VALUES (88, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:14:07', '2022-09-03 17:14:07');
INSERT INTO `t_user_operate_log` VALUES (89, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:18:05', '2022-09-03 17:18:05');
INSERT INTO `t_user_operate_log` VALUES (90, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:22:49', '2022-09-03 17:22:49');
INSERT INTO `t_user_operate_log` VALUES (91, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:25:01', '2022-09-03 17:25:01');
INSERT INTO `t_user_operate_log` VALUES (92, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:31:53', '2022-09-03 17:31:53');
INSERT INTO `t_user_operate_log` VALUES (93, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:38:54', '2022-09-03 17:38:54');
INSERT INTO `t_user_operate_log` VALUES (94, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:39:05', '2022-09-03 17:39:05');
INSERT INTO `t_user_operate_log` VALUES (95, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:39:24', '2022-09-03 17:39:24');
INSERT INTO `t_user_operate_log` VALUES (96, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:39:47', '2022-09-03 17:39:47');
INSERT INTO `t_user_operate_log` VALUES (97, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:40:42', '2022-09-03 17:40:42');
INSERT INTO `t_user_operate_log` VALUES (98, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:43:00', '2022-09-03 17:43:00');
INSERT INTO `t_user_operate_log` VALUES (99, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:45:05', '2022-09-03 17:45:05');
INSERT INTO `t_user_operate_log` VALUES (100, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:45:52', '2022-09-03 17:45:52');
INSERT INTO `t_user_operate_log` VALUES (101, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:46:49', '2022-09-03 17:46:49');
INSERT INTO `t_user_operate_log` VALUES (102, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:47:49', '2022-09-03 17:47:49');
INSERT INTO `t_user_operate_log` VALUES (103, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:48:25', '2022-09-03 17:48:25');
INSERT INTO `t_user_operate_log` VALUES (104, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:51:35', '2022-09-03 17:51:35');
INSERT INTO `t_user_operate_log` VALUES (105, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:52:51', '2022-09-03 17:52:51');
INSERT INTO `t_user_operate_log` VALUES (106, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:54:52', '2022-09-03 17:54:52');
INSERT INTO `t_user_operate_log` VALUES (107, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 17:59:51', '2022-09-03 17:59:51');
INSERT INTO `t_user_operate_log` VALUES (108, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:00:11', '2022-09-03 18:00:11');
INSERT INTO `t_user_operate_log` VALUES (109, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:04:07', '2022-09-03 18:04:07');
INSERT INTO `t_user_operate_log` VALUES (110, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:05:16', '2022-09-03 18:05:16');
INSERT INTO `t_user_operate_log` VALUES (111, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:05:19', '2022-09-03 18:05:19');
INSERT INTO `t_user_operate_log` VALUES (112, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:12:12', '2022-09-03 18:12:12');
INSERT INTO `t_user_operate_log` VALUES (113, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:14:03', '2022-09-03 18:14:03');
INSERT INTO `t_user_operate_log` VALUES (114, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:14:10', '2022-09-03 18:14:10');
INSERT INTO `t_user_operate_log` VALUES (115, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:16:20', '2022-09-03 18:16:20');
INSERT INTO `t_user_operate_log` VALUES (116, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:17:25', '2022-09-03 18:17:25');
INSERT INTO `t_user_operate_log` VALUES (117, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:19:41', '2022-09-03 18:19:41');
INSERT INTO `t_user_operate_log` VALUES (118, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:20:10', '2022-09-03 18:20:10');
INSERT INTO `t_user_operate_log` VALUES (119, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:23:13', '2022-09-03 18:23:13');
INSERT INTO `t_user_operate_log` VALUES (120, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:23:24', '2022-09-03 18:23:24');
INSERT INTO `t_user_operate_log` VALUES (121, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:30:31', '2022-09-03 18:30:31');
INSERT INTO `t_user_operate_log` VALUES (122, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:44:31', '2022-09-03 18:44:31');
INSERT INTO `t_user_operate_log` VALUES (123, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:45:47', '2022-09-03 18:45:47');
INSERT INTO `t_user_operate_log` VALUES (124, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:46:14', '2022-09-03 18:46:14');
INSERT INTO `t_user_operate_log` VALUES (125, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:54:58', '2022-09-03 18:54:58');
INSERT INTO `t_user_operate_log` VALUES (126, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 18:56:00', '2022-09-03 18:56:00');
INSERT INTO `t_user_operate_log` VALUES (127, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 19:30:05', '2022-09-03 19:30:05');
INSERT INTO `t_user_operate_log` VALUES (128, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 19:30:32', '2022-09-03 19:30:32');
INSERT INTO `t_user_operate_log` VALUES (129, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 19:31:27', '2022-09-03 19:31:27');
INSERT INTO `t_user_operate_log` VALUES (130, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 19:44:53', '2022-09-03 19:44:53');
INSERT INTO `t_user_operate_log` VALUES (131, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 19:45:01', '2022-09-03 19:45:01');
INSERT INTO `t_user_operate_log` VALUES (132, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 19:53:35', '2022-09-03 19:53:35');
INSERT INTO `t_user_operate_log` VALUES (133, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:15:18', '2022-09-03 20:15:18');
INSERT INTO `t_user_operate_log` VALUES (134, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:30:59', '2022-09-03 20:30:59');
INSERT INTO `t_user_operate_log` VALUES (135, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:31:04', '2022-09-03 20:31:04');
INSERT INTO `t_user_operate_log` VALUES (136, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:40:05', '2022-09-03 20:40:05');
INSERT INTO `t_user_operate_log` VALUES (137, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:43:29', '2022-09-03 20:43:29');
INSERT INTO `t_user_operate_log` VALUES (138, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:48:20', '2022-09-03 20:48:20');
INSERT INTO `t_user_operate_log` VALUES (139, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:51:07', '2022-09-03 20:51:07');
INSERT INTO `t_user_operate_log` VALUES (140, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 20:59:46', '2022-09-03 20:59:46');
INSERT INTO `t_user_operate_log` VALUES (141, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:15:19', '2022-09-03 21:15:19');
INSERT INTO `t_user_operate_log` VALUES (142, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:16:42', '2022-09-03 21:16:42');
INSERT INTO `t_user_operate_log` VALUES (143, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:17:00', '2022-09-03 21:17:00');
INSERT INTO `t_user_operate_log` VALUES (144, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:19:48', '2022-09-03 21:19:48');
INSERT INTO `t_user_operate_log` VALUES (145, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:40:42', '2022-09-03 21:40:42');
INSERT INTO `t_user_operate_log` VALUES (146, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:43:40', '2022-09-03 21:43:40');
INSERT INTO `t_user_operate_log` VALUES (147, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:48:02', '2022-09-03 21:48:02');
INSERT INTO `t_user_operate_log` VALUES (148, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 21:54:56', '2022-09-03 21:54:56');
INSERT INTO `t_user_operate_log` VALUES (149, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:00:17', '2022-09-03 22:00:17');
INSERT INTO `t_user_operate_log` VALUES (150, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:09:29', '2022-09-03 22:09:29');
INSERT INTO `t_user_operate_log` VALUES (151, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:09:31', '2022-09-03 22:09:31');
INSERT INTO `t_user_operate_log` VALUES (152, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:18:49', '2022-09-03 22:18:49');
INSERT INTO `t_user_operate_log` VALUES (153, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:21:19', '2022-09-03 22:21:19');
INSERT INTO `t_user_operate_log` VALUES (154, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:21:56', '2022-09-03 22:21:56');
INSERT INTO `t_user_operate_log` VALUES (155, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:22:02', '2022-09-03 22:22:02');
INSERT INTO `t_user_operate_log` VALUES (156, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:22:32', '2022-09-03 22:22:32');
INSERT INTO `t_user_operate_log` VALUES (157, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:22:45', '2022-09-03 22:22:45');
INSERT INTO `t_user_operate_log` VALUES (158, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:23:09', '2022-09-03 22:23:09');
INSERT INTO `t_user_operate_log` VALUES (159, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:23:51', '2022-09-03 22:23:51');
INSERT INTO `t_user_operate_log` VALUES (160, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:24:55', '2022-09-03 22:24:55');
INSERT INTO `t_user_operate_log` VALUES (161, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:26:08', '2022-09-03 22:26:08');
INSERT INTO `t_user_operate_log` VALUES (162, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:26:40', '2022-09-03 22:26:40');
INSERT INTO `t_user_operate_log` VALUES (163, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:27:07', '2022-09-03 22:27:07');
INSERT INTO `t_user_operate_log` VALUES (164, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:27:46', '2022-09-03 22:27:46');
INSERT INTO `t_user_operate_log` VALUES (165, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:32:55', '2022-09-03 22:32:55');
INSERT INTO `t_user_operate_log` VALUES (166, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:33:54', '2022-09-03 22:33:54');
INSERT INTO `t_user_operate_log` VALUES (167, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:34:12', '2022-09-03 22:34:12');
INSERT INTO `t_user_operate_log` VALUES (168, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:34:28', '2022-09-03 22:34:28');
INSERT INTO `t_user_operate_log` VALUES (169, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:34:40', '2022-09-03 22:34:40');
INSERT INTO `t_user_operate_log` VALUES (170, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:38:13', '2022-09-03 22:38:13');
INSERT INTO `t_user_operate_log` VALUES (171, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:43:23', '2022-09-03 22:43:23');
INSERT INTO `t_user_operate_log` VALUES (172, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:43:46', '2022-09-03 22:43:46');
INSERT INTO `t_user_operate_log` VALUES (173, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:43:54', '2022-09-03 22:43:54');
INSERT INTO `t_user_operate_log` VALUES (174, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:44:32', '2022-09-03 22:44:32');
INSERT INTO `t_user_operate_log` VALUES (175, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:48:35', '2022-09-03 22:48:35');
INSERT INTO `t_user_operate_log` VALUES (176, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:48:42', '2022-09-03 22:48:42');
INSERT INTO `t_user_operate_log` VALUES (177, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:49:11', '2022-09-03 22:49:11');
INSERT INTO `t_user_operate_log` VALUES (178, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:49:20', '2022-09-03 22:49:20');
INSERT INTO `t_user_operate_log` VALUES (179, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:55:32', '2022-09-03 22:55:32');
INSERT INTO `t_user_operate_log` VALUES (180, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:55:37', '2022-09-03 22:55:37');
INSERT INTO `t_user_operate_log` VALUES (181, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-03 22:58:18', '2022-09-03 22:58:18');
INSERT INTO `t_user_operate_log` VALUES (182, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 22:59:45', '2022-09-03 22:59:45');
INSERT INTO `t_user_operate_log` VALUES (183, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-03 22:59:45', '2022-09-03 22:59:45');
INSERT INTO `t_user_operate_log` VALUES (184, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:01:29', '2022-09-03 23:01:29');
INSERT INTO `t_user_operate_log` VALUES (185, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-03 23:01:29', '2022-09-03 23:01:29');
INSERT INTO `t_user_operate_log` VALUES (186, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:03:13', '2022-09-03 23:03:13');
INSERT INTO `t_user_operate_log` VALUES (187, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-03 23:03:14', '2022-09-03 23:03:14');
INSERT INTO `t_user_operate_log` VALUES (188, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'net.lab1024.smartadmin.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"Notice\",\"NoticeList\",\"PersonNotice\",\"Email\",\"EmailList\",\"SendMail\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"ThreeRouter\",\"LevelTwo\",\"RoleTwoTwo\",\"RoleOneOne\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"email-send\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\",\"StationList\",\"Peony\",\"Business\",\"OrderList\",\"CarNumberMatchTrackList\",\"CarNumberReviseList\",\"GrowthAnalyseList\",\"StationList5\",\"PeonyList\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"PeonyList1\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\"],\"roleId\":1}]', 1, NULL, '2022-09-03 23:03:29', '2022-09-03 23:03:29');
INSERT INTO `t_user_operate_log` VALUES (189, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:03:33', '2022-09-03 23:03:33');
INSERT INTO `t_user_operate_log` VALUES (190, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-03 23:03:33', '2022-09-03 23:03:33');
INSERT INTO `t_user_operate_log` VALUES (191, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:03:45', '2022-09-03 23:03:45');
INSERT INTO `t_user_operate_log` VALUES (192, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:03:53', '2022-09-03 23:03:53');
INSERT INTO `t_user_operate_log` VALUES (193, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:06:51', '2022-09-03 23:06:51');
INSERT INTO `t_user_operate_log` VALUES (194, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:11:16', '2022-09-03 23:11:16');
INSERT INTO `t_user_operate_log` VALUES (195, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:11:31', '2022-09-03 23:11:31');
INSERT INTO `t_user_operate_log` VALUES (196, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-03 23:11:39', '2022-09-03 23:11:39');
INSERT INTO `t_user_operate_log` VALUES (197, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'net.lab1024.smartadmin.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"Notice\",\"NoticeList\",\"PersonNotice\",\"Email\",\"EmailList\",\"SendMail\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"ThreeRouter\",\"LevelTwo\",\"RoleTwoTwo\",\"RoleOneOne\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"email-send\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\",\"Business\",\"Peony\",\"PeonyList\",\"PeonyList1\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"StationList\",\"OrderList\",\"CarNumberMatchTrackList\",\"CarNumberReviseList\",\"GrowthAnalyseList\",\"CarNumberInOutList\"],\"roleId\":1}]', 1, NULL, '2022-09-03 23:11:46', '2022-09-03 23:11:46');
INSERT INTO `t_user_operate_log` VALUES (198, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:11:56', '2022-09-03 23:11:56');
INSERT INTO `t_user_operate_log` VALUES (199, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:12:15', '2022-09-03 23:12:15');
INSERT INTO `t_user_operate_log` VALUES (200, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:12:43', '2022-09-03 23:12:43');
INSERT INTO `t_user_operate_log` VALUES (201, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:20:40', '2022-09-03 23:20:40');
INSERT INTO `t_user_operate_log` VALUES (202, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:20:53', '2022-09-03 23:20:53');
INSERT INTO `t_user_operate_log` VALUES (203, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:24:15', '2022-09-03 23:24:15');
INSERT INTO `t_user_operate_log` VALUES (204, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:26:35', '2022-09-03 23:26:35');
INSERT INTO `t_user_operate_log` VALUES (205, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:27:52', '2022-09-03 23:27:52');
INSERT INTO `t_user_operate_log` VALUES (206, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-03 23:28:45', '2022-09-03 23:28:45');
INSERT INTO `t_user_operate_log` VALUES (207, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 12:23:44', '2022-09-04 12:23:44');
INSERT INTO `t_user_operate_log` VALUES (208, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 12:29:19', '2022-09-04 12:29:19');
INSERT INTO `t_user_operate_log` VALUES (209, 1, '管理员', '通用-邮件发送', '分页查询', '/smart-admin-api/email/page/query', 'net.lab1024.smartadmin.module.business.email.EmailController.queryByPage', 'EmailQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\"}]', 1, NULL, '2022-09-04 12:29:25', '2022-09-04 12:29:25');
INSERT INTO `t_user_operate_log` VALUES (210, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 12:36:07', '2022-09-04 12:36:07');
INSERT INTO `t_user_operate_log` VALUES (211, 1, '管理员', '通用-邮件发送', '分页查询', '/smart-admin-api/email/page/query', 'net.lab1024.smartadmin.module.business.email.EmailController.queryByPage', 'EmailQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\"}]', 1, NULL, '2022-09-04 12:36:17', '2022-09-04 12:36:17');
INSERT INTO `t_user_operate_log` VALUES (212, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'net.lab1024.smartadmin.module.system.login.LoginController.logOut', '', 1, NULL, '2022-09-04 13:03:34', '2022-09-04 13:03:34');
INSERT INTO `t_user_operate_log` VALUES (213, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 14:40:55', '2022-09-04 14:40:55');
INSERT INTO `t_user_operate_log` VALUES (214, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 14:51:31', '2022-09-04 14:51:31');
INSERT INTO `t_user_operate_log` VALUES (215, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 14:53:52', '2022-09-04 14:53:52');
INSERT INTO `t_user_operate_log` VALUES (216, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 14:58:03', '2022-09-04 14:58:03');
INSERT INTO `t_user_operate_log` VALUES (217, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:01:00', '2022-09-04 15:01:00');
INSERT INTO `t_user_operate_log` VALUES (218, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:05:21', '2022-09-04 15:05:21');
INSERT INTO `t_user_operate_log` VALUES (219, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:05:28', '2022-09-04 15:05:28');
INSERT INTO `t_user_operate_log` VALUES (220, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:08:31', '2022-09-04 15:08:31');
INSERT INTO `t_user_operate_log` VALUES (221, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:09:36', '2022-09-04 15:09:36');
INSERT INTO `t_user_operate_log` VALUES (222, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:10:02', '2022-09-04 15:10:02');
INSERT INTO `t_user_operate_log` VALUES (223, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:11:08', '2022-09-04 15:11:08');
INSERT INTO `t_user_operate_log` VALUES (224, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:13:51', '2022-09-04 15:13:51');
INSERT INTO `t_user_operate_log` VALUES (225, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:14:03', '2022-09-04 15:14:03');
INSERT INTO `t_user_operate_log` VALUES (226, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:17:16', '2022-09-04 15:17:16');
INSERT INTO `t_user_operate_log` VALUES (227, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:24:19', '2022-09-04 15:24:19');
INSERT INTO `t_user_operate_log` VALUES (228, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:39:27', '2022-09-04 15:39:27');
INSERT INTO `t_user_operate_log` VALUES (229, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 15:56:13', '2022-09-04 15:56:13');
INSERT INTO `t_user_operate_log` VALUES (230, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 16:02:50', '2022-09-04 16:02:50');
INSERT INTO `t_user_operate_log` VALUES (231, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 19:48:34', '2022-09-04 19:48:34');
INSERT INTO `t_user_operate_log` VALUES (232, 1, '管理员', '通用-邮件发送', '分页查询', '/smart-admin-api/email/page/query', 'net.lab1024.smartadmin.module.business.email.EmailController.queryByPage', 'EmailQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\"}]', 1, NULL, '2022-09-04 19:48:49', '2022-09-04 19:48:49');
INSERT INTO `t_user_operate_log` VALUES (233, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 19:58:36', '2022-09-04 19:58:36');
INSERT INTO `t_user_operate_log` VALUES (234, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 19:58:56', '2022-09-04 19:58:56');
INSERT INTO `t_user_operate_log` VALUES (235, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 20:02:07', '2022-09-04 20:02:07');
INSERT INTO `t_user_operate_log` VALUES (236, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 20:10:03', '2022-09-04 20:10:03');
INSERT INTO `t_user_operate_log` VALUES (237, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 20:23:09', '2022-09-04 20:23:09');
INSERT INTO `t_user_operate_log` VALUES (238, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 20:23:49', '2022-09-04 20:23:49');
INSERT INTO `t_user_operate_log` VALUES (239, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 20:24:29', '2022-09-04 20:24:29');
INSERT INTO `t_user_operate_log` VALUES (240, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 20:27:29', '2022-09-04 20:27:29');
INSERT INTO `t_user_operate_log` VALUES (241, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 20:32:58', '2022-09-04 20:32:58');
INSERT INTO `t_user_operate_log` VALUES (242, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:20:45', '2022-09-04 21:20:45');
INSERT INTO `t_user_operate_log` VALUES (243, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:21:23', '2022-09-04 21:21:23');
INSERT INTO `t_user_operate_log` VALUES (244, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:22:43', '2022-09-04 21:22:43');
INSERT INTO `t_user_operate_log` VALUES (245, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:23:32', '2022-09-04 21:23:32');
INSERT INTO `t_user_operate_log` VALUES (246, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:24:38', '2022-09-04 21:24:38');
INSERT INTO `t_user_operate_log` VALUES (247, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:28:44', '2022-09-04 21:28:44');
INSERT INTO `t_user_operate_log` VALUES (248, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:29:16', '2022-09-04 21:29:16');
INSERT INTO `t_user_operate_log` VALUES (249, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:29:25', '2022-09-04 21:29:25');
INSERT INTO `t_user_operate_log` VALUES (250, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:30:42', '2022-09-04 21:30:42');
INSERT INTO `t_user_operate_log` VALUES (251, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:33:36', '2022-09-04 21:33:36');
INSERT INTO `t_user_operate_log` VALUES (252, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:37:28', '2022-09-04 21:37:28');
INSERT INTO `t_user_operate_log` VALUES (253, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:44:05', '2022-09-04 21:44:05');
INSERT INTO `t_user_operate_log` VALUES (254, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:52:55', '2022-09-04 21:52:55');
INSERT INTO `t_user_operate_log` VALUES (255, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:53:05', '2022-09-04 21:53:05');
INSERT INTO `t_user_operate_log` VALUES (256, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:55:26', '2022-09-04 21:55:26');
INSERT INTO `t_user_operate_log` VALUES (257, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-04 21:56:34', '2022-09-04 21:56:34');
INSERT INTO `t_user_operate_log` VALUES (258, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 21:53:16', '2022-09-05 21:53:16');
INSERT INTO `t_user_operate_log` VALUES (259, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 21:54:33', '2022-09-05 21:54:33');
INSERT INTO `t_user_operate_log` VALUES (260, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 21:55:38', '2022-09-05 21:55:38');
INSERT INTO `t_user_operate_log` VALUES (261, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 21:57:58', '2022-09-05 21:57:58');
INSERT INTO `t_user_operate_log` VALUES (262, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 21:58:59', '2022-09-05 21:58:59');
INSERT INTO `t_user_operate_log` VALUES (263, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:05:22', '2022-09-05 22:05:22');
INSERT INTO `t_user_operate_log` VALUES (264, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:05:30', '2022-09-05 22:05:30');
INSERT INTO `t_user_operate_log` VALUES (265, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:17:53', '2022-09-05 22:17:53');
INSERT INTO `t_user_operate_log` VALUES (266, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:25:22', '2022-09-05 22:25:22');
INSERT INTO `t_user_operate_log` VALUES (267, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:25:42', '2022-09-05 22:25:42');
INSERT INTO `t_user_operate_log` VALUES (268, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:26:08', '2022-09-05 22:26:08');
INSERT INTO `t_user_operate_log` VALUES (269, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:26:16', '2022-09-05 22:26:16');
INSERT INTO `t_user_operate_log` VALUES (270, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:30:45', '2022-09-05 22:30:45');
INSERT INTO `t_user_operate_log` VALUES (271, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:31:27', '2022-09-05 22:31:27');
INSERT INTO `t_user_operate_log` VALUES (272, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:34:21', '2022-09-05 22:34:21');
INSERT INTO `t_user_operate_log` VALUES (273, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:34:48', '2022-09-05 22:34:48');
INSERT INTO `t_user_operate_log` VALUES (274, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:41:04', '2022-09-05 22:41:04');
INSERT INTO `t_user_operate_log` VALUES (275, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:45:44', '2022-09-05 22:45:44');
INSERT INTO `t_user_operate_log` VALUES (276, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 22:53:32', '2022-09-05 22:53:32');
INSERT INTO `t_user_operate_log` VALUES (277, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-05 23:56:16', '2022-09-05 23:56:16');
INSERT INTO `t_user_operate_log` VALUES (278, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:03:41', '2022-09-06 00:03:41');
INSERT INTO `t_user_operate_log` VALUES (279, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:05:09', '2022-09-06 00:05:09');
INSERT INTO `t_user_operate_log` VALUES (280, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:05:44', '2022-09-06 00:05:44');
INSERT INTO `t_user_operate_log` VALUES (281, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:06:07', '2022-09-06 00:06:07');
INSERT INTO `t_user_operate_log` VALUES (282, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:07:38', '2022-09-06 00:07:38');
INSERT INTO `t_user_operate_log` VALUES (283, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:09:15', '2022-09-06 00:09:15');
INSERT INTO `t_user_operate_log` VALUES (284, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:32:50', '2022-09-06 00:32:50');
INSERT INTO `t_user_operate_log` VALUES (285, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:39:33', '2022-09-06 00:39:33');
INSERT INTO `t_user_operate_log` VALUES (286, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:40:07', '2022-09-06 00:40:07');
INSERT INTO `t_user_operate_log` VALUES (287, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 00:51:19', '2022-09-06 00:51:19');
INSERT INTO `t_user_operate_log` VALUES (288, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 01:21:53', '2022-09-06 01:21:53');
INSERT INTO `t_user_operate_log` VALUES (289, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:43:19', '2022-09-06 21:43:19');
INSERT INTO `t_user_operate_log` VALUES (290, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:43:38', '2022-09-06 21:43:38');
INSERT INTO `t_user_operate_log` VALUES (291, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:44:27', '2022-09-06 21:44:27');
INSERT INTO `t_user_operate_log` VALUES (292, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:45:58', '2022-09-06 21:45:58');
INSERT INTO `t_user_operate_log` VALUES (293, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:46:19', '2022-09-06 21:46:19');
INSERT INTO `t_user_operate_log` VALUES (294, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:46:52', '2022-09-06 21:46:52');
INSERT INTO `t_user_operate_log` VALUES (295, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:46:56', '2022-09-06 21:46:56');
INSERT INTO `t_user_operate_log` VALUES (296, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:48:34', '2022-09-06 21:48:34');
INSERT INTO `t_user_operate_log` VALUES (297, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 21:50:11', '2022-09-06 21:50:11');
INSERT INTO `t_user_operate_log` VALUES (298, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 22:09:13', '2022-09-06 22:09:13');
INSERT INTO `t_user_operate_log` VALUES (299, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 22:26:04', '2022-09-06 22:26:04');
INSERT INTO `t_user_operate_log` VALUES (300, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 22:38:17', '2022-09-06 22:38:17');
INSERT INTO `t_user_operate_log` VALUES (301, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 22:45:45', '2022-09-06 22:45:45');
INSERT INTO `t_user_operate_log` VALUES (302, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 22:47:24', '2022-09-06 22:47:24');
INSERT INTO `t_user_operate_log` VALUES (303, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 22:49:16', '2022-09-06 22:49:16');
INSERT INTO `t_user_operate_log` VALUES (304, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 22:58:53', '2022-09-06 22:58:53');
INSERT INTO `t_user_operate_log` VALUES (305, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:00:58', '2022-09-06 23:00:58');
INSERT INTO `t_user_operate_log` VALUES (306, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:02:16', '2022-09-06 23:02:16');
INSERT INTO `t_user_operate_log` VALUES (307, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:02:53', '2022-09-06 23:02:53');
INSERT INTO `t_user_operate_log` VALUES (308, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:55:43', '2022-09-06 23:55:43');
INSERT INTO `t_user_operate_log` VALUES (309, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:56:14', '2022-09-06 23:56:14');
INSERT INTO `t_user_operate_log` VALUES (310, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:57:29', '2022-09-06 23:57:29');
INSERT INTO `t_user_operate_log` VALUES (311, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:58:17', '2022-09-06 23:58:17');
INSERT INTO `t_user_operate_log` VALUES (312, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:59:11', '2022-09-06 23:59:11');
INSERT INTO `t_user_operate_log` VALUES (313, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-06 23:59:52', '2022-09-06 23:59:52');
INSERT INTO `t_user_operate_log` VALUES (314, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:06:06', '2022-09-07 00:06:06');
INSERT INTO `t_user_operate_log` VALUES (315, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:06:20', '2022-09-07 00:06:20');
INSERT INTO `t_user_operate_log` VALUES (316, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-07 00:07:26', '2022-09-07 00:07:26');
INSERT INTO `t_user_operate_log` VALUES (317, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'net.lab1024.smartadmin.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"Notice\",\"NoticeList\",\"PersonNotice\",\"Email\",\"EmailList\",\"SendMail\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"ThreeRouter\",\"LevelTwo\",\"RoleTwoTwo\",\"RoleOneOne\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"email-send\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\",\"Business\",\"Peony\",\"PeonyList\",\"PeonyList1\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"StationList\",\"OrderList\",\"CarNumberMatchTrackList\",\"CarNumberReviseList\",\"GrowthAnalyseList\",\"CarNumberInOutList\",\"CarNumberTraceList\",\"NozzleNoNatchTrackList\",\"CarNumberTraceList2\",\"CarNumberTraceList3\",\"CarNumberTraceList5\",\"CarNumberTraceList4\"],\"roleId\":1}]', 1, NULL, '2022-09-07 00:07:39', '2022-09-07 00:07:39');
INSERT INTO `t_user_operate_log` VALUES (318, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:07:48', '2022-09-07 00:07:48');
INSERT INTO `t_user_operate_log` VALUES (319, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-07 00:07:48', '2022-09-07 00:07:48');
INSERT INTO `t_user_operate_log` VALUES (320, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:17:12', '2022-09-07 00:17:12');
INSERT INTO `t_user_operate_log` VALUES (321, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:17:50', '2022-09-07 00:17:50');
INSERT INTO `t_user_operate_log` VALUES (322, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:21:11', '2022-09-07 00:21:11');
INSERT INTO `t_user_operate_log` VALUES (323, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:29:18', '2022-09-07 00:29:18');
INSERT INTO `t_user_operate_log` VALUES (324, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:39:54', '2022-09-07 00:39:54');
INSERT INTO `t_user_operate_log` VALUES (325, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:40:20', '2022-09-07 00:40:20');
INSERT INTO `t_user_operate_log` VALUES (326, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:42:16', '2022-09-07 00:42:16');
INSERT INTO `t_user_operate_log` VALUES (327, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:45:08', '2022-09-07 00:45:08');
INSERT INTO `t_user_operate_log` VALUES (328, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:49:20', '2022-09-07 00:49:20');
INSERT INTO `t_user_operate_log` VALUES (329, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:58:16', '2022-09-07 00:58:16');
INSERT INTO `t_user_operate_log` VALUES (330, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 00:59:38', '2022-09-07 00:59:38');
INSERT INTO `t_user_operate_log` VALUES (331, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 01:00:22', '2022-09-07 01:00:22');
INSERT INTO `t_user_operate_log` VALUES (332, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 01:03:15', '2022-09-07 01:03:15');
INSERT INTO `t_user_operate_log` VALUES (333, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 01:03:34', '2022-09-07 01:03:34');
INSERT INTO `t_user_operate_log` VALUES (334, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-07 01:04:06', '2022-09-07 01:04:06');
INSERT INTO `t_user_operate_log` VALUES (335, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'net.lab1024.smartadmin.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"Notice\",\"NoticeList\",\"PersonNotice\",\"Email\",\"EmailList\",\"SendMail\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"ThreeRouter\",\"LevelTwo\",\"RoleTwoTwo\",\"RoleOneOne\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"email-send\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\",\"Business\",\"Peony\",\"PeonyList\",\"PeonyList1\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"StationList\",\"OrderList\",\"CarNumberMatchTrackList\",\"CarNumberReviseList\",\"GrowthAnalyseList\",\"CarNumberInOutList\",\"CarNumberTraceList\",\"CarNumberTraceList2\",\"CarNumberTraceList3\",\"CarNumberTraceList4\",\"CarNumberTraceList5\",\"NozzleNoMatchTrackList\"],\"roleId\":1}]', 1, NULL, '2022-09-07 01:04:11', '2022-09-07 01:04:11');
INSERT INTO `t_user_operate_log` VALUES (336, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 01:04:19', '2022-09-07 01:04:19');
INSERT INTO `t_user_operate_log` VALUES (337, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-07 01:06:12', '2022-09-07 01:06:12');
INSERT INTO `t_user_operate_log` VALUES (338, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 21:56:33', '2022-09-09 21:56:33');
INSERT INTO `t_user_operate_log` VALUES (339, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:00:44', '2022-09-09 22:00:44');
INSERT INTO `t_user_operate_log` VALUES (340, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:08:48', '2022-09-09 22:08:48');
INSERT INTO `t_user_operate_log` VALUES (341, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:36:18', '2022-09-09 22:36:18');
INSERT INTO `t_user_operate_log` VALUES (342, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:44:18', '2022-09-09 22:44:18');
INSERT INTO `t_user_operate_log` VALUES (343, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:45:12', '2022-09-09 22:45:12');
INSERT INTO `t_user_operate_log` VALUES (344, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:54:45', '2022-09-09 22:54:45');
INSERT INTO `t_user_operate_log` VALUES (345, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:55:23', '2022-09-09 22:55:23');
INSERT INTO `t_user_operate_log` VALUES (346, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:55:58', '2022-09-09 22:55:58');
INSERT INTO `t_user_operate_log` VALUES (347, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:56:22', '2022-09-09 22:56:22');
INSERT INTO `t_user_operate_log` VALUES (348, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:57:46', '2022-09-09 22:57:46');
INSERT INTO `t_user_operate_log` VALUES (349, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:58:31', '2022-09-09 22:58:31');
INSERT INTO `t_user_operate_log` VALUES (350, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:58:46', '2022-09-09 22:58:46');
INSERT INTO `t_user_operate_log` VALUES (351, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 22:59:41', '2022-09-09 22:59:41');
INSERT INTO `t_user_operate_log` VALUES (352, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:00:40', '2022-09-09 23:00:40');
INSERT INTO `t_user_operate_log` VALUES (353, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:03:00', '2022-09-09 23:03:00');
INSERT INTO `t_user_operate_log` VALUES (354, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:03:31', '2022-09-09 23:03:31');
INSERT INTO `t_user_operate_log` VALUES (355, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:04:14', '2022-09-09 23:04:14');
INSERT INTO `t_user_operate_log` VALUES (356, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:06:40', '2022-09-09 23:06:40');
INSERT INTO `t_user_operate_log` VALUES (357, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:08:41', '2022-09-09 23:08:41');
INSERT INTO `t_user_operate_log` VALUES (358, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:09:00', '2022-09-09 23:09:00');
INSERT INTO `t_user_operate_log` VALUES (359, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:14:33', '2022-09-09 23:14:33');
INSERT INTO `t_user_operate_log` VALUES (360, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:15:02', '2022-09-09 23:15:02');
INSERT INTO `t_user_operate_log` VALUES (361, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:34:13', '2022-09-09 23:34:13');
INSERT INTO `t_user_operate_log` VALUES (362, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:36:21', '2022-09-09 23:36:21');
INSERT INTO `t_user_operate_log` VALUES (363, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:39:15', '2022-09-09 23:39:15');
INSERT INTO `t_user_operate_log` VALUES (364, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:41:23', '2022-09-09 23:41:23');
INSERT INTO `t_user_operate_log` VALUES (365, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:41:52', '2022-09-09 23:41:52');
INSERT INTO `t_user_operate_log` VALUES (366, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:43:39', '2022-09-09 23:43:39');
INSERT INTO `t_user_operate_log` VALUES (367, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:43:51', '2022-09-09 23:43:51');
INSERT INTO `t_user_operate_log` VALUES (368, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:45:06', '2022-09-09 23:45:06');
INSERT INTO `t_user_operate_log` VALUES (369, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:50:33', '2022-09-09 23:50:33');
INSERT INTO `t_user_operate_log` VALUES (370, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:51:51', '2022-09-09 23:51:51');
INSERT INTO `t_user_operate_log` VALUES (371, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:57:19', '2022-09-09 23:57:19');
INSERT INTO `t_user_operate_log` VALUES (372, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:57:43', '2022-09-09 23:57:43');
INSERT INTO `t_user_operate_log` VALUES (373, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-09 23:59:53', '2022-09-09 23:59:53');
INSERT INTO `t_user_operate_log` VALUES (374, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:04:33', '2022-09-10 00:04:33');
INSERT INTO `t_user_operate_log` VALUES (375, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:04:40', '2022-09-10 00:04:40');
INSERT INTO `t_user_operate_log` VALUES (376, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:09:03', '2022-09-10 00:09:03');
INSERT INTO `t_user_operate_log` VALUES (377, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:14:49', '2022-09-10 00:14:49');
INSERT INTO `t_user_operate_log` VALUES (378, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:20:33', '2022-09-10 00:20:33');
INSERT INTO `t_user_operate_log` VALUES (379, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:22:14', '2022-09-10 00:22:14');
INSERT INTO `t_user_operate_log` VALUES (380, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:23:28', '2022-09-10 00:23:28');
INSERT INTO `t_user_operate_log` VALUES (381, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:26:28', '2022-09-10 00:26:28');
INSERT INTO `t_user_operate_log` VALUES (382, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:40:18', '2022-09-10 00:40:18');
INSERT INTO `t_user_operate_log` VALUES (383, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:40:33', '2022-09-10 00:40:33');
INSERT INTO `t_user_operate_log` VALUES (384, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:43:00', '2022-09-10 00:43:00');
INSERT INTO `t_user_operate_log` VALUES (385, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:45:15', '2022-09-10 00:45:15');
INSERT INTO `t_user_operate_log` VALUES (386, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 00:47:35', '2022-09-10 00:47:35');
INSERT INTO `t_user_operate_log` VALUES (387, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 01:05:24', '2022-09-10 01:05:24');
INSERT INTO `t_user_operate_log` VALUES (388, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 01:07:53', '2022-09-10 01:07:53');
INSERT INTO `t_user_operate_log` VALUES (389, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-10 01:08:05', '2022-09-10 01:08:05');
INSERT INTO `t_user_operate_log` VALUES (390, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'net.lab1024.smartadmin.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"Notice\",\"NoticeList\",\"PersonNotice\",\"Email\",\"EmailList\",\"SendMail\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"ThreeRouter\",\"LevelTwo\",\"RoleTwoTwo\",\"RoleOneOne\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"email-send\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\",\"Business\",\"Peony\",\"PeonyList\",\"PeonyList1\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"StationList\",\"OrderList\",\"CarNumberMatchTrackList\",\"CarNumberReviseList\",\"GrowthAnalyseList\",\"CarNumberInOutList\",\"CarNumberTraceList\",\"NozzleNoMatchTrackList\",\"CarNumberTraceList3\",\"CarNumberTraceList4\",\"CarNumberTraceList5\",\"CarTrafficFlowList\"],\"roleId\":1}]', 1, NULL, '2022-09-10 01:08:14', '2022-09-10 01:08:14');
INSERT INTO `t_user_operate_log` VALUES (391, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 01:08:22', '2022-09-10 01:08:22');
INSERT INTO `t_user_operate_log` VALUES (392, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-10 01:08:22', '2022-09-10 01:08:22');
INSERT INTO `t_user_operate_log` VALUES (393, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 01:10:30', '2022-09-10 01:10:30');
INSERT INTO `t_user_operate_log` VALUES (394, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 01:36:17', '2022-09-10 01:36:17');
INSERT INTO `t_user_operate_log` VALUES (395, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 01:42:50', '2022-09-10 01:42:50');
INSERT INTO `t_user_operate_log` VALUES (396, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 01:46:06', '2022-09-10 01:46:06');
INSERT INTO `t_user_operate_log` VALUES (397, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 09:44:04', '2022-09-10 09:44:04');
INSERT INTO `t_user_operate_log` VALUES (398, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:34:53', '2022-09-10 13:34:53');
INSERT INTO `t_user_operate_log` VALUES (399, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:36:46', '2022-09-10 13:36:46');
INSERT INTO `t_user_operate_log` VALUES (400, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:38:27', '2022-09-10 13:38:27');
INSERT INTO `t_user_operate_log` VALUES (401, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:44:30', '2022-09-10 13:44:30');
INSERT INTO `t_user_operate_log` VALUES (402, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:45:23', '2022-09-10 13:45:23');
INSERT INTO `t_user_operate_log` VALUES (403, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:47:16', '2022-09-10 13:47:16');
INSERT INTO `t_user_operate_log` VALUES (404, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:48:55', '2022-09-10 13:48:55');
INSERT INTO `t_user_operate_log` VALUES (405, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 13:51:31', '2022-09-10 13:51:31');
INSERT INTO `t_user_operate_log` VALUES (406, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 14:00:53', '2022-09-10 14:00:53');
INSERT INTO `t_user_operate_log` VALUES (407, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 14:06:05', '2022-09-10 14:06:05');
INSERT INTO `t_user_operate_log` VALUES (408, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 14:09:05', '2022-09-10 14:09:05');
INSERT INTO `t_user_operate_log` VALUES (409, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 14:45:23', '2022-09-10 14:45:23');
INSERT INTO `t_user_operate_log` VALUES (410, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 15:05:38', '2022-09-10 15:05:38');
INSERT INTO `t_user_operate_log` VALUES (411, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 15:28:09', '2022-09-10 15:28:09');
INSERT INTO `t_user_operate_log` VALUES (412, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 17:29:04', '2022-09-10 17:29:04');
INSERT INTO `t_user_operate_log` VALUES (413, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 17:38:51', '2022-09-10 17:38:51');
INSERT INTO `t_user_operate_log` VALUES (414, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:04:09', '2022-09-10 18:04:09');
INSERT INTO `t_user_operate_log` VALUES (415, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:23:18', '2022-09-10 18:23:18');
INSERT INTO `t_user_operate_log` VALUES (416, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:26:59', '2022-09-10 18:26:59');
INSERT INTO `t_user_operate_log` VALUES (417, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:27:37', '2022-09-10 18:27:37');
INSERT INTO `t_user_operate_log` VALUES (418, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:28:33', '2022-09-10 18:28:33');
INSERT INTO `t_user_operate_log` VALUES (419, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:28:39', '2022-09-10 18:28:39');
INSERT INTO `t_user_operate_log` VALUES (420, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:28:55', '2022-09-10 18:28:55');
INSERT INTO `t_user_operate_log` VALUES (421, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:29:18', '2022-09-10 18:29:18');
INSERT INTO `t_user_operate_log` VALUES (422, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:30:12', '2022-09-10 18:30:12');
INSERT INTO `t_user_operate_log` VALUES (423, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:30:54', '2022-09-10 18:30:54');
INSERT INTO `t_user_operate_log` VALUES (424, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:31:26', '2022-09-10 18:31:26');
INSERT INTO `t_user_operate_log` VALUES (425, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:34:24', '2022-09-10 18:34:24');
INSERT INTO `t_user_operate_log` VALUES (426, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:37:24', '2022-09-10 18:37:24');
INSERT INTO `t_user_operate_log` VALUES (427, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:37:34', '2022-09-10 18:37:34');
INSERT INTO `t_user_operate_log` VALUES (428, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 18:43:08', '2022-09-10 18:43:08');
INSERT INTO `t_user_operate_log` VALUES (429, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 19:16:40', '2022-09-10 19:16:40');
INSERT INTO `t_user_operate_log` VALUES (430, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 19:19:26', '2022-09-10 19:19:26');
INSERT INTO `t_user_operate_log` VALUES (431, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 19:20:21', '2022-09-10 19:20:21');
INSERT INTO `t_user_operate_log` VALUES (432, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 19:22:58', '2022-09-10 19:22:58');
INSERT INTO `t_user_operate_log` VALUES (433, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 20:49:28', '2022-09-10 20:49:28');
INSERT INTO `t_user_operate_log` VALUES (434, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 20:53:44', '2022-09-10 20:53:44');
INSERT INTO `t_user_operate_log` VALUES (435, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:01:32', '2022-09-10 21:01:32');
INSERT INTO `t_user_operate_log` VALUES (436, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:04:30', '2022-09-10 21:04:30');
INSERT INTO `t_user_operate_log` VALUES (437, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:04:44', '2022-09-10 21:04:44');
INSERT INTO `t_user_operate_log` VALUES (438, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:05:41', '2022-09-10 21:05:41');
INSERT INTO `t_user_operate_log` VALUES (439, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:06:09', '2022-09-10 21:06:09');
INSERT INTO `t_user_operate_log` VALUES (440, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:06:31', '2022-09-10 21:06:31');
INSERT INTO `t_user_operate_log` VALUES (441, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:06:46', '2022-09-10 21:06:46');
INSERT INTO `t_user_operate_log` VALUES (442, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:07:38', '2022-09-10 21:07:38');
INSERT INTO `t_user_operate_log` VALUES (443, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:07:54', '2022-09-10 21:07:54');
INSERT INTO `t_user_operate_log` VALUES (444, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:08:05', '2022-09-10 21:08:05');
INSERT INTO `t_user_operate_log` VALUES (445, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:08:31', '2022-09-10 21:08:31');
INSERT INTO `t_user_operate_log` VALUES (446, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:08:42', '2022-09-10 21:08:42');
INSERT INTO `t_user_operate_log` VALUES (447, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:08:49', '2022-09-10 21:08:49');
INSERT INTO `t_user_operate_log` VALUES (448, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:08:59', '2022-09-10 21:08:59');
INSERT INTO `t_user_operate_log` VALUES (449, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:09:09', '2022-09-10 21:09:09');
INSERT INTO `t_user_operate_log` VALUES (450, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:09:17', '2022-09-10 21:09:17');
INSERT INTO `t_user_operate_log` VALUES (451, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:09:18', '2022-09-10 21:09:18');
INSERT INTO `t_user_operate_log` VALUES (452, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:09:19', '2022-09-10 21:09:19');
INSERT INTO `t_user_operate_log` VALUES (453, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:40:54', '2022-09-10 21:40:54');
INSERT INTO `t_user_operate_log` VALUES (454, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:40:59', '2022-09-10 21:40:59');
INSERT INTO `t_user_operate_log` VALUES (455, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:41:58', '2022-09-10 21:41:58');
INSERT INTO `t_user_operate_log` VALUES (456, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:46:37', '2022-09-10 21:46:37');
INSERT INTO `t_user_operate_log` VALUES (457, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:50:16', '2022-09-10 21:50:16');
INSERT INTO `t_user_operate_log` VALUES (458, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 21:57:53', '2022-09-10 21:57:53');
INSERT INTO `t_user_operate_log` VALUES (459, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 22:18:23', '2022-09-10 22:18:23');
INSERT INTO `t_user_operate_log` VALUES (460, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 22:22:56', '2022-09-10 22:22:56');
INSERT INTO `t_user_operate_log` VALUES (461, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 22:24:46', '2022-09-10 22:24:46');
INSERT INTO `t_user_operate_log` VALUES (462, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 22:34:00', '2022-09-10 22:34:00');
INSERT INTO `t_user_operate_log` VALUES (463, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 22:34:09', '2022-09-10 22:34:09');
INSERT INTO `t_user_operate_log` VALUES (464, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 23:13:54', '2022-09-10 23:13:54');
INSERT INTO `t_user_operate_log` VALUES (465, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 23:24:48', '2022-09-10 23:24:48');
INSERT INTO `t_user_operate_log` VALUES (466, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-10 23:25:28', '2022-09-10 23:25:28');
INSERT INTO `t_user_operate_log` VALUES (467, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 00:11:17', '2022-09-11 00:11:17');
INSERT INTO `t_user_operate_log` VALUES (468, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 00:12:52', '2022-09-11 00:12:52');
INSERT INTO `t_user_operate_log` VALUES (469, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:19:02', '2022-09-11 10:19:02');
INSERT INTO `t_user_operate_log` VALUES (470, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-11 10:19:14', '2022-09-11 10:19:14');
INSERT INTO `t_user_operate_log` VALUES (471, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'net.lab1024.smartadmin.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\",\"Business\",\"Peony\",\"PeonyList\",\"PeonyList1\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"StationList\",\"OrderList\",\"CarNumberMatchTrackList\",\"CarNumberReviseList\",\"CarNumberInOutList\",\"CarNumberTraceList\",\"NozzleNoMatchTrackList\",\"CarTrafficFlowList\",\"CarNumberTraceList3\",\"CarNumberTraceList4\",\"CarNumberTraceList5\"],\"roleId\":1}]', 1, NULL, '2022-09-11 10:19:26', '2022-09-11 10:19:26');
INSERT INTO `t_user_operate_log` VALUES (472, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:19:30', '2022-09-11 10:19:30');
INSERT INTO `t_user_operate_log` VALUES (473, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-11 10:19:30', '2022-09-11 10:19:30');
INSERT INTO `t_user_operate_log` VALUES (474, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:19:35', '2022-09-11 10:19:35');
INSERT INTO `t_user_operate_log` VALUES (475, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-11 10:19:35', '2022-09-11 10:19:35');
INSERT INTO `t_user_operate_log` VALUES (476, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:19:43', '2022-09-11 10:19:43');
INSERT INTO `t_user_operate_log` VALUES (477, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-11 10:19:43', '2022-09-11 10:19:43');
INSERT INTO `t_user_operate_log` VALUES (478, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:20:04', '2022-09-11 10:20:04');
INSERT INTO `t_user_operate_log` VALUES (479, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-11 10:20:15', '2022-09-11 10:20:15');
INSERT INTO `t_user_operate_log` VALUES (480, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'net.lab1024.smartadmin.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\",\"Business\",\"Peony\",\"PeonyList\",\"PeonyList1\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"StationList\",\"OrderList\",\"CarNumberMatchTrackList\",\"CarNumberReviseList\",\"CarNumberInOutList\",\"CarNumberTraceList\",\"NozzleNoMatchTrackList\",\"CarTrafficFlowList\",\"CarNumberTraceList3\",\"CarNumberTraceList4\",\"CarNumberTraceList5\",\"Email\",\"EmailList\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"SendMail\",\"email-send\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"Notice\",\"NoticeList\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"PersonNotice\",\"person-notice-query\",\"person-notice-detail\",\"NoticeDetail\",\"ThreeRouter\",\"LevelTwo\",\"ThreeLevelRouterView\",\"RoleTwoTwo\",\"RoleOneOne\"],\"roleId\":1}]', 1, NULL, '2022-09-11 10:20:53', '2022-09-11 10:20:53');
INSERT INTO `t_user_operate_log` VALUES (481, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:23:42', '2022-09-11 10:23:42');
INSERT INTO `t_user_operate_log` VALUES (482, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:27:22', '2022-09-11 10:27:22');
INSERT INTO `t_user_operate_log` VALUES (483, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 10:31:26', '2022-09-11 10:31:26');
INSERT INTO `t_user_operate_log` VALUES (484, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 11:00:23', '2022-09-11 11:00:23');
INSERT INTO `t_user_operate_log` VALUES (485, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 11:04:07', '2022-09-11 11:04:07');
INSERT INTO `t_user_operate_log` VALUES (486, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 11:36:22', '2022-09-11 11:36:22');
INSERT INTO `t_user_operate_log` VALUES (487, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 11:36:38', '2022-09-11 11:36:38');
INSERT INTO `t_user_operate_log` VALUES (488, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 11:37:08', '2022-09-11 11:37:08');
INSERT INTO `t_user_operate_log` VALUES (489, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 11:37:20', '2022-09-11 11:37:20');
INSERT INTO `t_user_operate_log` VALUES (490, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 11:37:38', '2022-09-11 11:37:38');
INSERT INTO `t_user_operate_log` VALUES (491, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:01:15', '2022-09-11 12:01:15');
INSERT INTO `t_user_operate_log` VALUES (492, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:03:19', '2022-09-11 12:03:19');
INSERT INTO `t_user_operate_log` VALUES (493, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:19:44', '2022-09-11 12:19:44');
INSERT INTO `t_user_operate_log` VALUES (494, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:21:14', '2022-09-11 12:21:14');
INSERT INTO `t_user_operate_log` VALUES (495, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:26:59', '2022-09-11 12:26:59');
INSERT INTO `t_user_operate_log` VALUES (496, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:27:48', '2022-09-11 12:27:48');
INSERT INTO `t_user_operate_log` VALUES (497, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:33:54', '2022-09-11 12:33:54');
INSERT INTO `t_user_operate_log` VALUES (498, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:36:17', '2022-09-11 12:36:17');
INSERT INTO `t_user_operate_log` VALUES (499, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:38:15', '2022-09-11 12:38:15');
INSERT INTO `t_user_operate_log` VALUES (500, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:39:26', '2022-09-11 12:39:26');
INSERT INTO `t_user_operate_log` VALUES (501, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:39:48', '2022-09-11 12:39:48');
INSERT INTO `t_user_operate_log` VALUES (502, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:40:01', '2022-09-11 12:40:01');
INSERT INTO `t_user_operate_log` VALUES (503, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:41:04', '2022-09-11 12:41:04');
INSERT INTO `t_user_operate_log` VALUES (504, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 12:42:48', '2022-09-11 12:42:48');
INSERT INTO `t_user_operate_log` VALUES (505, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:37:17', '2022-09-11 15:37:17');
INSERT INTO `t_user_operate_log` VALUES (506, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:37:25', '2022-09-11 15:37:25');
INSERT INTO `t_user_operate_log` VALUES (507, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:43:33', '2022-09-11 15:43:33');
INSERT INTO `t_user_operate_log` VALUES (508, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:43:39', '2022-09-11 15:43:39');
INSERT INTO `t_user_operate_log` VALUES (509, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:43:48', '2022-09-11 15:43:48');
INSERT INTO `t_user_operate_log` VALUES (510, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:44:04', '2022-09-11 15:44:04');
INSERT INTO `t_user_operate_log` VALUES (511, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:44:08', '2022-09-11 15:44:08');
INSERT INTO `t_user_operate_log` VALUES (512, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:44:40', '2022-09-11 15:44:40');
INSERT INTO `t_user_operate_log` VALUES (513, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'net.lab1024.smartadmin.module.system.login.LoginController.getSession', '', 1, NULL, '2022-09-11 15:45:01', '2022-09-11 15:45:01');
INSERT INTO `t_user_operate_log` VALUES (514, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'net.lab1024.smartadmin.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2022-09-11 15:45:11', '2022-09-11 15:45:11');
INSERT INTO `t_user_operate_log` VALUES (515, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-11 15:45:12', '2022-09-11 15:45:12');
INSERT INTO `t_user_operate_log` VALUES (516, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'net.lab1024.smartadmin.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2022-09-11 15:45:13', '2022-09-11 15:45:13');
INSERT INTO `t_user_operate_log` VALUES (517, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'net.lab1024.smartadmin.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2022-09-11 15:45:13', '2022-09-11 15:45:13');
INSERT INTO `t_user_operate_log` VALUES (518, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'net.lab1024.smartadmin.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2022-09-11 15:45:13', '2022-09-11 15:45:13');
INSERT INTO `t_user_operate_log` VALUES (519, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'net.lab1024.smartadmin.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2022-09-11 15:45:13', '2022-09-11 15:45:13');

SET FOREIGN_KEY_CHECKS = 1;
