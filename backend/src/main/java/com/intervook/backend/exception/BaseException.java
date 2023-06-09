package com.intervook.backend.exception;

import org.springframework.http.HttpStatus;

public abstract class BaseException extends RuntimeException {
    public abstract HttpStatus getStatus();

    public abstract String getErrorDescription();

    BaseException(String message) {
        super(message);
    }
}
