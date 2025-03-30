package org.hz.backend.common;

import lombok.Getter;

/**
 * 响应状态码枚举
 */
@Getter
public enum ResultCode {

    // 成功
    SUCCESS(200, "操作成功"),
    
    // 失败
    FAIL(400, "操作失败"),
    
    // 未认证
    UNAUTHORIZED(401, "未认证或认证失败"),
    
    // 无权限
    FORBIDDEN(403, "无权限访问"),
    
    // 资源不存在
    NOT_FOUND(404, "资源不存在"),
    
    // 参数校验失败
    VALIDATE_FAILED(405, "参数检验失败"),
    
    // 服务器内部错误
    INTERNAL_SERVER_ERROR(500, "服务器内部错误"),
    
    // 用户相关
    USER_NOT_FOUND(1001, "用户不存在"),
    USER_ACCOUNT_EXPIRED(1002, "账户已过期"),
    USER_CREDENTIALS_ERROR(1003, "用户名或密码错误"),
    USER_CREDENTIALS_EXPIRED(1004, "密码已过期"),
    USER_ACCOUNT_DISABLE(1005, "账户已被禁用"),
    USER_ACCOUNT_LOCKED(1006, "账户已被锁定"),
    USER_ACCOUNT_NOT_EXIST(1007, "账户不存在"),
    USER_ACCOUNT_ALREADY_EXIST(1008, "账户已存在"),
    USER_ACCOUNT_USE_BY_OTHERS(1009, "账户下线，已被他人登录"),
    
    // 业务相关
    STUDENT_NOT_FOUND(2001, "没有该学号，查找学生失败"),
    STUDENT_ALREADY_EXISTS(2002, "学生已存在"),
    TEACHER_NOT_FOUND(2003, "教师不存在"),
    TEACHER_ALREADY_EXISTS(2004, "教师已存在"),
    COURSE_NOT_FOUND(2005, "课程不存在"),
    COURSE_ALREADY_EXISTS(2006, "课程已存在"),
    COURSE_SELECTION_FAILED(2007, "选课失败"),
    COURSE_SELECTION_ALREADY_EXISTS(2008, "已经选过此课程"),
    SCORE_NOT_FOUND(2009, "成绩不存在"),
    
    // 文件相关
    FILE_UPLOAD_FAILED(3001, "文件上传失败"),
    FILE_DOWNLOAD_FAILED(3002, "文件下载失败"),
    FILE_NOT_FOUND(3003, "文件不存在");

    private final Integer code;
    private final String message;

    ResultCode(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}