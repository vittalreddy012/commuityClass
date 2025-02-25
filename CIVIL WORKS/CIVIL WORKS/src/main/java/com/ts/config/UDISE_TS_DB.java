/*
 * package com.ts.config;
 * 
 * 
 * import java.util.HashMap;
 * 
 * import javax.persistence.EntityManagerFactory; import javax.sql.DataSource;
 * 
 * import org.springframework.beans.factory.annotation.Qualifier; import
 * org.springframework.boot.context.properties.ConfigurationProperties; import
 * org.springframework.boot.jdbc.DataSourceBuilder; import
 * org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.context.annotation.Primary; import
 * org.springframework.data.jpa.repository.config.EnableJpaRepositories; import
 * org.springframework.orm.jpa.JpaTransactionManager; import
 * org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean; import
 * org.springframework.transaction.PlatformTransactionManager; import
 * org.springframework.transaction.annotation.EnableTransactionManagement;
 * 
 * @Configuration
 * 
 * @EnableTransactionManagement
 * 
 * @EnableJpaRepositories( entityManagerFactoryRef = "entityManagerFactory",
 * transactionManagerRef = "transactionManager", basePackages =
 * "com.ts.udisets.repository" )
 * 
 * public class UDISE_TS_DB {
 * 
 * // public static final String PROPERTY_NAME_HIBERNATE_JDBC_BATCH_SIZE
 * ="hibernate.jdbc.batch_size"; // public static final String
 * PROPERTY_NAME_HIBERNATE_SHOW_SQL="hibernate.show_sql"; // public static final
 * String[] ENTITYMANAGER_PACKAGES_TO_SCAN = {"com.ts.udisets.model"}; // // //
 * public static final String DB_URL ="spring.datasource.url"; // public static
 * final String DB_USER ="spring.datasource.username"; // public static final
 * String DB_PASSWORD="spring.datasource.password"; // public static final
 * String DB_DRIVER ="spring.datasource.driverClassName"; //
 * 
 * @Primary
 * 
 * @Bean
 * 
 * @ConfigurationProperties(prefix="spring.dataSource") public DataSource
 * db1Datasource() {
 * 
 * return DataSourceBuilder.create().build(); } // Entity ManagerFactory
 * 
 * @Primary
 * 
 * @Bean(name="udiseDB") public LocalContainerEntityManagerFactoryBean
 * db1EntityManagerFactory(EntityManagerFactoryBuilder emfb)
 * 
 * { HashMap<String, Object> properties = new HashMap<>();
 * properties.put("spring.jpa.hibernate.ddl-auto", "update");
 * properties.put("spring.jpa.database-platform",
 * "org.hibernate.dialect.SQLServer2008Dialect");
 * 
 * return emfb .dataSource(db1Datasource()) .packages("com.ts.udisets.model")
 * .properties(properties) .persistenceUnit("db1") .build(); }
 * 
 * // TransactionManger
 * 
 * @Primary
 * 
 * @Bean public PlatformTransactionManager
 * db1TransactionManager(@Qualifier("db1EntityManagerFactory")
 * EntityManagerFactory entityManagerFactory) {
 * 
 * return new JpaTransactionManager(entityManagerFactory); }
 * 
 * }
 */