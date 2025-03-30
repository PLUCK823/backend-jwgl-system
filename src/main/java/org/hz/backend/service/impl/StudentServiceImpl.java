package org.hz.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.hz.backend.common.ResultCode;
import org.hz.backend.exception.BusinessException;
import org.hz.backend.mapper.StudentMapper;
import org.hz.backend.model.dto.StudentDTO;
import org.hz.backend.model.entity.Student;
import org.hz.backend.model.vo.StudentVO;
import org.hz.backend.service.StudentService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 学生服务实现类
 */
@Service
@RequiredArgsConstructor
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

    /**
     * 添加学生
     *
     * @param studentDTO 学生DTO
     * @return 是否成功
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean addStudent(StudentDTO studentDTO) {
        // 检查学号是否已存在
        LambdaQueryWrapper<Student> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Student::getStudentNo, studentDTO.getStudentNo());
        if (baseMapper.selectCount(queryWrapper) > 0) {
            throw new BusinessException(ResultCode.STUDENT_ALREADY_EXISTS);
        }

        // 转换DTO为实体并保存
        Student student = new Student();
        BeanUtils.copyProperties(studentDTO, student);
        return save(student);
    }

    /**
     * 修改学生
     *
     * @param id 学生ID
     * @param studentDTO 学生DTO
     * @return 是否成功
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateStudent(Long id, StudentDTO studentDTO) {
        // 检查学生是否存在
        Student student = getById(id);
        if (student == null) {
            throw new BusinessException(ResultCode.STUDENT_NOT_FOUND);
        }

        // 检查学号是否已被其他学生使用
        if (!student.getStudentNo().equals(studentDTO.getStudentNo())) {
            LambdaQueryWrapper<Student> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Student::getStudentNo, studentDTO.getStudentNo());
            if (baseMapper.selectCount(queryWrapper) > 0) {
                throw new BusinessException(ResultCode.STUDENT_ALREADY_EXISTS);
            }
        }

        // 更新学生信息
        BeanUtils.copyProperties(studentDTO, student);
        return updateById(student);
    }

    /**
     * 删除学生
     *
     * @param id 学生ID
     * @return 是否成功
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteStudent(Long id) {
        // 检查学生是否存在
        if (getById(id) == null) {
            throw new BusinessException(ResultCode.STUDENT_NOT_FOUND);
        }
        return removeById(id);
    }

    /**
     * 根据ID获取学生详情
     *
     * @param id 学生ID
     * @return 学生视图对象
     */
    @Override
    public StudentVO getStudentById(Long id) {
        StudentVO studentVO = baseMapper.getStudentDetails(id);
        if (studentVO == null) {
            throw new BusinessException(ResultCode.STUDENT_NOT_FOUND);
        }
        return studentVO;
    }

    /**
     * 根据学号获取学生
     *
     * @param studentNo 学号
     * @return 学生视图对象
     */
    @Override
    public StudentVO getStudentByStudentNo(String studentNo) {
        LambdaQueryWrapper<Student> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Student::getStudentNo, studentNo);
        Student student = baseMapper.selectOne(queryWrapper);
        if (student == null) {
            throw new BusinessException(ResultCode.STUDENT_NOT_FOUND);
        }
        return getStudentById(student.getId());
    }

    /**
     * 分页查询学生列表
     *
     * @param page 分页对象
     * @param studentNo 学号
     * @param name 姓名
     * @param className 班级
     * @return 分页结果
     */
    @Override
    public IPage<StudentVO> pageStudentList(Page<StudentVO> page, String studentNo, String name, String className) {
        return baseMapper.pageStudentList(page, studentNo, name, className);
    }
}