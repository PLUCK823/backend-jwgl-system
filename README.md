# 教务管理系统后端项目

这是一个基于Spring Boot的教务管理系统后端项目，提供学生信息管理、课程管理、成绩管理等功能。

## 项目结构

项目遵循标准的Spring Boot项目结构，主要包含以下模块：

* 控制器层（Controller）：处理HTTP请求和响应
* 服务层（Service）：实现业务逻辑
* 数据访问层（Mapper）：与数据库交互
* 模型层（Model）：包含实体类、DTO和VO
* 通用工具（Common）：包含Result类、ResultCode枚举等通用组件
* 异常处理（Exception）：自定义异常和全局异常处理

## 技术栈

* Spring Boot 3.1.5
* MyBatis-Plus 3.5.3.1
* MySQL 8.0
* Redis
* MinIO

## 主要功能模块

1. **用户认证与授权**
   - 基于JWT的用户认证
   - 基于角色的权限控制

2. **学生管理**
   - 学生信息的增删改查
   - 学生班级管理
   - 学生成绩管理

3. **教师管理**
   - 教师信息的增删改查
   - 教学任务分配

4. **课程管理**
   - 课程信息的增删改查
   - 教学任务管理
   - 选课管理

5. **成绩管理**
   - 成绩录入与修改
   - 成绩统计与分析

6. **教学资源管理**
   - 教学资源上传与下载
   - 教学资源分类管理

## 数据库设计

详细数据库设计见 `jwgl_system.sql` 文件。

## 项目配置

主要配置信息位于 `application.yml` 文件中，包括：

- 数据库连接配置
- Redis缓存配置
- MinIO对象存储配置
- 日志配置
- 安全配置

## 如何运行

1. 克隆项目到本地
2. 导入 `jwgl_system.sql` 到MySQL数据库
3. 修改 `application.yml` 中的数据库连接信息
4. 运行 Maven 构建项目
5. 启动应用程序

## API文档

启动应用后，可通过 Swagger UI 查看API文档：`http://localhost:8080/swagger-ui/index.html`

## 注意事项

- 项目中使用的数据库连接、Redis连接和MinIO连接信息需要根据实际环境进行配置
- 开发环境下禁用了方法安全性，生产环境需要启用（在application.yml中将profiles.active改为prod）

## 完整代码获取

由于GitHub文件数量限制，本仓库只上传了部分关键代码文件。如需获取完整代码，请通过以下方式联系：

- 邮箱：your-email@example.com
- 微信：your-wechat-id