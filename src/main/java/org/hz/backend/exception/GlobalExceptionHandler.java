package org.hz.backend.exception;

import lombok.extern.slf4j.Slf4j;
import org.hz.backend.common.Result;
import org.hz.backend.common.ResultCode;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 处理自定义业务异常
     */
    @ExceptionHandler(BusinessException.class)
    public Result<Void> handleBusinessException(BusinessException e) {
        log.error("业务异常: {}", e.getMessage(), e);
        return Result.fail(e.getCode(), e.getMessage());
    }

    /**
     * 处理参数校验异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result<Void> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        BindingResult bindingResult = e.getBindingResult();
        StringBuilder sb = new StringBuilder("参数校验失败:");
        for (FieldError fieldError : bindingResult.getFieldErrors()) {
            sb.append(" [").append(fieldError.getField()).append(": ").append(fieldError.getDefaultMessage()).append("] ");
        }
        log.error("参数校验异常: {}", sb.toString(), e);
        return Result.fail(ResultCode.VALIDATE_FAILED, sb.toString());
    }

    /**
     * 处理绑定异常
     */
    @ExceptionHandler(BindException.class)
    public Result<Void> handleBindException(BindException e) {
        BindingResult bindingResult = e.getBindingResult();
        StringBuilder sb = new StringBuilder("参数绑定失败:");
        for (FieldError fieldError : bindingResult.getFieldErrors()) {
            sb.append(" [").append(fieldError.getField()).append(": ").append(fieldError.getDefaultMessage()).append("] ");
        }
        log.error("参数绑定异常: {}", sb.toString(), e);
        return Result.fail(ResultCode.VALIDATE_FAILED, sb.toString());
    }

    /**
     * 处理其他异常
     */
    @ExceptionHandler(Exception.class)
    public Result<Void> handleException(Exception e) {
        log.error("未知异常: {}", e.getMessage(), e);
        return Result.fail(ResultCode.INTERNAL_SERVER_ERROR, "服务器内部错误，请联系管理员");
    }
}