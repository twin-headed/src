package com.boot.mongoDBboard.config;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoConfiguration;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;

@Configuration
public class MongoConfig extends AbstractMongoConfiguration{
	
	// application.properties 속성 가져오기
	@Value("${spring.data.mongodb.username}")
	private String userName;
	@Value("${spring.data.mongodb.password}")
	private String password;
	@Value("${spring.data.mongodb.database}")
	private String database;
	
	// @Bean => <bean> ~ </bean>
	@Override
	public @Bean MongoTemplate mongoTemplate() throws Exception {
		return new MongoTemplate(mongoClient(), database);
	}
	
	// credential : 인증정보
	@Override
	public MongoClient mongoClient() {
		MongoCredential credential = MongoCredential.createCredential(userName, database, password.toCharArray());
		return new MongoClient(new ServerAddress("localhost", 27017), Arrays.asList(credential));
	}
	
	@Override
	protected String getDatabaseName() {
		return database; 
	}
	
}
