package com.ts.model;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DistrictExecutiveEngineerFirstEntry {

	@Id
	@Column(name="dist_exec_eng_id")
	private Integer id;
	private String ecv;
	private String tenderDiscount;
	private String tcv;
	private String dateOfAgreement;
	private String monthsTakenToCompletionWork;
	private String dateOfCompletionWork;
	private String siteHandedOverDate;
	
	@Column(name="stateid")
	private String distExecEngId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dateOfAgreement == null) ? 0 : dateOfAgreement.hashCode());
		result = prime * result + ((dateOfCompletionWork == null) ? 0 : dateOfCompletionWork.hashCode());
		result = prime * result + ((distExecEngId == null) ? 0 : distExecEngId.hashCode());
		result = prime * result + ((ecv == null) ? 0 : ecv.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((monthsTakenToCompletionWork == null) ? 0 : monthsTakenToCompletionWork.hashCode());
		result = prime * result + ((siteHandedOverDate == null) ? 0 : siteHandedOverDate.hashCode());
		result = prime * result + ((tcv == null) ? 0 : tcv.hashCode());
		result = prime * result + ((tenderDiscount == null) ? 0 : tenderDiscount.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DistrictExecutiveEngineerFirstEntry other = (DistrictExecutiveEngineerFirstEntry) obj;
		if (dateOfAgreement == null) {
			if (other.dateOfAgreement != null)
				return false;
		} else if (!dateOfAgreement.equals(other.dateOfAgreement))
			return false;
		if (dateOfCompletionWork == null) {
			if (other.dateOfCompletionWork != null)
				return false;
		} else if (!dateOfCompletionWork.equals(other.dateOfCompletionWork))
			return false;
		if (distExecEngId == null) {
			if (other.distExecEngId != null)
				return false;
		} else if (!distExecEngId.equals(other.distExecEngId))
			return false;
		if (ecv == null) {
			if (other.ecv != null)
				return false;
		} else if (!ecv.equals(other.ecv))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (monthsTakenToCompletionWork == null) {
			if (other.monthsTakenToCompletionWork != null)
				return false;
		} else if (!monthsTakenToCompletionWork.equals(other.monthsTakenToCompletionWork))
			return false;
		if (siteHandedOverDate == null) {
			if (other.siteHandedOverDate != null)
				return false;
		} else if (!siteHandedOverDate.equals(other.siteHandedOverDate))
			return false;
		if (tcv == null) {
			if (other.tcv != null)
				return false;
		} else if (!tcv.equals(other.tcv))
			return false;
		if (tenderDiscount == null) {
			if (other.tenderDiscount != null)
				return false;
		} else if (!tenderDiscount.equals(other.tenderDiscount))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DistrictExecutiveEngineerFirstEntry [id=" + id + ", ecv=" + ecv + ", tenderDiscount=" + tenderDiscount
				+ ", tcv=" + tcv + ", dateOfAgreement=" + dateOfAgreement + ", monthsTakenToCompletionWork="
				+ monthsTakenToCompletionWork + ", dateOfCompletionWork=" + dateOfCompletionWork
				+ ", siteHandedOverDate=" + siteHandedOverDate + ", distExecEngId=" + distExecEngId + "]";
	}

		
}
