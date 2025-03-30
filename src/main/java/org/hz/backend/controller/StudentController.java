package org.hz.backend.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.hz.backend.common.Result;
import org.hz.backend.model.dto.StudentDTO;
import org.hz.backend.model.vo.StudentVO;
import org.hz.backend.service.StudentService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 学生控制器
 */
@RestController
@RequestMapping("/students")
@RequiredArgsConstructor
@Tag(name = "学生管理", description = "学生信息管理相关接口")
public class StudentController {

    private final StudentService studentService;

    /**
     * 添加学生
     *
     * @param studentDTO 学生DTO
     * @return 操作结果
     */
    @PostMapping
    @Operation(summary = "添加学生", description = "添加新的学生信息")
    public Result<Boolean> addStudent(@Validated @RequestBody StudentDTO studentDTO) {
        boolean result = studentService.addStudent(studentDTO);
        return Result.success("添加学生成功", result);
    }

    /**
     * 修改学生
     *
     * @param id 学生ID
     * @param studentDTO 学生DTO
     * @return 操作结果
     */
    @PutMapping("/{id}")
    @Operation(summary = "修改学生", description = "根据ID修改学生信息")
    public Result<Boolean> updateStudent(@Parameter(description = "学生ID") @PathVariable Long id,
                                     @Validated @RequestBody StudentDTO studentDTO) {
        boolean result = studentService.updateStudent(id, studentDTO);
        return Result.success("修改学生成功", result);
    }

    /**
     * 删除学生
     *
     * @param id 学生ID
     * @return 操作结果
     */
    @DeleteMapping("/{id}")
    @Operation(summary = "删除学生", description = "根据ID删除学生信息")
    public Result<Boolean> deleteStudent(@Parameter(description = "学生ID") @PathVariable Long id) {
        boolean result = studentService.deleteStudent(id);
        return Result.success("删除学生成功", result);
    }

    /**
     * 获取学生详情
     *
     * @param id 学生ID
     * @return 学生详情
     */
    @GetMapping("/{id}")
    @Operation(summary = "获取学生详情", description = "根据ID获取学生详细信息")
    public Result<StudentVO> getStudentById(@Parameter(description = "学生ID") @PathVariable Long id) {
        StudentVO studentVO = studentService.getStudentById(id);
        return Result.success("查询学生成功", studentVO);
    }

    /**
     * 根据学号获取学生
     *
     * @param studentNo 学号
     * @return 学生详情
     */
    @GetMapping("/no/{studentNo}")
    @Operation(summary = "根据学号获取学生", description = "根据学号获取学生详细信息")
    public Result<StudentVO> getStudentByStudentNo(@Parameter(description = "学号") @PathVariable String studentNo) {
        StudentVO studentVO = studentService.getStudentByStudentNo(studentNo);
        return Result.success("查询学生成功", studentVO);
    }

    /**
     * 分页查询学生列表
     *
     * @param current 当前页
     * @param size 每页大小
     * @param studentNo 学号
     * @param name 姓名
     * @param className 班级
     * @return 分页结果
     */
    @GetMapping("/page")
    @Operation(summary = "分页查询学生列表", description = "分页查询学生列表，支持多条件筛选")
    public Result<IPage<StudentVO>> pageStudentList(
            @Parameter(description = "当前页") @RequestParam(defaultValue = "1") Integer current,
            @Parameter(description = "每页大小") @RequestParam(defaultValue = "10") Integer size,
            @Parameter(description = "学号") @RequestParam(required = false) String studentNo,
            @Parameter(description = "姓名") @RequestParam(required = false) String name,
            @Parameter(description = "班级") @RequestParam(required = false) String className) {
        Page<StudentVO> page = new Page<>(current, size);
        IPage<StudentVO> result = studentService.pageStudentList(page, studentNo, name, className);
        return Result.success("查询学生列表成功", result);
    }
}