# 教务管理系统后端项目

这是一个基于Spring Boot的教务管理系统后端项目，提供学生信息管理、课程管理、成绩管理等功能。

## 项目结构

项目遵循标准的Spring Boot项目结构，主要包含以下模块：

- 控制器层（Controller）：处理HTTP请求和响应
- 服务层（Service）：实现业务逻辑
- 数据访问层（Mapper）：与数据库交互
- 模型层（Model）：包含实体类、DTO和VO
- 通用工具（Common）：包含Result类、ResultCode枚举等通用组件
- 异常处理（Exception）：自定义异常和全局异常处理

## 技术栈

- Spring Boot 3.4.4
- MyBatis-Plus 3.5.4
- MySQL 8.0
- Redis
- MinIO

## 数据库设计

详细数据库设计见 `jwgl_system.sql` 文件。

## 项目配置

主要配置信息位于 `application.yml` 文件中。

## 如何运行

1. 克隆项目到本地
2. 导入 `jwgl_system.sql` 到MySQL数据库
3. 修改 `application.yml` 中的数据库连接信息
4. 运行 Maven 构建项目
5. 启动应用程序

## API文档

启动应用后，可通过 Swagger UI 查看API文档：http://localhost:8080/swagger-ui/index.html