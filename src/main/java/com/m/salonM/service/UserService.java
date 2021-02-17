package com.m.salonM.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m.salonM.model.RoleType;
import com.m.salonM.model.User;
import com.m.salonM.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public void join(User user) {
		user.setRole(RoleType.USER);
		userRepository.save(user);
	}
}
