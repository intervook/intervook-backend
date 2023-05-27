package com.intervook.backend.exception;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.intervook.backend.model.dto.BaseResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.NoHandlerFoundException;

@Slf4j
@RestControllerAdvice
public class BaseExceptionHandler {
    @ExceptionHandler({HttpMessageNotReadableException.class})
    public BaseResponse requestBodyIsWrong(HttpMessageNotReadableException e) {
        log.error("[requestBodyIsWrong]", e);
        Throwable throwable = e.getMostSpecificCause();
        if (throwable instanceof InvalidFormatException) {
            return BaseResponse.exception(CommonException.INVALID_PARAMETER);
        } else {
            return BaseResponse.exception(CommonException.MISSING_PARAMETER);
        }
    }

    @ExceptionHandler({MissingServletRequestParameterException.class})
    public BaseResponse missingParameters(MissingServletRequestParameterException e) {
        log.error("[missingParameters]", e);
        return BaseResponse.exception(CommonException.MISSING_PARAMETER);
    }

    @ExceptionHandler({MethodArgumentNotValidException.class, MultipartException.class, MethodArgumentTypeMismatchException.class})
    public BaseResponse invalidParameter(Exception e) {
        log.error("[invalidParameter]: {}", e.getMessage());
        return BaseResponse.exception(CommonException.INVALID_PARAMETER);
    }

    @ExceptionHandler({BaseException.class})
    public BaseResponse customExceptionHandler(BaseException baseException) {
        log.error(baseException.getErrorDescription(), baseException);
        return BaseResponse.exception(baseException);
    }

    @ExceptionHandler({NoHandlerFoundException.class, HttpRequestMethodNotSupportedException.class})
    public BaseResponse noHandlerFoundException(Exception e) {
        log.error("[noHandlerFoundException]", e);
        return BaseResponse.exception(CommonException.PAGE_NOT_FOUND);
    }

    @ExceptionHandler({AuthenticationException.class, AccessDeniedException.class})
    public BaseResponse wrongAccessExceptionHandler(Exception e) {
        log.error("[wrongAccessExceptionHandler]", e);
        return BaseResponse.exception(CommonException.UNAUTHORIZED);
    }

    @ExceptionHandler({Exception.class})
    public BaseResponse exceptionHandler(Exception e) {
        log.error(e.getMessage(), e);
        return BaseResponse.exception(CommonException.SERVER_ERROR);
    }
}
