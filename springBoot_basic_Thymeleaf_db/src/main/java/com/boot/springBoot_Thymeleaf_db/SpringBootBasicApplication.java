package com.boot.springBoot_Thymeleaf_db;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication
public class SpringBootBasicApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootBasicApplication.class, args);
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();s
		bean.setDataSource(dataSource);	// 데이터소스 설정
		
		// xml mapper를 사용할 경우 아래 코드 2줄 추가
		// import org.springframework.core.io.Resource;
		// import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
		bean.setMapperLocation(res);
		
		return bean.getObject();
	}

	private SqlSessionTemplate setDataSource(SqlSessionFactory factory) {
		return new SqlSessionTemplate(factory);
	}
	
}
