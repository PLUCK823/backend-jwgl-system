package org.hz.backend.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.time.LocalDate;

/**
 * 学生数据传输对象
 */
@Data
public class StudentDTO {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 学号
     */
    @NotBlank(message = "学号不能为空")
    private String studentNo;

    /**
     * 入学日期
     */
    @NotNull(message = "入学日期不能为空")
    @Past(message = "入学日期必须是过去的日期")
    private LocalDate admissionDate;

    /**
     * 毕业日期
     */
    private LocalDate graduationDate;

    /**
     * 学院
     */
    @NotBlank(message = "学院不能为空")
    private String college;

    /**
     * 专业
     */
    @NotBlank(message = "专业不能为空")
    private String major;

    /**
     * 班级
     */
    @NotBlank(message = "班级不能为空")
    private String className;

    /**
     * 学历层次
     */
    private String educationLevel;

    /**
     * 学籍状态：1-在读，2-休学，3-退学，4-毕业
     */
    private Integer status;
}