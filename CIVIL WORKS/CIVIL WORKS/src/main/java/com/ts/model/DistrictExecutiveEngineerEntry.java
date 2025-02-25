
package com.ts.model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
//@Table(name="DistrictExecutiveEngineer")
public class DistrictExecutiveEngineerEntry {

	@Id
	private Integer distExecEngId;
	private String ecv;
	private String tenderDiscount;
	private String tcv;
	private String dateOfAgreement;
	private String monthsTakenToCompletionWork;
	private String dateOfCompletionWork;
	private String siteHandedOverDate;
//	private Date siteGroundedDate;
//	private String delayReasons;
	private String tentativeDateForCompletion;
//	private Date totalFundReleasedTillDate;
	private String expenditureMadeTillDate;
	private String balenceExpenditureToBeMade;
	private String stageOfwork;
	//four uploads file
		@Transient
	MultipartFile upload1;
		@Transient
		MultipartFile upload2;
		@Transient
		MultipartFile  upload3;
		@Transient
		MultipartFile upload4;
	private String uploadOne;
	private String uploadTwo;
	private String uploadThree;
	private String uploadFour;
	private String flooorWiseRemarks;
	private String delayReasons;
	public Integer getDistExecEngId() {
		return distExecEngId;
	}
	public void setDistExecEngId(Integer distExecEngId) {
		this.distExecEngId = distExecEngId;
	}
	public String getEcv() {
		return ecv;
	}
	public void setEcv(String ecv) {
		this.ecv = ecv;
	}
	public String getTenderDiscount() {
		return tenderDiscount;
	}
	public void setTenderDiscount(String tenderDiscount) {
		this.tenderDiscount = tenderDiscount;
	}
	public String getTcv() {
		return tcv;
	}
	public void setTcv(String tcv) {
		this.tcv = tcv;
	}
	public String getDateOfAgreement() {
		return dateOfAgreement;
	}
	public void setDateOfAgreement(String dateOfAgreement) {
		this.dateOfAgreement = dateOfAgreement;
	}
	public String getMonthsTakenToCompletionWork() {
		return monthsTakenToCompletionWork;
	}
	public void setMonthsTakenToCompletionWork(String monthsTakenToCompletionWork) {
		this.monthsTakenToCompletionWork = monthsTakenToCompletionWork;
	}
	public String getDateOfCompletionWork() {
		return dateOfCompletionWork;
	}
	public void setDateOfCompletionWork(String dateOfCompletionWork) {
		this.dateOfCompletionWork = dateOfCompletionWork;
	}
	public String getSiteHandedOverDate() {
		return siteHandedOverDate;
	}
	public void setSiteHandedOverDate(String siteHandedOverDate) {
		this.siteHandedOverDate = siteHandedOverDate;
	}
	public String getTentativeDateForCompletion() {
		return tentativeDateForCompletion;
	}
	public void setTentativeDateForCompletion(String tentativeDateForCompletion) {
		this.tentativeDateForCompletion = tentativeDateForCompletion;
	}
	public String getExpenditureMadeTillDate() {
		return expenditureMadeTillDate;
	}
	public void setExpenditureMadeTillDate(String expenditureMadeTillDate) {
		this.expenditureMadeTillDate = expenditureMadeTillDate;
	}
	public String getBalenceExpenditureToBeMade() {
		return balenceExpenditureToBeMade;
	}
	public void setBalenceExpenditureToBeMade(String balenceExpenditureToBeMade) {
		this.balenceExpenditureToBeMade = balenceExpenditureToBeMade;
	}
	public String getStageOfwork() {
		return stageOfwork;
	}
	public void setStageOfwork(String stageOfwork) {
		this.stageOfwork = stageOfwork;
	}
	public MultipartFile getUpload1() {
		return upload1;
	}
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
	}
	public MultipartFile getUpload3() {
		return upload3;
	}
	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
	}
	public MultipartFile getUpload4() {
		return upload4;
	}
	public void setUpload4(MultipartFile upload4) {
		this.upload4 = upload4;
	}
	public String getUploadOne() {
		return uploadOne;
	}
	public void setUploadOne(String uploadOne) {
		this.uploadOne = uploadOne;
	}
	public String getUploadTwo() {
		return uploadTwo;
	}
	public void setUploadTwo(String uploadTwo) {
		this.uploadTwo = uploadTwo;
	}
	public String getUploadThree() {
		return uploadThree;
	}
	public void setUploadThree(String uploadThree) {
		this.uploadThree = uploadThree;
	}
	public String getUploadFour() {
		return uploadFour;
	}
	public void setUploadFour(String uploadFour) {
		this.uploadFour = uploadFour;
	}
	public String getFlooorWiseRemarks() {
		return flooorWiseRemarks;
	}
	public void setFlooorWiseRemarks(String flooorWiseRemarks) {
		this.flooorWiseRemarks = flooorWiseRemarks;
	}
	public String getDelayReasons() {
		return delayReasons;
	}
	public void setDelayReasons(String delayReasons) {
		this.delayReasons = delayReasons;
	}
	
	}
