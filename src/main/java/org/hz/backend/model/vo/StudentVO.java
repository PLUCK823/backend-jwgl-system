package org.hz.backend.model.vo;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 学生视图对象
 */
@Data
public class StudentVO {

    /**
     * 学生ID
     */
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 学号
     */
    private String studentNo;

    /**
     * 姓名
     */
    private String name;

    /**
     * 性别
     */
    private String gender;

    /**
     * 入学日期
     */
    private LocalDate admissionDate;

    /**
     * 毕业日期
     */
    private LocalDate graduationDate;

    /**
     * 学院
     */
    private String college;

    /**
     * 专业
     */
    private String major;

    /**
     * 班级
     */
    private String className;

    /**
     * 学历层次
     */
    private String educationLevel;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 学籍状态：1-在读，2-休学，3-退学，4-毕业
     */
    private Integer status;

    /**
     * 学籍状态名称
     */
    private String statusName;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}