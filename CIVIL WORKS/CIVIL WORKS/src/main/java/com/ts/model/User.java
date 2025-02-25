
package com.ts.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.SequenceGenerator;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@NamedStoredProcedureQueries(value = {

		@NamedStoredProcedureQuery(name = "getLoginDetails", procedureName = "cw_LOGIN_USER_AUTHENTICATE_DETAILS", parameters = {
				@StoredProcedureParameter(mode = ParameterMode.IN, name = "userName", type = String.class),
				@StoredProcedureParameter(mode = ParameterMode.IN, name = "Encpassword", type = String.class) }),
		
		@NamedStoredProcedureQuery(name = "changePassword", procedureName = "cw_changepassword", parameters = {
				@StoredProcedureParameter(mode = ParameterMode.IN, name = "username", type = String.class),
				@StoredProcedureParameter(mode = ParameterMode.IN, name = "password", type = String.class),
				@StoredProcedureParameter(mode = ParameterMode.IN, name = "encryptedpassword", type = String.class),
				@StoredProcedureParameter(mode = ParameterMode.IN, name = "newencryptedpassword", type = String.class),
			    @StoredProcedureParameter(mode = ParameterMode.OUT, name = "status", type = String.class) 
				}),
		
		
		@NamedStoredProcedureQuery(name = "getServiceDetails", procedureName = "userServices_get", parameters = {
				@StoredProcedureParameter(mode = ParameterMode.IN, name = "RoleId", type = String.class) }) })


@Entity
@Table(name = "LoginDetails")
public class User {

	// @GeneratedValue(strategy = GenerationType.SEQUENCE, generator =
	// "sequenceGenerator")
	// @SequenceGenerator(name = "sequenceGenerator")
	@Id
	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "roleid")
	private int roleId;

	@Column(name = "districtid")
	private String districtId;

	@Column(name = "modelschooldisrtictcode")
	private String ms;

	@Column(name = "tp_Name")
	private String tpName;

	@Column(name = "agencycode")
	private String agencyCode;

	@Column(name = "submissionid")
	private int submissionId;

	@Column(name = "Flag")
	private char flag;

	@Column(name = "status")
	private String status;

	@Column(name = "encryptedpassword")
	private String encryptedPassword;

	@Column(name = "employeename")
	private String employeeName;

	@Column(name = "empid")
	private String empid;

	@Column(name = "serviceid")
	private String serviceid;

	@Column(name = "departmentid")
	private String departmentid;

	@Column(name = "loginstatus")
	private String loginStatus;

	@Column(name = "loginflag")
	private String loginFlag;

	@Temporal(TemporalType.TIMESTAMP)

	@Column(name = "lastlogindate")
	private Date lastLoginDate;

	@Column(name = "loginotpflag")
	private String loginOtpFlag;

	@Column(name = "userstatus")
	private String userStatus;

	@Column(name = "loginstatus1")
	private byte LoginStatus1;

	@Column(name = "txtinput")
	private String txtInput;

	@Column(name = "txtcaptcha")
	private String txtCaptcha;

	@Column(name = "logincount")
	private int logincount;

	@Column(name = "mobile")
	private String mobile;

	@Column(name = "email")
	private String email;
	
	@Transient
	@Column(name = "confirmPwd")
	private String confirmPwd;
	
	@Transient
	@Column(name = "newEncryptedPwd")
	private String newEncryptedPwd;
	
	
	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
  public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public String getTpName() {
		return tpName;
	}

	public void setTpName(String tpName) {
		this.tpName = tpName;
	}

	public String getAgencyCode() {
		return agencyCode;
	}

	public void setAgencyCode(String agencyCode) {
		this.agencyCode = agencyCode;
	}

	public int getSubmissionId() {
		return submissionId;
	}

	public void setSubmissionId(int submissionId) {
		this.submissionId = submissionId;
	}

	public char getFlag() {
		return flag;
	}

	public void setFlag(char flag) {
		this.flag = flag;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEncryptedPassword() {
		return encryptedPassword;
	}

	public void setEncryptedPassword(String encryptedPassword) {
		this.encryptedPassword = encryptedPassword;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getServiceid() {
		return serviceid;
	}

	public void setServiceid(String serviceid) {
		this.serviceid = serviceid;
	}

	public String getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(String departmentid) {
		this.departmentid = departmentid;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public String getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(String loginFlag) {
		this.loginFlag = loginFlag;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getLoginOtpFlag() {
		return loginOtpFlag;
	}

	public void setLoginOtpFlag(String loginOtpFlag) {
		this.loginOtpFlag = loginOtpFlag;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public byte getLoginStatus1() {
		return LoginStatus1;
	}

	public void setLoginStatus1(byte loginStatus1) {
		LoginStatus1 = loginStatus1;
	}

	public String getTxtInput() {
		return txtInput;
	}

	public void setTxtInput(String txtInput) {
		this.txtInput = txtInput;
	}

	public String getTxtCaptcha() {
		return txtCaptcha;
	}

	public void setTxtCaptcha(String txtCaptcha) {
		this.txtCaptcha = txtCaptcha;
	}

	public int getLogincount() {
		return logincount;
	}

	public void setLogincount(int logincount) {
		this.logincount = logincount;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	public String getNewEncryptedPwd() {
		return newEncryptedPwd;
	}

	public void setNewEncryptedPwd(String newEncryptedPwd) {
		this.newEncryptedPwd = newEncryptedPwd;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", roleId=" + roleId + ", districtId="
				+ districtId + ", ms=" + ms + ", tpName=" + tpName + ", agencyCode=" + agencyCode + ", submissionId="
				+ submissionId + ", flag=" + flag + ", status=" + status + ", encryptedPassword=" + encryptedPassword
				+ ", employeeName=" + employeeName + ", empid=" + empid + ", serviceid=" + serviceid + ", departmentid="
				+ departmentid + ", loginStatus=" + loginStatus + ", loginFlag=" + loginFlag + ", lastLoginDate="
				+ lastLoginDate + ", loginOtpFlag=" + loginOtpFlag + ", userStatus=" + userStatus + ", LoginStatus1="
				+ LoginStatus1 + ", txtInput=" + txtInput + ", txtCaptcha=" + txtCaptcha + ", logincount=" + logincount
				+ ", mobile=" + mobile + ", email=" + email + ", confirmPwd=" + confirmPwd + ", newEncryptedPwd="
				+ newEncryptedPwd + "]";
	}

}