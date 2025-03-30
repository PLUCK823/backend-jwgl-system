/*
 Navicat Premium Dump SQL

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : 192.168.113.100:3306
 Source Schema         : jwgl_system

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 31/03/2025 00:17:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `admin_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员编号',
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属部门',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职位',
  `entry_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-离职，1-在职',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_admin_no`(`admin_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_admin_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, 'A001', '系统管理部', '管理员', '2025-03-29', 1, '2025-03-29 07:01:38', '2025-03-30 11:08:21');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `publisher_id` bigint NOT NULL COMMENT '发布人ID',
  `publish_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `target_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目标角色：ALL-所有人，ADMIN-管理员，TEACHER-教师，STUDENT-学生',
  `course_id` bigint NULL DEFAULT NULL COMMENT '关联课程ID',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-未发布，1-已发布，2-已结束',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_publisher_id`(`publisher_id` ASC) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班级名称',
  `grade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年级',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院',
  `major` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业',
  `class_size` int NULL DEFAULT NULL COMMENT '班级人数',
  `instructor_id` bigint NULL DEFAULT NULL COMMENT '辅导员ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_class_name`(`class_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info
-- ----------------------------

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '学院ID',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学院代码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学院名称',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_college_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学院信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '01', '计算机学院', 1, '2025-03-30 15:54:44', '2025-03-30 15:54:44');
INSERT INTO `college` VALUES (2, '02', '机械工程学院', 1, '2025-03-30 15:54:44', '2025-03-30 15:54:44');
INSERT INTO `college` VALUES (3, '03', '电子信息学院', 1, '2025-03-30 15:54:44', '2025-03-30 15:54:44');
INSERT INTO `college` VALUES (4, '04', '经济管理学院', 1, '2025-03-30 15:54:44', '2025-03-30 15:54:44');
INSERT INTO `college` VALUES (5, '05', '外国语学院', 1, '2025-03-30 15:54:44', '2025-03-30 15:54:44');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '课程名称',
  `credit` decimal(5, 2) NOT NULL COMMENT '学分',
  `course_hours` int NOT NULL COMMENT '课时',
  `course_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程类型',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开课学院',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '课程描述',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-未开课，1-已开课',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_course_no`(`course_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for course_selection
-- ----------------------------
DROP TABLE IF EXISTS `course_selection`;
CREATE TABLE `course_selection`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '选课ID',
  `student_id` bigint NOT NULL COMMENT '学生ID',
  `teaching_task_id` bigint NOT NULL COMMENT '教学任务ID',
  `select_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '选课时间',
  `grade` decimal(5, 2) NULL DEFAULT NULL COMMENT '成绩',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-退选，1-已选，2-已修完',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_student_task`(`student_id` ASC, `teaching_task_id` ASC) USING BTREE,
  INDEX `idx_student_id`(`student_id` ASC) USING BTREE,
  INDEX `idx_teaching_task_id`(`teaching_task_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '选课表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_selection
-- ----------------------------

-- ----------------------------
-- Table structure for leave_application
-- ----------------------------
DROP TABLE IF EXISTS `leave_application`;
CREATE TABLE `leave_application`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '请假ID',
  `student_id` bigint NOT NULL COMMENT '学生ID',
  `reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请假原因',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `approver_id` bigint NULL DEFAULT NULL COMMENT '审批人ID',
  `approval_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `approval_status` tinyint NOT NULL DEFAULT 0 COMMENT '审批状态：0-待审批，1-已批准，2-已拒绝',
  `approval_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审批意见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_student_id`(`student_id` ASC) USING BTREE,
  INDEX `idx_approver_id`(`approver_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '请假表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leave_application
-- ----------------------------

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '专业ID',
  `college_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属学院ID',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业代码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业名称',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_major_code`(`code` ASC) USING BTREE,
  INDEX `idx_college_id`(`college_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '专业信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '01', '01', '软件工程', 1, '2025-03-30 23:59:53', '2025-03-30 16:07:29');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '成绩ID',
  `student_id` bigint NOT NULL COMMENT '学生ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `teaching_task_id` bigint NOT NULL COMMENT '教学任务ID',
  `usual_score` decimal(5, 2) NULL DEFAULT NULL COMMENT '平时成绩',
  `midterm_score` decimal(5, 2) NULL DEFAULT NULL COMMENT '期中成绩',
  `final_score` decimal(5, 2) NULL DEFAULT NULL COMMENT '期末成绩',
  `total_score` decimal(5, 2) NULL DEFAULT NULL COMMENT '总成绩',
  `semester` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学期',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_student_course_semester`(`student_id` ASC, `course_id` ASC, `semester` ASC) USING BTREE,
  INDEX `idx_student_id`(`student_id` ASC) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE,
  INDEX `idx_teaching_task_id`(`teaching_task_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '成绩表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '学生ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `student_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学号',
  `admission_date` date NULL DEFAULT NULL COMMENT '入学日期',
  `graduation_date` date NULL DEFAULT NULL COMMENT '毕业日期',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院',
  `major` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '班级',
  `education_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学历层次',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-休学，1-在读，2-毕业，3-退学',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_student_no`(`student_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_class_name`(`class_name` ASC) USING BTREE,
  CONSTRAINT `fk_student_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 2, 'S001', '2021-09-01', NULL, '计算机学院', '软件工程', '软件工程1班', '本科', 1, '2025-03-30 22:05:54', '2025-03-30 22:05:54');
INSERT INTO `student` VALUES (2, 4, 'S002', '2021-09-01', NULL, '计算机学院', '软件工程', '软件工程1班', '本科', 1, '2025-03-30 22:31:52', '2025-03-30 22:31:52');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态：0-失败，1-成功',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '错误消息',
  `execution_time` bigint NULL DEFAULT NULL COMMENT '执行时长(毫秒)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `menu_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `menu_type` tinyint NOT NULL COMMENT '类型：0-目录，1-菜单，2-按钮',
  `hidden` tinyint NOT NULL DEFAULT 0 COMMENT '是否隐藏：0-显示，1-隐藏',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', 'Layout', 'setting', 1, 'system', 0, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'user', 'system/user/index', 'user', 1, 'system:user:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'role', 'system/role/index', 'peoples', 2, 'system:role:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'menu', 'system/menu/index', 'tree-table', 3, 'system:menu:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (5, 1, '日志管理', 'log', 'system/log/index', 'log', 4, 'system:log:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (6, 0, '学生管理', '/student', 'Layout', 'peoples', 3, 'student', 0, 0, 1, '2025-03-29 07:01:38', '2025-03-30 16:14:03');
INSERT INTO `sys_menu` VALUES (7, 6, '学生信息', 'info', 'student/info/index', 'user', 1, 'student:info:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (8, 6, '班级管理', 'class', 'student/class/index', 'tree', 2, 'student:class:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (9, 0, '教师管理', '/teacher', 'Layout', 'user', 4, 'teacher', 0, 0, 1, '2025-03-29 07:01:38', '2025-03-30 16:14:03');
INSERT INTO `sys_menu` VALUES (10, 9, '教师信息', 'info', 'teacher/info/index', 'user', 1, 'teacher:info:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (11, 0, '课程管理', '/course', 'Layout', 'education', 5, 'course', 0, 0, 1, '2025-03-29 07:01:38', '2025-03-30 16:14:03');
INSERT INTO `sys_menu` VALUES (12, 11, '课程信息', 'info', 'course/info/index', 'form', 1, 'course:info:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (13, 11, '教学任务', 'task', 'course/task/index', 'guide', 2, 'course:task:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (14, 0, '成绩管理', '/score', 'Layout', 'chart', 6, 'score', 0, 0, 1, '2025-03-29 07:01:38', '2025-03-30 16:14:03');
INSERT INTO `sys_menu` VALUES (15, 14, '成绩录入', 'input', 'score/input/index', 'edit', 1, 'score:input:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (16, 14, '成绩查询', 'query', 'score/query/index', 'search', 2, 'score:query:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (17, 14, '成绩统计', 'stats', 'score/stats/index', 'chart', 3, 'score:stats:list', 1, 0, 1, '2025-03-29 07:01:38', '2025-03-29 07:01:38');
INSERT INTO `sys_menu` VALUES (18, 0, '基础数据管理', '/basedata', 'Layout', 'database', 2, 'basedata', 0, 0, 1, '2025-03-30 16:14:03', '2025-03-30 16:14:03');
INSERT INTO `sys_menu` VALUES (19, 18, '学院管理', 'college', 'basedata/college/index', 'school', 1, 'basedata:college:list', 1, 0, 1, '2025-03-30 16:14:03', '2025-03-30 16:14:03');
INSERT INTO `sys_menu` VALUES (20, 18, '专业管理', 'major', 'basedata/major/index', 'education', 2, 'basedata:major:list', 1, 0, 1, '2025-03-30 16:14:03', '2025-03-30 16:14:03');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_role_code`(`role_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'ADMIN', '系统管理员，拥有管理权限', 1, '2025-03-29 07:01:38', '2025-03-30 09:54:01');
INSERT INTO `sys_role` VALUES (2, '教师', 'TEACHER', '教师用户，拥有教学相关权限', 1, '2025-03-29 07:01:38', '2025-03-30 09:55:59');
INSERT INTO `sys_role` VALUES (3, '学生', 'STUDENT', '学生用户，拥有学习相关权限', 1, '2025-03-29 07:01:38', '2025-03-30 09:54:08');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (113, 1, 1);
INSERT INTO `sys_role_menu` VALUES (114, 1, 2);
INSERT INTO `sys_role_menu` VALUES (115, 1, 3);
INSERT INTO `sys_role_menu` VALUES (116, 1, 4);
INSERT INTO `sys_role_menu` VALUES (117, 1, 5);
INSERT INTO `sys_role_menu` VALUES (118, 1, 6);
INSERT INTO `sys_role_menu` VALUES (119, 1, 7);
INSERT INTO `sys_role_menu` VALUES (120, 1, 8);
INSERT INTO `sys_role_menu` VALUES (121, 1, 9);
INSERT INTO `sys_role_menu` VALUES (122, 1, 10);
INSERT INTO `sys_role_menu` VALUES (123, 1, 11);
INSERT INTO `sys_role_menu` VALUES (124, 1, 12);
INSERT INTO `sys_role_menu` VALUES (125, 1, 13);
INSERT INTO `sys_role_menu` VALUES (126, 1, 14);
INSERT INTO `sys_role_menu` VALUES (127, 1, 15);
INSERT INTO `sys_role_menu` VALUES (128, 1, 16);
INSERT INTO `sys_role_menu` VALUES (129, 1, 17);
INSERT INTO `sys_role_menu` VALUES (130, 2, 9);
INSERT INTO `sys_role_menu` VALUES (131, 2, 10);
INSERT INTO `sys_role_menu` VALUES (132, 2, 11);
INSERT INTO `sys_role_menu` VALUES (133, 2, 12);
INSERT INTO `sys_role_menu` VALUES (134, 2, 13);
INSERT INTO `sys_role_menu` VALUES (135, 2, 14);
INSERT INTO `sys_role_menu` VALUES (136, 2, 15);
INSERT INTO `sys_role_menu` VALUES (137, 2, 16);
INSERT INTO `sys_role_menu` VALUES (138, 2, 17);
INSERT INTO `sys_role_menu` VALUES (139, 3, 6);
INSERT INTO `sys_role_menu` VALUES (140, 3, 7);
INSERT INTO `sys_role_menu` VALUES (141, 3, 11);
INSERT INTO `sys_role_menu` VALUES (142, 3, 12);
INSERT INTO `sys_role_menu` VALUES (143, 3, 14);
INSERT INTO `sys_role_menu` VALUES (144, 3, 16);
INSERT INTO `sys_role_menu` VALUES (145, 3, 17);
INSERT INTO `sys_role_menu` VALUES (176, 1, 1);
INSERT INTO `sys_role_menu` VALUES (177, 1, 6);
INSERT INTO `sys_role_menu` VALUES (178, 1, 9);
INSERT INTO `sys_role_menu` VALUES (179, 1, 11);
INSERT INTO `sys_role_menu` VALUES (180, 1, 14);
INSERT INTO `sys_role_menu` VALUES (181, 1, 2);
INSERT INTO `sys_role_menu` VALUES (182, 1, 3);
INSERT INTO `sys_role_menu` VALUES (183, 1, 4);
INSERT INTO `sys_role_menu` VALUES (184, 1, 5);
INSERT INTO `sys_role_menu` VALUES (185, 1, 7);
INSERT INTO `sys_role_menu` VALUES (186, 1, 8);
INSERT INTO `sys_role_menu` VALUES (187, 1, 10);
INSERT INTO `sys_role_menu` VALUES (188, 1, 12);
INSERT INTO `sys_role_menu` VALUES (189, 1, 13);
INSERT INTO `sys_role_menu` VALUES (190, 1, 15);
INSERT INTO `sys_role_menu` VALUES (191, 1, 16);
INSERT INTO `sys_role_menu` VALUES (192, 1, 17);
INSERT INTO `sys_role_menu` VALUES (207, 1, 18);
INSERT INTO `sys_role_menu` VALUES (208, 1, 19);
INSERT INTO `sys_role_menu` VALUES (209, 1, 20);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像URL',
  `gender` tinyint NULL DEFAULT 0 COMMENT '性别：0-未知，1-男，2-女',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', '超级管理员', NULL, 1, NULL, NULL, NULL, 1, 1, '2025-03-29 07:01:38', '2025-03-30 11:07:56', '2025-03-30 19:40:33', '初始超级管理员账号');
INSERT INTO `sys_user` VALUES (2, 'S001', 'S001', '测试学生', NULL, 0, NULL, NULL, NULL, 1, 3, '2025-03-30 22:05:54', '2025-03-30 14:30:44', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 'S002', 'S002', '测试学生2', NULL, 0, NULL, NULL, NULL, 1, 3, '2025-03-30 22:31:52', '2025-03-30 22:31:52', NULL, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `teacher_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教师编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院',
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系部',
  `entry_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `departure_date` date NULL DEFAULT NULL COMMENT '离职日期',
  `education` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学历',
  `degree` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学位',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-离职，1-在职',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_teacher_no`(`teacher_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_teacher_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教师信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for teaching_resource
-- ----------------------------
DROP TABLE IF EXISTS `teaching_resource`;
CREATE TABLE `teaching_resource`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `resource_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资源名称',
  `resource_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资源类型',
  `resource_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资源URL',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小(字节)',
  `course_id` bigint NULL DEFAULT NULL COMMENT '关联课程ID',
  `teacher_id` bigint NOT NULL COMMENT '上传教师ID',
  `download_count` int NOT NULL DEFAULT 0 COMMENT '下载次数',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教学资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teaching_resource
-- ----------------------------

-- ----------------------------
-- Table structure for teaching_task
-- ----------------------------
DROP TABLE IF EXISTS `teaching_task`;
CREATE TABLE `teaching_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '教学任务ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `teacher_id` bigint NOT NULL COMMENT '教师ID',
  `semester` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学期',
  `class_room` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '教室',
  `class_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时间',
  `max_student` int NULL DEFAULT NULL COMMENT '最大学生数',
  `selected_count` int NOT NULL DEFAULT 0 COMMENT '已选学生数',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-未开始，1-进行中，2-已结束',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id` ASC) USING BTREE,
  INDEX `idx_semester`(`semester` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教学任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teaching_task
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
