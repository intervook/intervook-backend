package com.intervook.mysql.config;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

@Component
@RequiredArgsConstructor
public class FlywayConfig {
    @Qualifier("authDataSource")
    private final DataSource authDataSource;
    @Qualifier("contentsDataSource")
    private final DataSource contentsDataSource;

    @PostConstruct
    public void init() {
        flywayMigrate(authDataSource, "db/migration/auth");
        flywayMigrate(contentsDataSource, "db/migration/contents");
    }

    private void flywayMigrate(DataSource datasource, String scriptLocation) {
        Flyway.configure()
                .baselineOnMigrate(true)
                .dataSource(datasource)
                .locations(scriptLocation)
                .load()
                .migrate();
    }
}
