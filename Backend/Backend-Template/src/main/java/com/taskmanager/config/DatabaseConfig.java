package com.taskmanager.config;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.net.URI;
import java.net.URISyntaxException;

@Configuration
public class DatabaseConfig {

    @Bean
    @Primary
    public DataSource dataSource() {
        String databaseUrl = System.getenv("DATABASE_URL");
        
        if (databaseUrl != null && !databaseUrl.isEmpty()) {
            // Render provides DATABASE_URL in format: postgresql://user:password@host:port/database
            // We need to convert it to JDBC format: jdbc:postgresql://host:port/database
            try {
                URI dbUri = new URI(databaseUrl);
                String username = dbUri.getUserInfo().split(":")[0];
                String password = dbUri.getUserInfo().split(":")[1];
                String jdbcUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

                return DataSourceBuilder
                        .create()
                        .url(jdbcUrl)
                        .username(username)
                        .password(password)
                        .driverClassName("org.postgresql.Driver")
                        .build();
            } catch (URISyntaxException e) {
                throw new RuntimeException("Invalid DATABASE_URL format", e);
            }
        }
        
        // Fallback to Spring Boot's default DataSource configuration
        // This will use spring.datasource.* properties from application.properties
        return DataSourceBuilder
                .create()
                .url(System.getenv().getOrDefault("SPRING_DATASOURCE_URL", "jdbc:postgresql://localhost:5432/taskmanager"))
                .username(System.getenv().getOrDefault("SPRING_DATASOURCE_USERNAME", "postgres"))
                .password(System.getenv().getOrDefault("SPRING_DATASOURCE_PASSWORD", "postgres"))
                .driverClassName("org.postgresql.Driver")
                .build();
    }
}
