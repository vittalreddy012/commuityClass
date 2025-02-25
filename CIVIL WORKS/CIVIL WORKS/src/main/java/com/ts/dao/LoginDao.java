package com.ts.dao;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.ts.model.User;


public interface LoginDao {
	 List<Object[]> getUserInfoDetails(User user)throws NoSuchAlgorithmException ;
	List<Object[]> getUserServiceDetails(String roleId);
	String getChangePwdStatus(User form) throws NoSuchAlgorithmException;
}
