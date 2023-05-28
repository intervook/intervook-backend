package com.intervook.mysql.config;

import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class QueryDslConfig {

    @PersistenceContext(unitName = "contentsEntityManagerFactory")
    private EntityManager contentsEntityManager;

    @Bean("contentsQueryFactory")
    public JPAQueryFactory contentsQueryFactory() {
        return new JPAQueryFactory(contentsEntityManager);
    }

}
