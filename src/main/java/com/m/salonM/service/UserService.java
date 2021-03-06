package com.m.salonM.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.m.salonM.model.RoleType;
import com.m.salonM.model.User;
import com.m.salonM.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public void join(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole(RoleType.USER);
		userRepository.save(user);
	}
	
	@Transactional
	public void update(User user) {
		User persistance = userRepository.findById(user.getId())
				.orElseThrow(()->{
				return new IllegalArgumentException("회원 찾기 실패");
				});
		if(persistance.getOauth()==null||persistance.getOauth().equals("")) {
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			persistance.setPassword(encPassword);
			persistance.setEmail(user.getEmail());
		}
	}
	
	@Transactional(readOnly=true)
	public List<User> userList(){
		return userRepository.findAll();
	}
}
