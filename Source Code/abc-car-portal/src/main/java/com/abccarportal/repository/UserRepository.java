package com.abccarportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abccarportal.model.User;

public interface UserRepository extends JpaRepository<User, Long>{

	User findByUserName(String name);
	
	
}
