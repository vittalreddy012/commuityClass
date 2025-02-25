
package com.ts.model;


import java.sql.Date;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class DistrictExecutiveEngineerSecondEntry {

	@Id
	private Integer id;
	private String tentativeDateForCompletion;
	private String expenditureMadeTillDate;
	private String balenceExpenditureToBeMade;
	private String stageOfwork;
	
	@Column(name="dist_exec_eng_id")
	private String distExecEngId;
	
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
	private String openingBalance;
	
	private String year;
	private String month;
	private String expenditureMadeTillPreviousMonth;
	
	
	private byte[] image;  
	 
    @Column(name = "image")
    public byte[] getImage() {
        return this.image;
    }
    
    private String base64Image;
    public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	
	public String getDistExecEngId() {
		return distExecEngId;
	}
	public void setDistExecEngId(String distExecEngId) {
		this.distExecEngId = distExecEngId;
	}
	
	public String getOpeningBalance() {
		return openingBalance;
	}
	public void setOpeningBalance(String openingBalance) {
		this.openingBalance = openingBalance;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((balenceExpenditureToBeMade == null) ? 0 : balenceExpenditureToBeMade.hashCode());
		result = prime * result + ((delayReasons == null) ? 0 : delayReasons.hashCode());
		result = prime * result + ((distExecEngId == null) ? 0 : distExecEngId.hashCode());
		result = prime * result + ((expenditureMadeTillDate == null) ? 0 : expenditureMadeTillDate.hashCode());
		result = prime * result + ((flooorWiseRemarks == null) ? 0 : flooorWiseRemarks.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((openingBalance == null) ? 0 : openingBalance.hashCode());
		result = prime * result + ((stageOfwork == null) ? 0 : stageOfwork.hashCode());
		result = prime * result + ((tentativeDateForCompletion == null) ? 0 : tentativeDateForCompletion.hashCode());
		result = prime * result + ((upload1 == null) ? 0 : upload1.hashCode());
		result = prime * result + ((upload2 == null) ? 0 : upload2.hashCode());
		result = prime * result + ((upload3 == null) ? 0 : upload3.hashCode());
		result = prime * result + ((upload4 == null) ? 0 : upload4.hashCode());
		result = prime * result + ((uploadFour == null) ? 0 : uploadFour.hashCode());
		result = prime * result + ((uploadOne == null) ? 0 : uploadOne.hashCode());
		result = prime * result + ((uploadThree == null) ? 0 : uploadThree.hashCode());
		result = prime * result + ((uploadTwo == null) ? 0 : uploadTwo.hashCode());
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
		DistrictExecutiveEngineerSecondEntry other = (DistrictExecutiveEngineerSecondEntry) obj;
		if (balenceExpenditureToBeMade == null) {
			if (other.balenceExpenditureToBeMade != null)
				return false;
		} else if (!balenceExpenditureToBeMade.equals(other.balenceExpenditureToBeMade))
			return false;
		if (delayReasons == null) {
			if (other.delayReasons != null)
				return false;
		} else if (!delayReasons.equals(other.delayReasons))
			return false;
		if (distExecEngId == null) {
			if (other.distExecEngId != null)
				return false;
		} else if (!distExecEngId.equals(other.distExecEngId))
			return false;
		if (expenditureMadeTillDate == null) {
			if (other.expenditureMadeTillDate != null)
				return false;
		} else if (!expenditureMadeTillDate.equals(other.expenditureMadeTillDate))
			return false;
		if (flooorWiseRemarks == null) {
			if (other.flooorWiseRemarks != null)
				return false;
		} else if (!flooorWiseRemarks.equals(other.flooorWiseRemarks))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (openingBalance == null) {
			if (other.openingBalance != null)
				return false;
		} else if (!openingBalance.equals(other.openingBalance))
			return false;
		if (stageOfwork == null) {
			if (other.stageOfwork != null)
				return false;
		} else if (!stageOfwork.equals(other.stageOfwork))
			return false;
		if (tentativeDateForCompletion == null) {
			if (other.tentativeDateForCompletion != null)
				return false;
		} else if (!tentativeDateForCompletion.equals(other.tentativeDateForCompletion))
			return false;
		if (upload1 == null) {
			if (other.upload1 != null)
				return false;
		} else if (!upload1.equals(other.upload1))
			return false;
		if (upload2 == null) {
			if (other.upload2 != null)
				return false;
		} else if (!upload2.equals(other.upload2))
			return false;
		if (upload3 == null) {
			if (other.upload3 != null)
				return false;
		} else if (!upload3.equals(other.upload3))
			return false;
		if (upload4 == null) {
			if (other.upload4 != null)
				return false;
		} else if (!upload4.equals(other.upload4))
			return false;
		if (uploadFour == null) {
			if (other.uploadFour != null)
				return false;
		} else if (!uploadFour.equals(other.uploadFour))
			return false;
		if (uploadOne == null) {
			if (other.uploadOne != null)
				return false;
		} else if (!uploadOne.equals(other.uploadOne))
			return false;
		if (uploadThree == null) {
			if (other.uploadThree != null)
				return false;
		} else if (!uploadThree.equals(other.uploadThree))
			return false;
		if (uploadTwo == null) {
			if (other.uploadTwo != null)
				return false;
		} else if (!uploadTwo.equals(other.uploadTwo))
			return false;
		return true;
	}
	
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getExpenditureMadeTillPreviousMonth() {
		return expenditureMadeTillPreviousMonth;
	}

	public void setExpenditureMadeTillPreviousMonth(String expenditureMadeTillPreviousMonth) {
		this.expenditureMadeTillPreviousMonth = expenditureMadeTillPreviousMonth;
	}

	@Override
	public String toString() {
		return "DistrictExecutiveEngineerSecondEntry [id=" + id + ", tentativeDateForCompletion="
				+ tentativeDateForCompletion + ", expenditureMadeTillDate=" + expenditureMadeTillDate
				+ ", balenceExpenditureToBeMade=" + balenceExpenditureToBeMade + ", stageOfwork=" + stageOfwork
				+ ", distExecEngId=" + distExecEngId + ", upload1=" + upload1 + ", upload2=" + upload2 + ", upload3="
				+ upload3 + ", upload4=" + upload4 + ", uploadOne=" + uploadOne + ", uploadTwo=" + uploadTwo
				+ ", uploadThree=" + uploadThree + ", uploadFour=" + uploadFour + ", flooorWiseRemarks="
				+ flooorWiseRemarks + ", delayReasons=" + delayReasons + ", openingBalance=" + openingBalance
				+ ", year=" + year + ", month=" + month + ", expenditureMadeTillPreviousMonth="
				+ expenditureMadeTillPreviousMonth + ", image=" + Arrays.toString(image) + ", base64Image="
				+ base64Image + "]";
	}

	
		
}
