
package com.ts.service.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ts.model.DistrictExecutiveEngineerEditEntry;
import com.ts.repository.DistrictExecutiveEngineerEntryRepository;
import com.ts.service.DistrictExecutiveEngineerEntryService;
import com.ts.util.CommonUtills;

@Service
public class DistrictExecutiveEngineerEntryServiceImpl implements DistrictExecutiveEngineerEntryService {

	@Autowired
	 private EntityManager em;
	
	@Autowired
	private DistrictExecutiveEngineerEntryRepository repo;

	@Override
	public List getDistrictFirstEntryList(String stateid) {
		List<Object[]> distList =repo.getDistrictFirstEntryList(stateid);
		return distList;
	}

	/*
	 * @Override public List getCountOfRecords() { return repo.findAll(); }
	 */

	@Override
	public int countRecords(String stateid) {
		return repo.countRecords(stateid);
	}
	
	@Override
	public String SateEntryEStAmount(String stateid) {
		return repo.estimatedAmount(stateid);
	}
	
	@Override
	public String getIntervention(String stateid) {
		return repo.getIntervention(stateid);
	}
	
	@Override
	public List<Object[]> getStageOfWorkList(String stateid) {
		
		List<Object[]> stageList =repo.getStageOfWorkList(stateid);
		return stageList;
	}
	
	@Override
	public String balanceAmount(String stateid) {
		return repo.balanceAmount(stateid);
	}

	@Override
	public List<Object[]> CheckStageOfWork(String stateid) {
		
		List<Object[]> checkStageList =repo.getStageDataList(stateid);
		return checkStageList;
	}

	@Override
	public String OpeningAmount(String stateid) {
		return repo.openingBalance(stateid);
	}

	@Override
	public String previousMonthAmount(String stateid) {
		return repo.previousMonthAmount(stateid);
	}

	
	@Override
	public List<Object[]> getImagesist(String stateid, String stageOfWork) {
		return repo.imagesList(stateid,stageOfWork);
	}

	public String deleteSecondInsertionRecordsById(String stateid) {
		String res = (String)em
				.createNamedStoredProcedureQuery("deleteSecondDistrictExecutiveEngineer")
		.setParameter("tenderid", stateid)
		.getOutputParameterValue("output");
		 return res;
	}
	
