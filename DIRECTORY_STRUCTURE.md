# 教务管理系统后端项目目录结构

```
backend/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── org/
│   │   │       └── hz/
│   │   │           └── backend/
│   │   │               ├── common/                # 通用组件
│   │   │               │   ├── Result.java        # 统一返回结果类
│   │   │               │   └── ResultCode.java    # 结果状态码枚举
│   │   │               ├── config/                # 配置类
│   │   │               │   ├── MethodSecurityConfig.java
│   │   │               │   ├── MinioConfig.java
│   │   │               │   ├── MybatisPlusConfig.java
│   │   │               │   ├── MyMetaObjectHandler.java
│   │   │               │   ├── RedisConfig.java
│   │   │               │   ├── SecurityConfig.java
│   │   │               │   └── SwaggerConfig.java
│   │   │               ├── controller/            # 控制器层
│   │   │               │   ├── AnnouncementController.java
│   │   │               │   ├── AuthController.java
│   │   │               │   ├── ClassInfoController.java
│   │   │               │   ├── CollegeController.java
│   │   │               │   ├── CourseController.java
│   │   │               │   ├── CourseSelectionController.java
│   │   │               │   ├── LeaveApplicationController.java
│   │   │               │   ├── MajorController.java
│   │   │               │   ├── ScoreController.java
│   │   │               │   ├── StudentController.java
│   │   │               │   ├── TeacherController.java
│   │   │               │   ├── TeachingResourceController.java
│   │   │               │   └── TeachingTaskController.java
│   │   │               ├── exception/             # 异常处理
│   │   │               │   ├── BusinessException.java
│   │   │               │   └── GlobalExceptionHandler.java
│   │   │               ├── mapper/                # Mapper接口
│   │   │               │   ├── ClassInfoMapper.java
│   │   │               │   ├── CourseMapper.java
│   │   │               │   ├── CourseSelectionMapper.java
│   │   │               │   ├── MajorMapper.java
│   │   │               │   ├── ScoreMapper.java
│   │   │               │   ├── StudentMapper.java
│   │   │               │   ├── SysRoleMapper.java
│   │   │               │   ├── SysUserMapper.java
│   │   │               │   ├── TeacherMapper.java
│   │   │               │   ├── TeachingResourceMapper.java
│   │   │               │   └── TeachingTaskMapper.java
│   │   │               ├── model/                 # 模型层
│   │   │               │   ├── dto/               # 数据传输对象
│   │   │               │   │   ├── AnnouncementDto.java
│   │   │               │   │   ├── ClassInfoDto.java
│   │   │               │   │   ├── CourseDto.java
│   │   │               │   │   ├── LoginDto.java
│   │   │               │   │   ├── ...
│   │   │               │   ├── entity/            # 实体类
│   │   │               │   │   ├── Announcement.java
│   │   │               │   │   ├── ClassInfo.java
│   │   │               │   │   ├── Course.java
│   │   │               │   │   ├── ...
│   │   │               │   └── vo/                # 视图对象
│   │   │               │       ├── AnnouncementVo.java
│   │   │               │       ├── ClassInfoVo.java
│   │   │               │       ├── CourseVo.java
│   │   │               │       ├── ...
│   │   │               ├── security/              # 安全配置
│   │   │               │   ├── JwtAuthenticationEntryPoint.java
│   │   │               │   ├── JwtAuthenticationFilter.java
│   │   │               │   ├── JwtUserDetails.java
│   │   │               │   └── UserDetailsServiceImpl.java
│   │   │               ├── service/               # 服务层
│   │   │               │   ├── impl/              # 服务实现类
│   │   │               │   │   ├── AnnouncementServiceImpl.java
│   │   │               │   │   ├── AuthServiceImpl.java
│   │   │               │   │   ├── ...
│   │   │               │   ├── AnnouncementService.java
│   │   │               │   ├── AuthService.java
│   │   │               │   ├── ...
│   │   │               ├── utils/                 # 工具类
│   │   │               │   ├── EmailService.java
│   │   │               │   ├── ExcelUtils.java
│   │   │               │   ├── FileUtils.java
│   │   │               │   ├── JwtUtils.java
│   │   │               │   ├── ...
│   │   │               └── BackendApplication.java # 应用主类
│   │   └── resources/
│   │       ├── mapper/                 # MyBatis XML映射文件
│   │       │   ├── ClassInfoMapper.xml
│   │       │   ├── CourseMapper.xml
│   │       │   ├── CourseSelectionMapper.xml
│   │       │   ├── ScoreMapper.xml
│   │       │   ├── TeachingResourceMapper.xml
│   │       │   └── TeachingTaskMapper.xml
│   │       ├── application.yml         # 主配置文件
│   │       ├── application-dev.yml     # 开发环境配置
│   │       └── application-prod.yml    # 生产环境配置
│   └── test/                   # 测试代码目录
├── .gitignore
├── pom.xml                     # Maven配置文件
└── README.md
```

## 各模块功能说明

1. **通用组件 (common)**
   - 提供统一的返回结果类和错误码定义

2. **配置类 (config)**
   - 各种配置类，包括安全配置、数据库配置、Redis配置、MinIO配置等

3. **控制器层 (controller)**
   - 处理HTTP请求，调用服务层

4. **异常处理 (exception)**
   - 业务异常类和全局异常处理器

5. **Mapper层 (mapper)**
   - 数据访问接口，与MyBatis XML映射文件配合使用

6. **模型层 (model)**
   - DTO: 数据传输对象，用于接收前端数据
   - Entity: 实体类，对应数据库表
   - VO: 视图对象，用于返回给前端

7. **安全模块 (security)**
   - JWT认证相关组件

8. **服务层 (service)**
   - 业务逻辑实现

9. **工具类 (utils)**
   - 各种辅助工具类