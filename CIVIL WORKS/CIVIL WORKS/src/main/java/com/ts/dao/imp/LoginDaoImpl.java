package com.ts.dao.imp;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.persistence.EntityManager;

import org.apache.axis.encoding.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ts.dao.LoginDao;
import com.ts.model.User;

@Component
public class LoginDaoImpl implements LoginDao {

	@Autowired
	 private EntityManager em;
	
	@Override
	public List<Object[]> getUserInfoDetails(User user) throws NoSuchAlgorithmException {
		
		String password1 = null;
		String userEncPwd = null;

		password1 = user.getPassword().substring(5, user.getPassword().length() - 5);
		userEncPwd = passwordEncrypt(password1);
		List<Object[]> res= em.createNamedStoredProcedureQuery("getLoginDetails")
				.setParameter("userName", user.getUsername())
				.setParameter("Encpassword", userEncPwd)
				.getResultList();
			return res;
	}
	
	@Override
	public String getChangePwdStatus(User form) throws NoSuchAlgorithmException {
		
		String status="";
		String oldpassword1 = null,oldEncrypt=null;
		String newpassword1 = null,newEncrypt=null;
		String confirmpassword1 = null,confirmEncrypt=null;
		
		oldpassword1 = form.getEncryptedPassword().substring(5, form.getEncryptedPassword().length() - 5);
		oldEncrypt = passwordEncrypt(oldpassword1);
		
		newpassword1 = form.getNewEncryptedPwd().substring(5, form.getNewEncryptedPwd().length() - 5);
		newEncrypt = passwordEncrypt(newpassword1);
		
		confirmpassword1 = form.getConfirmPwd().substring(5, form.getConfirmPwd().length() - 5);
		confirmEncrypt = passwordEncrypt(confirmpassword1);
		// System.out.println("form.getUsername()=="+form.getUsername());
		//System.out.println("oldEncrypt=="+oldEncrypt);
		// System.out.println("newEncrypt=="+newEncrypt);
		// System.out.println("form.getPassword()=="+form.getPassword());
		if(newEncrypt.equalsIgnoreCase(confirmEncrypt)) {
		status=  (String)em.createNamedStoredProcedureQuery("changePassword")
				.setParameter("username", form.getUsername())
				.setParameter("password", form.getPassword())
				.setParameter("encryptedpassword", oldEncrypt)
				.setParameter("newencryptedpassword", newEncrypt)
				.getOutputParameterValue("status"); 
		 
		 }else {
			 status="Please Match New PassWord and Confirm Password";
		    	 }
	//	System.out.println("status==="+status);	
			return status;
	}
	@Override
	public List<Object[]> getUserServiceDetails(String roleId) {
		List<Object[]> res= em.createNamedStoredProcedureQuery("getServiceDetails")
				.setParameter("RoleId", roleId)
				.getResultList();
				return res;
	}
	
	//Encrpted Password
	public String passwordEncrypt(String password) throws NoSuchAlgorithmException {
		String sr = null;
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] dataBytes = password.getBytes();
		md.update(dataBytes);
		byte[] mdbytes = md.digest();
		// convert the byte to hex format method 1
		StringBuffer sb = new StringBuffer();
		for (int j = 0; j < mdbytes.length; j++) {
			sb.append(Integer.toString((mdbytes[j] & 0xff) + 0x100, 16).substring(1));
		}
		sr = sb.toString();
		return sr;
	} 

	
	public static String StringEncrypt(String s) throws Exception {
		byte[] encodeValue = s.getBytes();
		String encodedURL = Base64.encode(encodeValue);
		return encodedURL;
	}

	public static String StringDecrypt(String s) throws Exception {
		byte[] decodedURLBytes = Base64.decode(s);
		String actualURL = new String(decodedURLBytes);
		return actualURL;
	}

	

}
