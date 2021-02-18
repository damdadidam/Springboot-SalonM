package com.m.salonM.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.m.salonM.model.User;

public class PrincipalDetail implements UserDetails {
	private User user;

	public PrincipalDetail(User user) {
		this.user = user;
	}


	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
	// 계정이 갖고 있는 권한 목록을 리턴한다.(권한이 여러 개 있을 수 있어서 루프를 돌아야 하는데 우리는 한 개밖에 없어서)
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collectors = new ArrayList<>();
		collectors.add(()->{
			return "ROLE_"+user.getRole();
		});
		
		return collectors;
	}
	
	
}