	public String upadteDistrictEntryRecords(DistrictExecutiveEngineerEditEntry formData) throws IOException, ParseException {
		//System.out.println("Entered Update Service");
		//System.out.println("checkboxes-===="+formData.getCheckedBoxesupdate());
		String up1="",up2="",up3="",up4="";
		String stateid = formData.getDistExecEngId();
		
		/* First Screen Entries */ 
		String ecv = formData.getEcv();
		String tenderdiscount = formData.getTenderDiscount();
		String tcv = formData.getTcv();
		String dateOfAgreement=formData.getDateOfAgreement();
		String timeComOfAgreement=formData.getDateOfCompletionWork();
		String siteHandoverDate=formData.getSiteHandedOverDate();
		/* End First Screen Entries */
		
		/* Second Screen Entries */
		String year=formData.getYearorginal();
		String month=formData.getMonthoriginal();
		String stageOfwork=formData.getStageofworkoriginal();
		String checkboxes=formData.getCheckedBoxesupdate();
		String tenativeDate=formData.getTentativeDateForCompletionupdate();
		
		MultipartFile[] uploadOne=formData.getUploadOne();
		MultipartFile[] uploadTwo=formData.getUploadTwo();
		MultipartFile[] uploadThree=formData.getUploadThree();
		MultipartFile[] uploadFour=formData.getUploadFour();
		
		String []upload1=formData.getUploadOneoriginal();
		String []upload2=formData.getUploadTwooriginal();
		String []upload3=formData.getUploadThreeoriginal();
		String []upload4=formData.getUploadFouroriginal();
		
		String remarks=formData.getFlooorWiseRemarksupdate();
		String reasons=formData.getDelayReasonsupdate();
		/*End Second Screen Entries */
		
	String res="0";
	
		if(checkboxes!=null && checkboxes.length()>0)	{
		String[] checkbox =null,yr=null,mnth=null,workId=null;
		if(checkboxes!=null) {
			checkbox = checkboxes.split(",");
		}
		if(year!=null) {
			yr = year.split("~");
		}
		if(month!=null) {
			mnth = month.split("~");
		}
		if(stageOfwork!=null) {
			workId = stageOfwork.split("~");
		}
		
		for(int i=0;i<checkbox.length;i++) {
			int cnt=Integer.parseInt(checkbox[i]);
			
			String getDrivePath = CommonUtills.getDrivePath();
			if(getDrivePath != null) {
			
			//Upload one file
				if (uploadOne[cnt]!=null && uploadOne[cnt].getOriginalFilename()!=""&& uploadOne[cnt].getSize() > 0) {
				boolean flag=CommonUtills.uploadDocuments(uploadOne[cnt].getBytes(), uploadOne[Integer.parseInt(checkbox[i])].getOriginalFilename(),"civilworks" + "//" + stateid + "//" + workId[i]+"//"+yr[i]+"//"+mnth[i]);
				 if(flag) {
					 up1=up1+uploadOne[cnt].getOriginalFilename()+"~";
				 }else {
					 up1=up1+upload1[cnt]+"~";
				 }
				}else {
				 up1=up1+upload1[cnt]+"~";
			}
			//upload two File
			if (uploadTwo[cnt]!=null && uploadTwo[cnt].getOriginalFilename()!=""&& uploadTwo[cnt].getSize() > 0) {
				boolean flag=CommonUtills.uploadDocuments(uploadTwo[cnt].getBytes(), uploadTwo[cnt].getOriginalFilename(),"civilworks" + "//" + stateid + "//" + workId[i]+"//"+yr[i]+"//"+mnth[i]);
				 if(flag) {
					 up2=up2+uploadTwo[cnt].getOriginalFilename()+"~";
				 }else {
					 up2=up2+upload2[cnt]+"~";
				 }
				 
			}else {
				 up2=up2+upload2[cnt]+"~";
			}
			//upload Three File
			if (uploadThree[cnt]!=null && uploadThree[cnt].getOriginalFilename()!=""&& uploadThree[cnt].getSize() > 0) {
				 boolean flag=CommonUtills.uploadDocuments(uploadThree[cnt].getBytes(), uploadThree[cnt].getOriginalFilename(),"civilworks" + "//" + stateid + "//" + workId[i]+"//"+yr[i]+"//"+mnth[i]);
				 if(flag) {
					 up3=up3+uploadThree[cnt].getOriginalFilename()+"~";
				 }else {
					 up3=up3+upload3[cnt]+"~";
				 }
				 
			}else {
				 up3=up3+upload3[cnt]+"~";
			}
			//upload Four File
			if (uploadFour[cnt]!=null && uploadFour[cnt].getOriginalFilename()!=""&& uploadFour[cnt].getSize() > 0) {
				boolean flag=CommonUtills.uploadDocuments(uploadFour[cnt].getBytes(),uploadFour[cnt].getOriginalFilename(),"civilworks" + "//" + stateid + "//" + workId[i]+"//"+yr[i]+"//"+mnth[i]);
				 if(flag) {
					 up4=up4+uploadFour[cnt].getOriginalFilename()+"~";
				 }else {
					 up4=up4+upload4[cnt]+"~";
				 }
			}else {
				 up4=up4+upload4[cnt]+"~";
			}
			}
		}
		}
		
		/*
		 * System.out.println(
		 * "=============================================================================="
		 * ); System.out.println("stateid===="+stateid);
		 * System.out.println("ecv===="+ecv); System.out.println("tcv===="+tcv);
		 * System.out.println("dateOfAgreement===="+dateOfAgreement);
		 * System.out.println("dateOfCompletionWork==="+timeComOfAgreement);
		 * System.out.println("siteHandoverDate===="+siteHandoverDate);
		 * System.out.println(
		 * "=============================================================================="
		 * ); System.out.println("year==="+year.substring(0,year.length()-1));
		 * System.out.println("month==="+month.substring(0,month.length()-1));
		 * System.out.println("stageofwork==="+stageOfwork.substring(0,stageOfwork.
		 * length()-1)); System.out.println(
		 * "=============================================================================="
		 * ); System.out.println("tenativeDate===="+tenativeDate);
		 * System.out.println("up1===="+up1); System.out.println("up2===="+up2);
		 * System.out.println("up3===="+up3); System.out.println("up4===="+up4);
		 * System.out.println("remarks===="+remarks);
		 * System.out.println("reasons===="+reasons); System.out.println(
		 * "=============================================================================="
		 * );
		 */
		  
		 	
		 res=(String) em.createNamedStoredProcedureQuery("updateDistrictExecutiveEntry")
				.setParameter("stateid", stateid)
				.setParameter("ecv", ecv)
				.setParameter("tcv", tcv)
				.setParameter("dateOfAgreement", getFormatDate(dateOfAgreement))
				.setParameter("dateOfCompletionWork", getFormatDate(timeComOfAgreement))
				.setParameter("siteHandedOverDate", getFormatDate(siteHandoverDate))
				.setParameter("year", year)
				.setParameter("month", month)
				.setParameter("stageofwork", stageOfwork)
				.setParameter("tenativeDate", tenativeDate)
				.setParameter("uploadOne", up1)
				.setParameter("uploadTw", up2)
				.setParameter("uploadThree", up3)
				.setParameter("uploadFour", up4)
				.setParameter("remarks", remarks)
				.setParameter("reasons", reasons)
				.getOutputParameterValue("output");
		
		return res;
	}
	
	private static String getFormatDate(String dt) throws ParseException {

		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date2 = sdf2.parse(dt);
		java.sql.Date frmtdate = new java.sql.Date(date2.getTime());
		return frmtdate.toString();
	}
	 
}
	 
	
	

