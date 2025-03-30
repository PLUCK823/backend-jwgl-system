package org.hz.backend.exception;

import lombok.Getter;
import org.hz.backend.common.ResultCode;

/**
 * 业务异常类
 */
@Getter
public class BusinessException extends RuntimeException {

    private final Integer code;

    /**
     * 从结果状态码构建业务异常
     *
     * @param resultCode 结果状态码
     */
    public BusinessException(ResultCode resultCode) {
        super(resultCode.getMessage());
        this.code = resultCode.getCode();
    }

    /**
     * 从结果状态码和自定义消息构建业务异常
     *
     * @param resultCode 结果状态码
     * @param message    自定义消息
     */
    public BusinessException(ResultCode resultCode, String message) {
        super(message);
        this.code = resultCode.getCode();
    }

    /**
     * 从代码和消息构建业务异常
     *
     * @param code    代码
     * @param message 消息
     */
    public BusinessException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}