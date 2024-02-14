package com.abccarportal.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.abccarportal.model.User;
import com.abccarportal.repository.RoleRepository;
import com.abccarportal.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public String save(User user) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		
		userRepository.save(user);
		
		return "User saved successfully";
	}
	
	public User findLoginUser(String username) {
	
		return userRepository.findByUserName(username);
		
	}
	
	public List<User> showAllUser(){
		
		return userRepository.findAll();
	}
	
	public void update(User user) {
		
		userRepository.save(user);
		
	}
	
	public Optional<User> getUserInfo(long uid){
		
		return userRepository.findById(uid);
		
	}
	
	public void deleteUser(long uid) {
		
		userRepository.deleteById(uid);
	}
	
	public void assignNewRole(User user, String role) {
		
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles(role)));
		userRepository.save(user);
	}

}
