
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
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity 
@Table(name="TenderEntryDetails") 
@NamedStoredProcedureQueries(value= {
	       
        @NamedStoredProcedureQuery(name= "tenderInsert", procedureName= "cw_tender_entry_details_Insert", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "component", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "district_code", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "estimated_amount", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "intervention", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "mandal_code", type= Integer.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "sanction_amount", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "sch_code", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "work_name", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "sanction_year", type= Integer.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "units", type= Integer.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "createdby", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "systemip", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.OUT, name= "output", type= String.class)
        }),
        
        @NamedStoredProcedureQuery(name= "tenderUpdate", procedureName= "CW_tender_entry_details_Update", parameters= {
                 @StoredProcedureParameter(mode= ParameterMode.IN, name= "dist_exec_eng_id", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "component", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "estimated_amount", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "intervention", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "sanction_amount", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "sanction_year", type= Integer.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "units", type= Integer.class)
                ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "updatedby", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.OUT, name= "status", type= String.class)
        }),
    
        @NamedStoredProcedureQuery(name= "administrationSanctionInsert", procedureName= "cw_admintration_sanctions_upload_Insert", parameters= {
        	    @StoredProcedureParameter(mode= ParameterMode.IN, name= "sanction_no", type= String.class)
        	    ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "intervention", type= String.class)
        	    ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "component", type= String.class)
        	    ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "upload_file", type= String.class)
        	    ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "createdby", type= String.class)
        	    ,@StoredProcedureParameter(mode= ParameterMode.IN, name= "systemIp", type= String.class)
                ,@StoredProcedureParameter(mode= ParameterMode.OUT, name= "output", type= String.class)
       }),
        
        @NamedStoredProcedureQuery(name = "CW_estimationamountDistwise", procedureName = "CW_estimationamountDistwise", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "distid", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "flag", type= String.class)
        }),
 
        @NamedStoredProcedureQuery(name = "cw_administration_sanctions_details_Get", procedureName = "cw_administration_sanctions_details_Get", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "userid", type= String.class),
              
        }),
   @NamedStoredProcedureQuery(name = "cw_tender_entry_details_Delete", procedureName = "cw_tender_entry_details_Delete", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "tenderId", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.OUT, name= "output", type= String.class)
        }),
        
        @NamedStoredProcedureQuery(name = "CW_tenderProforma", procedureName = "CW_proforma", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "schcd", type= String.class)
        }),
        
        @NamedStoredProcedureQuery(name= "CW_tenderProformabasedInterventionComponentSchd", procedureName= "CW_proformaGetByselection", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "distcd", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "intervention", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "component", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "schcd", type= String.class)
        }),
        
        @NamedStoredProcedureQuery(name= "tenderGet", procedureName= "cw_tender_entry_details_Get", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "distid", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "intervention", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "component", type= String.class)
        }),
        
         @NamedStoredProcedureQuery(name= "tenderEditDetailsGet", procedureName= "cw_tenderDetailsEditGet", parameters= {
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "intervention", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "component", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "schcd", type= String.class),
                @StoredProcedureParameter(mode= ParameterMode.IN, name= "stateid", type= String.class)
        })
})

public class TenderEntry {
  
  @Id
 // @GeneratedValue(generator="myGen")
  
//  @GenericGenerator(name="myGen",
//  strategy="com.ts.generator.TenderIdGenerator")
//  
  @GeneratedValue(strategy=GenerationType.IDENTITY) 
  @Column(name="tenderid") 
  private String tenderId;
  
  @Column(name="districtCode") 
  private String districtCode;
  
  
  @Column(name="mandalCode")
  private int mandalCode;
  
  @Column(name="schCode")
  private String schCode;
  
  @Column(name="workName") 
  private String workName;

  @Column(name="component") 
  private String component; 
  
  @Column(name="intervention") 
  private String intervention;
    

  @Column(name="sanctionYear") 
  private int sanctionYear;
  
  @Column(name="units") 
  private int units;

  @Column(name="estimatedAmount") 
  private String estimatedAmount;
  
  @Column(name="sanctionAmount") 
  private String sanctionAmount;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="createdDate") 
  private Date createdDate;
  
  @Column(name="createdby") 
  private String createdby;
  
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="updatedDate") 
  private Date updatedDate;
  
  @Column(name="systemip") 
  private String systemip;

  @Column(name="flag") 
  private String flag;
  
  @Transient
  private MultipartFile sancUpload;
  
  
public String getFlag() {
	return flag;
}

public void setFlag(String flag) {
	this.flag = flag;
}

public String getTenderId() {
	return tenderId;
}

public void setTenderId(String tenderId) {
	this.tenderId = tenderId;
}

public String getDistrictCode() {
	return districtCode;
}

public void setDistrictCode(String districtCode) {
	this.districtCode = districtCode;
}

public int getMandalCode() {
	return mandalCode;
}

public void setMandalCode(int mandalCode) {
	this.mandalCode = mandalCode;
}

public String getSchCode() {
	return schCode;
}

public void setSchCode(String schCode) {
	this.schCode = schCode;
}

public String getWorkName() {
	return workName;
}

public void setWorkName(String workName) {
	this.workName = workName;
}

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

public Date getCreatedDate() {
	return createdDate;
}

public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
}

public Date getUpdatedDate() {
	return updatedDate;
}

public void setUpdatedDate(Date updatedDate) {
	this.updatedDate = updatedDate;
}

public String getCreatedby() {
	return createdby;
}

public MultipartFile getSancUpload() {
	return sancUpload;
}

public void setSancUpload(MultipartFile sancUpload) {
	this.sancUpload = sancUpload;
}

public void setCreatedby(String createdby) {
	this.createdby = createdby;
}

public String getSystemip() {
	return systemip;
}

public void setSystemip(String systemip) {
	this.systemip = systemip;
}

@Override
public String toString() {
	return "TenderEntry [tenderId=" + tenderId + ", districtCode=" + districtCode + ", mandalCode=" + mandalCode
			+ ", schCode=" + schCode + ", workName=" + workName + ", component=" + component + ", intervention="
			+ intervention + ", sanctionYear=" + sanctionYear + ", units=" + units + ", estimatedAmount="
			+ estimatedAmount + ", sanctionAmount=" + sanctionAmount + ", createdDate=" + createdDate + ", createdby="
			+ createdby + ", updatedDate=" + updatedDate + ", systemip=" + systemip + ", flag=" + flag + "]";
}

  
   }
 