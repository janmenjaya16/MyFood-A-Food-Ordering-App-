package com.jsp.hotelmanagementsystem.helper;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ConfigClass {
	@Bean
	public EntityManagerFactory getemf() {
		return Persistence.createEntityManagerFactory("sipun");

	}

	@Bean
	public EntityManager getem() {
		return getemf().createEntityManager();
	}

	@Bean
	public EntityTransaction getet() {
		return getem().getTransaction();
	}
}
