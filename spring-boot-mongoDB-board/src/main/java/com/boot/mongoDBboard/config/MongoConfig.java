package com.boot.mongoDBboard.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.data.mongodb.core.MongoTemplate;

public class MongoConfig extends AbstractMongoConfiguration{
	
	// application.properties 속성 가져오기
	@Value("${spring.data.mongodb.username")
	private String userName;
	@Value("${spring.data.mongodb.password")
	private String password;
	@Value("${spring.data.mongodb.database")
	private String database;
	
	// @Bean => <bean> ~ </bean>
	public @Bean MongoTemplate mongoTemplate() throws Exception {
		return new MongoTemplate(mongoClient(), database);
	}
	
	// credential : 인증정보
	@Override
	public MongoClient mongoClient() {
		MongoCredential 
	}
}
