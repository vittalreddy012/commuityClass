package com.ts.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;

import org.springframework.web.multipart.MultipartFile;
@Entity 
@NamedStoredProcedureQueries(value= {
	       
		 @NamedStoredProcedureQuery(name= "updateDistrictExecutiveEntry", procedureName= "cw_distEntryDataUpdate", parameters= {
	                @StoredProcedureParameter(mode= ParameterMode.IN, name= "stateid", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "ecv", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "tcv", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "dateOfAgreement", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "dateOfCompletionWork", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "siteHandedOverDate", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "year", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "month", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "stageofwork", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "tenativeDate", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "uploadOne", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "uploadTw", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "uploadThree", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "uploadFour", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "remarks", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "reasons", type= String.class)
	                ,@StoredProcedureParameter(mode= ParameterMode.OUT, name= "output", type= String.class)
	        }),  
        
        @NamedStoredProcedureQuery(name= "deleteSecondDistrictExecutiveEngineer", procedureName= "cw_dist_executive_engineer_second_insertion_delete", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "tenderid", type= String.class)
               ,@StoredProcedureParameter(mode= ParameterMode.OUT, name= "output", type= String.class)
        })
})
public class DistrictExecutiveEngineerEditEntry {

    @Id
	@Column(name="stateid")
	private String distExecEngId;
    private String component; 
    private String intervention;
    private int sanctionYear;
    private int units;
    private String estimatedAmount;
    private String sanctionAmount;
    private String createdby;
    
	private String ecv;
	private String tenderDiscount;
	private String tcv;
	private String dateOfAgreement;
	private String monthsTakenToCompletionWork;
	private String dateOfCompletionWork;
	private String siteHandedOverDate;
	
	private String[] uploadOneoriginal;
	private String[] uploadTwooriginal;
	private String[] uploadThreeoriginal;
	private String[] uploadFouroriginal;
	
	private String yearorginal;
	private String monthoriginal;
	private String stageofworkoriginal;
	
	
	private String checkedBoxesupdate;
	private String tentativeDateForCompletionupdate;
	//private String uploadOneupdate;
	private MultipartFile[]  uploadOne;
	private MultipartFile[]  uploadTwo;
	private MultipartFile[]  uploadThree;
	private MultipartFile[]  uploadFour;

	private String flooorWiseRemarksupdate;
	private String delayReasonsupdate;
	private String flag;
	
	


	
	public String getComponent() {
		return component;
	}

	public void setComponent(String component) {
		this.component = component;
	}

	public String getIntervention() {
		return intervention;
	}

	public void setIntervention(String intervention) {
		this.intervention = intervention;
	}

	public int getSanctionYear() {
		return sanctionYear;
	}

	public void setSanctionYear(int sanctionYear) {
		this.sanctionYear = sanctionYear;
	}

	public int getUnits() {
		return units;
	}

	public void setUnits(int units) {
		this.units = units;
	}

	public String getEstimatedAmount() {
		return estimatedAmount;
	}

	public void setEstimatedAmount(String estimatedAmount) {
		this.estimatedAmount = estimatedAmount;
	}

	public String getSanctionAmount() {
		return sanctionAmount;
	}

	public void setSanctionAmount(String sanctionAmount) {
		this.sanctionAmount = sanctionAmount;
	}

	public String getCreatedby() {
		return createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
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

	public String getDistExecEngId() {
		return distExecEngId;
	}

	public void setDistExecEngId(String distExecEngId) {
		this.distExecEngId = distExecEngId;
	}
	public String getCheckedBoxesupdate() {
		return checkedBoxesupdate;
	}

	public void setCheckedBoxesupdate(String checkedBoxesupdate) {
		this.checkedBoxesupdate = checkedBoxesupdate;
	}

	public String[] getUploadOneoriginal() {
		return uploadOneoriginal;
	}

	public void setUploadOneoriginal(String[] uploadOneoriginal) {
		this.uploadOneoriginal = uploadOneoriginal;
	}

	public String[] getUploadTwooriginal() {
		return uploadTwooriginal;
	}

	public void setUploadTwooriginal(String[] uploadTwooriginal) {
		this.uploadTwooriginal = uploadTwooriginal;
	}

	public String[] getUploadThreeoriginal() {
		return uploadThreeoriginal;
	}

	public void setUploadThreeoriginal(String[] uploadThreeoriginal) {
		this.uploadThreeoriginal = uploadThreeoriginal;
	}

	public String[] getUploadFouroriginal() {
		return uploadFouroriginal;
	}

	public void setUploadFouroriginal(String[] uploadFouroriginal) {
		this.uploadFouroriginal = uploadFouroriginal;
	}

	public String getTentativeDateForCompletionupdate() {
		return tentativeDateForCompletionupdate;
	}

	public void setTentativeDateForCompletionupdate(String tentativeDateForCompletionupdate) {
		this.tentativeDateForCompletionupdate = tentativeDateForCompletionupdate;
	}

	public MultipartFile[] getUploadOne() {
		return uploadOne;
	}

	public void setUploadOne(MultipartFile[] uploadOne) {
		this.uploadOne = uploadOne;
	}
	public String getFlooorWiseRemarksupdate() {
		return flooorWiseRemarksupdate;
	}

	public MultipartFile[] getUploadTwo() {
		return uploadTwo;
	}

	public void setUploadTwo(MultipartFile[] uploadTwo) {
		this.uploadTwo = uploadTwo;
	}

	public MultipartFile[] getUploadThree() {
		return uploadThree;
	}

	public void setUploadThree(MultipartFile[] uploadThree) {
		this.uploadThree = uploadThree;
	}

	public MultipartFile[] getUploadFour() {
		return uploadFour;
	}

	public void setUploadFour(MultipartFile[] uploadFour) {
		this.uploadFour = uploadFour;
	}

	public void setFlooorWiseRemarksupdate(String flooorWiseRemarksupdate) {
		this.flooorWiseRemarksupdate = flooorWiseRemarksupdate;
	}

	public String getDelayReasonsupdate() {
		return delayReasonsupdate;
	}

	public void setDelayReasonsupdate(String delayReasonsupdate) {
		this.delayReasonsupdate = delayReasonsupdate;
	}

	public String getYearorginal() {
		return yearorginal;
	}

	public void setYearorginal(String yearorginal) {
		this.yearorginal = yearorginal;
	}

	public String getMonthoriginal() {
		return monthoriginal;
	}

	public void setMonthoriginal(String monthoriginal) {
		this.monthoriginal = monthoriginal;
	}

	public String getStageofworkoriginal() {
		return stageofworkoriginal;
	}

	public void setStageofworkoriginal(String stageofworkoriginal) {
		this.stageofworkoriginal = stageofworkoriginal;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}


		
}
