package org.hz.backend.common;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 统一返回结果类
 */
@Data
@NoArgsConstructor
public class Result<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 状态码
     */
    private Integer code;

    /**
     * 消息
     */
    private String message;

    /**
     * 数据
     */
    private T data;

    /**
     * 构造方法
     *
     * @param code    状态码
     * @param message 消息
     * @param data    数据
     */
    public Result(Integer code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /**
     * 构造方法
     *
     * @param code    状态码
     * @param message 消息
     */
    public Result(Integer code, String message) {
        this(code, message, null);
    }

    /**
     * 构造方法
     *
     * @param resultCode 结果状态码枚举
     * @param data       数据
     */
    public Result(ResultCode resultCode, T data) {
        this(resultCode.getCode(), resultCode.getMessage(), data);
    }

    /**
     * 构造方法
     *
     * @param resultCode 结果状态码枚举
     */
    public Result(ResultCode resultCode) {
        this(resultCode.getCode(), resultCode.getMessage());
    }

    /**
     * 成功返回结果
     * 
     * @param data 数据
     * @param <T>  泛型
     * @return 成功结果
     */
    public static <T> Result<T> success(T data) {
        return new Result<>(ResultCode.SUCCESS, data);
    }

    /**
     * 成功返回结果
     *
     * @param <T> 泛型
     * @return 成功结果
     */
    public static <T> Result<T> success() {
        return new Result<>(ResultCode.SUCCESS);
    }

    /**
     * 失败返回结果
     *
     * @param resultCode 结果状态码枚举
     * @param <T>        泛型
     * @return 失败结果
     */
    public static <T> Result<T> fail(ResultCode resultCode) {
        return new Result<>(resultCode);
    }

    /**
     * 失败返回结果
     *
     * @param resultCode 结果状态码枚举
     * @param message    自定义消息
     * @param <T>        泛型
     * @return 失败结果
     */
    public static <T> Result<T> fail(ResultCode resultCode, String message) {
        return new Result<>(resultCode.getCode(), message);
    }

    /**
     * 失败返回结果
     *
     * @param code    状态码
     * @param message 消息
     * @param <T>     泛型
     * @return 失败结果
     */
    public static <T> Result<T> fail(Integer code, String message) {
        return new Result<>(code, message);
    }

    /**
     * 失败返回结果
     *
     * @param message 消息
     * @param <T>     泛型
     * @return 失败结果
     */
    public static <T> Result<T> fail(String message) {
        return new Result<>(ResultCode.OPERATION_FAILED.getCode(), message);
    }

    /**
     * 失败返回结果
     *
     * @param <T> 泛型
     * @return 失败结果
     */
    public static <T> Result<T> fail() {
        return new Result<>(ResultCode.OPERATION_FAILED);
    }
}