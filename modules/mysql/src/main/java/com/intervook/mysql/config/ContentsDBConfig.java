package com.intervook.mysql.config;

import com.zaxxer.hikari.HikariDataSource;
import org.hibernate.boot.model.naming.CamelCaseToUnderscoresNamingStrategy;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.boot.orm.jpa.hibernate.SpringImplicitNamingStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "contentsEntityManagerFactory",
        transactionManagerRef = "contentsTransactionManager",
        basePackages = {"com.intervook.mysql.repository.contents"}
)
public class ContentsDBConfig {

    @Primary
    @Bean("contentsDataSource")
    public DataSource contentsDatasource(
            @Value("${spring.datasource.contents.driver-class-name}") String driverClassName,
            @Value("${spring.datasource.contents.url}") String dataSourceUrl,
            @Value("${spring.datasource.contents.username}") String username,
            @Value("${spring.datasource.contents.password}") String password) {
        HikariDataSource dataSource = DataSourceBuilder.create().type(HikariDataSource.class)
                .driverClassName(driverClassName)
                .url(dataSourceUrl)
                .username(username)
                .password(password)
                .build();

        dataSource.setPoolName("contents-pool");
        dataSource.setConnectionInitSql("SET NAMES utf8mb4");
        return dataSource;
    }

    private Map<String, Object> jpaProperties() {
        return new HashMap<>() {{
            put("hibernate.physical_naming_strategy", CamelCaseToUnderscoresNamingStrategy.class.getName());
            put("hibernate.implicit_naming_strategy", SpringImplicitNamingStrategy.class.getName());
        }};
    }


    @Primary
    @Bean("contentsEntityManagerFactory")
    public LocalContainerEntityManagerFactoryBean contentsEntityManagerFactory(
            EntityManagerFactoryBuilder builder,
            @Qualifier("contentsDataSource") DataSource contentsDataSource) {
        return builder
                .dataSource(contentsDataSource)
                .packages("com.intervook.mysql.entity.contents")
                .persistenceUnit("contents")
                .properties(jpaProperties())
                .build();
    }

    @Primary
    @Bean("contentsTransactionManager")
    public JpaTransactionManager contentsTransactionManager(
            @Qualifier("contentsEntityManagerFactory") LocalContainerEntityManagerFactoryBean contentsEntityManagerFactory) {
        return new JpaTransactionManager(Objects.requireNonNull(contentsEntityManagerFactory.getObject()));
    }
}

