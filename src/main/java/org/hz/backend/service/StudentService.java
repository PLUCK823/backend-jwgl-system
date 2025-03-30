package org.hz.backend.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.hz.backend.model.dto.StudentDTO;
import org.hz.backend.model.entity.Student;
import org.hz.backend.model.vo.StudentVO;

/**
 * 学生服务接口
 */
public interface StudentService extends IService<Student> {

    /**
     * 添加学生
     *
     * @param studentDTO 学生DTO
     * @return 是否成功
     */
    boolean addStudent(StudentDTO studentDTO);

    /**
     * 修改学生
     *
     * @param id 学生ID
     * @param studentDTO 学生DTO
     * @return 是否成功
     */
    boolean updateStudent(Long id, StudentDTO studentDTO);

    /**
     * 删除学生
     *
     * @param id 学生ID
     * @return 是否成功
     */
    boolean deleteStudent(Long id);

    /**
     * 根据ID获取学生详情
     *
     * @param id 学生ID
     * @return 学生视图对象
     */
    StudentVO getStudentById(Long id);

    /**
     * 根据学号获取学生
     *
     * @param studentNo 学号
     * @return 学生视图对象
     */
    StudentVO getStudentByStudentNo(String studentNo);

    /**
     * 分页查询学生列表
     *
     * @param page 分页对象
     * @param studentNo 学号
     * @param name 姓名
     * @param className 班级
     * @return 分页结果
     */
    IPage<StudentVO> pageStudentList(Page<StudentVO> page, String studentNo, String name, String className);
}