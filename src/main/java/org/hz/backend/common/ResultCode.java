package org.hz.backend.common;

import lombok.Getter;

/**
 * 统一结果状态码枚举
 * 状态码设计规则：
 * 1. 成功状态码：2xxxx
 * 2. 客户端错误：4xxxx
 * 3. 服务端错误：5xxxx
 * 4. 业务错误按模块分类：
 * - 用户模块：1xxxx
 * - 学生模块：2xxxx
 * - 教师模块：3xxxx
 * - 课程模块：4xxxx
 * - 班级模块：5xxxx
 * - 文件模块：6xxxx
 * - 系统模块：9xxxx
 */
@Getter
public enum ResultCode {

    // ========== 通用状态码 2xxxx ==========
    /**
     * 操作成功
     */
    SUCCESS(20000, "操作成功"),

    /**
     * 创建成功
     */
    CREATED(20001, "创建成功"),

    /**
     * 更新成功
     */
    UPDATED(20002, "更新成功"),

    /**
     * 删除成功
     */
    DELETED(20003, "删除成功"),

    /**
     * 查询成功
     */
    RETRIEVED(20004, "查询成功"),

    // ========== 客户端错误 4xxxx ==========
    /**
     * 请求参数错误
     */
    BAD_REQUEST(40000, "请求参数错误"),

    /**
     * 未授权
     */
    UNAUTHORIZED(40100, "未登录或登录已过期"),

    /**
     * 访问被拒绝
     */
    FORBIDDEN(40300, "无访问权限"),

    /**
     * 资源不存在
     */
    NOT_FOUND(40400, "资源不存在"),

    /**
     * 请求方法不支持
     */
    METHOD_NOT_ALLOWED(40500, "请求方法不支持"),

    /**
     * 请求的格式不正确
     */
    UNSUPPORTED_MEDIA_TYPE(41500, "请求的格式不正确"),

    // ========== 服务端错误 5xxxx ==========
    /**
     * 服务器内部错误
     */
    INTERNAL_SERVER_ERROR(50000, "服务器内部错误"),

    /**
     * 系统错误
     */
    SYSTEM_ERROR(50001, "系统错误"),

    /**
     * 操作失败
     */
    OPERATION_FAILED(50002, "操作失败"),

    /**
     * 数据库错误
     */
    DATABASE_ERROR(50100, "数据库操作错误"),

    // ========== 用户模块错误 1xxxx ==========
    /**
     * 用户名或密码错误
     */
    USER_LOGIN_ERROR(10001, "用户名或密码错误"),

    /**
     * 用户已存在
     */
    USER_ALREADY_EXISTS(10002, "用户已存在"),

    /**
     * 用户不存在
     */
    USER_NOT_FOUND(10003, "用户不存在"),

    /**
     * 用户已被禁用
     */
    USER_DISABLED(10004, "用户已被禁用"),

    /**
     * 验证码错误
     */
    CAPTCHA_ERROR(10005, "验证码错误"),

    /**
     * 验证码已过期
     */
    CAPTCHA_EXPIRED(10006, "验证码已过期"),

    /**
     * 旧密码错误
     */
    OLD_PASSWORD_ERROR(10007, "旧密码错误"),

    /**
     * 用户角色不存在
     */
    ROLE_NOT_FOUND(10100, "角色不存在"),

    // ========== 学生模块错误 2xxxx ==========
    /**
     * 学生不存在
     */
    STUDENT_NOT_FOUND(20001, "学生不存在"),

    /**
     * 学生已存在
     */
    STUDENT_ALREADY_EXISTS(20002, "学生已存在"),

    /**
     * 学号重复
     */
    STUDENT_ID_DUPLICATE(20003, "学号重复"),

    // ========== 教师模块错误 3xxxx ==========
    /**
     * 教师不存在
     */
    TEACHER_NOT_FOUND(30001, "教师不存在"),

    /**
     * 教师已存在
     */
    TEACHER_ALREADY_EXISTS(30002, "教师已存在"),

    // ========== 课程模块错误 4xxxx ==========
    /**
     * 课程不存在
     */
    COURSE_NOT_FOUND(40001, "课程不存在"),

    /**
     * 课程已存在
     */
    COURSE_ALREADY_EXISTS(40002, "课程已存在"),

    /**
     * 教学任务不存在
     */
    TEACHING_TASK_NOT_FOUND(40101, "教学任务不存在"),

    /**
     * 教学任务已存在
     */
    TEACHING_TASK_ALREADY_EXISTS(40102, "教学任务已存在"),

    /**
     * 教学任务状态错误
     */
    TEACHING_TASK_STATUS_ERROR(40103, "教学任务状态错误"),

    /**
     * 选课记录不存在
     */
    COURSE_SELECTION_NOT_FOUND(40201, "选课记录不存在"),

    /**
     * 已经选择过该课程
     */
    COURSE_ALREADY_SELECTED(40202, "已经选择过该课程"),

    /**
     * 课程时间冲突
     */
    COURSE_TIME_CONFLICT(40203, "课程时间冲突"),

    /**
     * 选课人数已满
     */
    COURSE_SELECTION_FULL(40204, "选课人数已满"),

    /**
     * 选课状态错误
     */
    COURSE_SELECTION_STATUS_ERROR(40205, "选课状态错误"),

    /**
     * 成绩记录不存在
     */
    SCORE_NOT_FOUND(40301, "成绩记录不存在"),

    // ========== 班级模块错误 5xxxx ==========
    /**
     * 班级不存在
     */
    CLASS_NOT_FOUND(50001, "班级不存在"),

    /**
     * 班级已存在
     */
    CLASS_ALREADY_EXISTS(50002, "班级已存在"),

    /**
     * 班级下存在学生，无法删除
     */
    CLASS_HAS_STUDENTS(50003, "班级下存在学生，无法删除"),

    // ========== 文件模块错误 6xxxx ==========
    /**
     * 文件上传失败
     */
    FILE_UPLOAD_FAILED(60001, "文件上传失败"),

    /**
     * 文件下载失败
     */
    FILE_DOWNLOAD_FAILED(60002, "文件下载失败"),

    /**
     * 文件不存在
     */
    FILE_NOT_FOUND(60003, "文件不存在"),

    /**
     * 文件类型不支持
     */
    FILE_TYPE_NOT_SUPPORTED(60004, "文件类型不支持"),

    /**
     * 文件过大
     */
    FILE_TOO_LARGE(60005, "文件过大"),

    // ========== 系统模块错误 9xxxx ==========
    /**
     * 系统维护中
     */
    SYSTEM_MAINTENANCE(90001, "系统维护中，请稍后再试"),

    /**
     * 接口限流
     */
    RATE_LIMIT_EXCEEDED(90002, "请求过于频繁，请稍后再试"),

    /**
     * 导入数据失败
     */
    IMPORT_ERROR(90101, "导入数据失败，请检查数据格式");

    /**
     * 状态码
     */
    private final Integer code;

    /**
     * 消息
     */
    private final String message;

    ResultCode(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}