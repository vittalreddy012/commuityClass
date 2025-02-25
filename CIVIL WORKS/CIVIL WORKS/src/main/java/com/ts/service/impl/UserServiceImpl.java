package com.ts.service.impl;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.dao.LoginDao;
import com.ts.model.User;
import com.ts.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private LoginDao userDao;

	public List<Object[]> getUserInfo(User user) throws NoSuchAlgorithmException  {
		List<Object[]> res = userDao.getUserInfoDetails(user);

		return res;
	}

	public Vector getUserServiceDetails(String roleId) {
		List<Object[]> res = userDao.getUserServiceDetails(roleId);
		Vector services=new Vector();
		for(Object[] result:res){
			String servicedesc[] = new String[5];
            servicedesc[0] = result[0].toString();
            servicedesc[1] = result[1].toString();
            servicedesc[2] = result[2].toString();
            servicedesc[3] = result[3].toString();
            services.addElement(servicedesc);
			
		}
		
		return services;
	}

	@Override
	public String getChangePwdStatus(User form) throws NoSuchAlgorithmException{
		return userDao.getChangePwdStatus(form);
	}
}
