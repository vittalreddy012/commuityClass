package com.ts.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Vector;

import com.ts.model.User;

public interface UserService {
	public List<Object[]> getUserInfo(User user) throws NoSuchAlgorithmException ;
	public String getChangePwdStatus(User form) throws NoSuchAlgorithmException;;
	Vector getUserServiceDetails(String roleId);
}
