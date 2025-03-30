package org.hz.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.hz.backend.model.entity.Student;
import org.hz.backend.model.vo.StudentVO;

/**
 * 学生Mapper接口
 */
@Mapper
public interface StudentMapper extends BaseMapper<Student> {

    /**
     * 查询学生详细信息
     *
     * @param id 学生ID
     * @return 学生视图对象
     */
    StudentVO getStudentDetails(@Param("id") Long id);

    /**
     * 分页查询学生列表
     *
     * @param page 分页对象
     * @param studentNo 学号
     * @param name 姓名
     * @param className 班级
     * @return 分页结果
     */
    IPage<StudentVO> pageStudentList(Page<StudentVO> page, @Param("studentNo") String studentNo,
                                   @Param("name") String name, @Param("className") String className);
}