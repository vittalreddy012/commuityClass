/*
 * package com.ts.config;
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
 * "com.ts.ismsts.repository" ) public class ISMS_DB {
 * 
 * @Primary
 * 
 * @Bean
 * 
 * @ConfigurationProperties(prefix="spring.dataSource2") public DataSource
 * db2Datasource() {
 * 
 * return DataSourceBuilder.create().build(); } // Entity ManagerFactory
 * 
 * @Primary
 * 
 * @Bean(name="ismsDB") public LocalContainerEntityManagerFactoryBean
 * db2EntityManagerFactory(EntityManagerFactoryBuilder emfb)
 * 
 * { HashMap<String, Object> properties = new HashMap<>();
 * properties.put("spring.jpa.hibernate.ddl-auto", "update");
 * properties.put("spring.jpa.database-platform",
 * "org.hibernate.dialect.SQLServer2008Dialect");
 * 
 * return emfb .dataSource(db2Datasource()) .packages("com.ts.isms.model")
 * .properties(properties) .persistenceUnit("db2") .build(); }
 * 
 * // TransactionManger
 * 
 * @Primary
 * 
 * @Bean public PlatformTransactionManager
 * db2TransactionManager(@Qualifier("db2EntityManagerFactory")
 * EntityManagerFactory entityManagerFactory) {
 * 
 * return new JpaTransactionManager(entityManagerFactory); }
 * 
 * 
 * }
 */