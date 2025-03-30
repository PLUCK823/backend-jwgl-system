package org.hz.backend.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 学生信息实体类
 */
@Data
@TableName("student")
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 学生ID
     */
    @TableId(value = "id", type = IdType.AUTO)
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
     * 学籍状态：1-在读，2-休学，3-退学，4-毕业
     */
    private Integer status;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}