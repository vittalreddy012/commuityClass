package com.ts.dao.imp;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ts.dao.TenderEntryDetailsDao;
import com.ts.model.TenderEntry;
import com.ts.util.CommonUtills;
import com.ts.model.DistrictExecutiveEngineerEditEntry;


@Component
public class TenderEntryDetailsDaoimpl implements TenderEntryDetailsDao{
	
	@Autowired
	 private EntityManager em;
	
	public String insertTenderEntryDetails(TenderEntry frm){
		String res=(String) em.createNamedStoredProcedureQuery("tenderInsert")
		.setParameter("component", frm.getComponent())
		.setParameter("district_code", frm.getDistrictCode())
		.setParameter("estimated_amount", frm.getEstimatedAmount())
		.setParameter("intervention", frm.getIntervention())
		.setParameter("mandal_code", frm.getMandalCode())
		.setParameter("sanction_amount", frm.getSanctionAmount())
		.setParameter("sch_code", frm.getSchCode())
		.setParameter("work_name", frm.getWorkName())
		.setParameter("sanction_year", frm.getSanctionYear())
		.setParameter("units", frm.getUnits())
		.setParameter("createdby", frm.getCreatedby())
		.setParameter("systemip", frm.getSystemip())
		.getOutputParameterValue("output");
		
		return res;
	}
	
	public String insertAdministrationUploads(TenderEntry frm) throws IOException{
		boolean file=false;
		String res="0";
	
		//String r1=frm.getSanctionAmount().replaceAll("/", "~");
		//String r2=r1.replaceAll(":", ";");
		//System.out.println(frm.getSanctionAmount().replaceAll("/", "~"));
		String getDrivePath = CommonUtills.getDrivePath();
		if(getDrivePath!= null) {
		if(frm.getSancUpload().getSize()>0) {
			
		 res=(String) em.createNamedStoredProcedureQuery("administrationSanctionInsert")
		.setParameter("sanction_no", frm.getSanctionAmount())
		.setParameter("intervention", frm.getIntervention())
		.setParameter("component", frm.getComponent())
		.setParameter("upload_file", frm.getSancUpload().getOriginalFilename())
		.setParameter("createdby", frm.getCreatedby())
		.setParameter("systemIp", frm.getSystemip())
		.getOutputParameterValue("output");
		if(res!=null&&res!=""&&!"2".equals(res)&&!"0".equals(res)){
		CommonUtills.uploadDocuments(frm.getSancUpload().getBytes(),frm.getSancUpload().getOriginalFilename(),"civilworks//AdministrationSanction//"+res+"//");
		res="1";
		}
		}
		}
		return res;
	}
		
	@Override
	public String updateTenderEntryDetails(DistrictExecutiveEngineerEditEntry frm) {
		String res=(String) em.createNamedStoredProcedureQuery("tenderUpdate")
				.setParameter("dist_exec_eng_id", frm.getDistExecEngId())
				.setParameter("component", frm.getComponent())
				.setParameter("estimated_amount", frm.getEstimatedAmount())
				.setParameter("intervention", frm.getIntervention())
				.setParameter("sanction_amount", frm.getSanctionAmount())
				.setParameter("sanction_year", frm.getSanctionYear())
				.setParameter("units", frm.getUnits())
				.setParameter("updatedby", frm.getCreatedby())
				.getOutputParameterValue("status");
				return res;
	}
	
	public List<Object[]> getTenderEntryDetails(String distid,String intervention,String component){
		List<Object[]> res= em.createNamedStoredProcedureQuery("tenderGet")
		.setParameter("distid", distid)
		.setParameter("intervention", intervention)
		.setParameter("component", component)
		.getResultList();
		return res;
	}

	@Override
	public List<Object[]> getTenderList(String id,String flag) {
		List<Object[]> res= em.createNamedStoredProcedureQuery("CW_estimationamountDistwise")
				.setParameter("distid", id)
				.setParameter("flag", flag)
				            .getResultList();
		
		//System.out.println(res);
		return res;
	}
	
	@Override
	public String deleteTenderDetails(String id) {
		String res= (String) em.createNamedStoredProcedureQuery("cw_tender_entry_details_Delete")
				.setParameter("tenderId", id)
				.getOutputParameterValue("output");
		
		return res;
	}
	
	@Override
	public List<Object[]> getTenderProforma(String id) {
		List<Object[]> res= em.createNamedStoredProcedureQuery("CW_tenderProforma")
				.setParameter("schcd", id)
				            .getResultList();
		return res;
	}
	
	@Override
	public List<Object[]> getTendersProformaOnInterventionComponentSchcd(String intervention,String component,String schcd,String distictcd) {
		List<Object[]> res= em.createNamedStoredProcedureQuery("CW_tenderProformabasedInterventionComponentSchd")
				.setParameter("distcd", distictcd)
				.setParameter("intervention", intervention)
				.setParameter("component", component)
				.setParameter("schcd", schcd)
				 .getResultList();	
		
		return res;
	}
	
	@Override
	public List<Object[]> getAdministrationSanctionUploads(String user) {
		//System.out.println("getAdministrationSanctionUploads==="+user+"====");
		List<Object[]> res= em.createNamedStoredProcedureQuery("cw_administration_sanctions_details_Get")
				.setParameter("userid", user)
				.getResultList();
		//System.out.println(res);
		return res;
	}
	
	public List<Object[]> getTendersOnInterventionComponentSchool(String intervention,String component,String schcd,String stateID){
		List<Object[]> res= em.createNamedStoredProcedureQuery("tenderEditDetailsGet")
				.setParameter("intervention", intervention)
				.setParameter("component", component)
				.setParameter("schcd", schcd)
				.setParameter("stateid", stateID)
				.getResultList();
		return res;
	}
	
}
