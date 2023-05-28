package com.intervook.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;

@SpringBootApplication(exclude = {ErrorMvcAutoConfiguration.class}, scanBasePackages = "com.intervook")
public class InterVookBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(InterVookBackendApplication.class, args);
    }

}
