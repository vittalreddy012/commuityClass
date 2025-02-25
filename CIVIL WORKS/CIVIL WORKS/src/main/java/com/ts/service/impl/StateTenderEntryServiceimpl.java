package com.ts.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.dao.TenderEntryDetailsDao;
import com.ts.model.DistrictExecutiveEngineerEditEntry;
import com.ts.model.TenderEntry;
import com.ts.repository.TenderEntryRepository;
import com.ts.service.StateTenderEntryService;

@Service
public class StateTenderEntryServiceimpl implements StateTenderEntryService {

	@Autowired
	private TenderEntryRepository tenderRepo;
	@Autowired
	private TenderEntryDetailsDao dao;

/*	@Override
	@Transactional
	public Integer saveTenderDetails(TenderEntry form) throws Exception {
		TenderEntry entry = tenderRepo.save(form);
		return entry.getTenderId();
	}
*/
	public Map<Integer, String> getDistrictList() {
		Map map = null;
		List<Object[]> distList = tenderRepo.getDistrictList();
		map=new LinkedHashMap();
		for(Object[] result : distList){
		    map.put(result[0], result[1]);
		}
	    return map;
			//map = distList.stream().collect(Collectors.toMap(n -> n[0], n -> n[1]));
		//return map;
	}

	public String saveTenderDetails(TenderEntry form) {
          //tenderRepo.insertTenderEntryDetails(form.getDistrictCode(), form.getMandalCode(), form.getSchCode(), form.getWorkName(),form.getComponent(), form.getIntervention(), form.getSanctionYear(), form.getUnits(), form.getEstimatedAmount(), form.getSanctionAmount(), "", form.getSystemip());
		 //List<Object[]>res= tenderRepo.getTenderEntryDetails(3615);
		String res= dao.insertTenderEntryDetails(form);
		 return res;
	}
	
	@Override
	public String updateTenderDetails(DistrictExecutiveEngineerEditEntry form) throws Exception {
		String res= dao.updateTenderEntryDetails(form);
		 return res;
	}

	public Map<Integer, String> getMandalList(String distcode) {
		Map map = null;
		List<Object[]> MandalList = tenderRepo.getMandalList(distcode);
		map=new LinkedHashMap();
		for(Object[] result : MandalList){
		    map.put(result[0], result[1]);
		}
	    return map;
		//map = MandalList.stream().collect(Collectors.toMap(n -> n[0], n -> n[1]));
		//return map;
	}

	public Map<Integer, String> getSchoolList(String mandalCode) {
		Map map = null;
		List<Object[]> SchoolList = tenderRepo.getSchoolList(mandalCode + "%");
		map=new LinkedHashMap();
		for(Object[] result : SchoolList){
		    map.put(result[0], result[0]+"-"+result[1]);
		}
	    return map;
		//map = SchoolList.stream().collect(Collectors.toMap(n -> n[0], n -> n[0]));
		//return map;
	}

	public String getWorksList(String scCode) {

		String workList = tenderRepo.getWorksList(scCode);
		return workList;
	}

	public List getTenderEntryList(String distid,String intervention,String component) {
        //String workList = tenderRepo.getWorksList(distid);
		Map map=null;ArrayList list=new ArrayList();
		List<Object[]> tenderDetails=dao.getTenderEntryDetails(distid,intervention,component);
		//map = tenderDetails.stream().collect(Collectors.toMap("tenderId", n->n[0],"mandalName", n -> n[1],"schcd",n->n[2],"sancAmpount",n->n[3],"unit",n->n[4],"estAmount",n->n[5]));
		if("ALL".equalsIgnoreCase(distid)) {
			for(Object[] result : tenderDetails){
				map=new HashMap();
			    map.put("tenderId", result[0]);
			    map.put("distName",result[1]);
			    map.put("mandalName",result[2]);
			    map.put("schcd", result[3]);
			    map.put("intervention", result[4]);
			    map.put("component", result[5]);
			    map.put("sancAmpount",result[6]);
			    map.put("sancyear",result[7]);
			    map.put("unit",result[8]);
			    map.put("estAmount",result[9]);
			    map.put("amountused",result[10]);
			    map.put("workName",result[11]);
			    list.add(map);
		}
		}else {
		for(Object[] result : tenderDetails){
			map=new HashMap();
		    map.put("tenderId", result[0]);
		    map.put("mandalName",result[1]);
		    map.put("schcd", result[2]);
		    map.put("workName",result[3]);
		    map.put("intervention", result[4]);
		    map.put("component", result[5]);
		    map.put("sancAmpount",result[6]);
		    map.put("unit",result[7]);
		    map.put("estAmount",result[8]);
		    map.put("displaypage",result[9]);
		    map.put("editcount",result[10]);
		    list.add(map);
		}
		}
		//System.out.println("list==="+list);
		return list;
	}

	@Override
	public List getTenderList(String id,String flag) {
		Map map=null;ArrayList list=new ArrayList();
		List<Object[]> tenderList=dao.getTenderList(id,flag);
		//System.out.println(id+","+flag);
		for(Object[] result : tenderList){
			map=new HashMap();
		    map.put("DistCode", result[0]); 
		    map.put("DistName",result[1]); 
		    map.put("schools", result[2]);
		    map.put("units", result[3]);
		    map.put("estimatecost", Math.round((double)result[4]));
		
		    list.add(map);
		}
		return list;
	}

	@Override
	public List getTenderProforma(String id) {
		Map map=null;ArrayList list=new ArrayList();
		List<Object[]> tenderList=dao.getTenderProforma(id);
		
		for(Object[] result : tenderList){
			map=new LinkedHashMap();
			map.put("stateId", result[0]); 
		    map.put("DistCode", result[1]); 
		    map.put("DistName", result[2]); 
		    map.put("schcd", result[3]);
		    map.put("workName", result[4]);
		    map.put("intervention", result[5]);
		    map.put("component", result[6]); 
		    map.put("units", result[7]);
		    map.put("sanYear", result[8]);
		    map.put("sanAmount", result[9]);
		    map.put("estAmount", result[10]);
		    map.put("ecv", result[11]);
		    map.put("tenderdiscount", result[12]);
		    map.put("tcv", result[13]);
		    map.put("dateofagreement", result[14]);
		    map.put("tentativeDate", result[15]);
		    map.put("siteHandOverDate", result[16]);
		    map.put("expenditureMade", result[17]);
		    map.put("balenceExpenditure", result[18]);
		    map.put("workStageId", result[19]);
		    map.put("workStage", result[20]);
		    map.put("uploadOne", result[21]);
		    map.put("uploadTwo", result[22]);
		    map.put("uploadThree", result[23]);
		    map.put("uploadFour", result[24]);
		    map.put("remarks", result[25]);
		    map.put("delayresons", result[26]);
		    map.put("openingbalance", result[27]);
		    list.add(map);
		}
		return list;
	}

	@Override
	public List getTendersProformaOnInterventionComponentSchcd(String intervention,String component,String schcd,String distictcd) {
		Map map=null;ArrayList list=new ArrayList();
		List<Object[]> tenderList=dao.getTendersProformaOnInterventionComponentSchcd(intervention,component,schcd,distictcd);
		
		for(Object[] result : tenderList){
			map=new LinkedHashMap();
			map.put("stateId", result[0]); 
		    map.put("DistCode", result[1]); 
		    map.put("DistName", result[2]); 
		    map.put("schcd", result[3]);
		    map.put("workName", result[4]);
		    map.put("intervention", result[5]);
		    map.put("component", result[6]); 
		    map.put("units", result[7]);
		    map.put("sanYear", result[8]);
		    map.put("sanAmount", result[9]);
		    map.put("estAmount", result[10]);
		    map.put("ecv", result[11]);
		    map.put("tenderdiscount", result[12]);
		    map.put("tcv", result[13]);
		   
		    map.put("dateofagreement", result[14]);
		    map.put("tentativeDate", result[15]);
		    map.put("siteHandOverDate", result[16]);
		    map.put("expenditureMade", result[17]);
		    map.put("balenceExpenditure", result[18]);
		    map.put("workStageId", result[19]);
		    map.put("workStage", result[20]);
		    map.put("uploadOne", result[21]);
		    map.put("uploadTwo", result[22]);
		    map.put("uploadThree", result[23]);
		    map.put("uploadFour", result[24]);
		    map.put("remarks", result[25]);
		    map.put("delayresons", result[26]);
		    map.put("openingbalance", result[27]);
		    list.add(map);
		}
		return list;
	}


	@Override
	public List getAdministrativeSanction(String intervention,String component) {
		List m1=tenderRepo.getAdministrativeSanctionList(intervention,component);
		return m1;
	}

	@Override
	public String insertAdministrationUploads(TenderEntry frm) throws IOException {
		String res= dao.insertAdministrationUploads(frm);
		 return res;
	}

	@Override
	public String deleteTenderDetails(String id) {
		String res= dao.deleteTenderDetails(id);
		 return res;
	}

	@Override
	public List<Map<String, Object>> getAdministrationSanctionUploads(String user) {
		Map map=null;ArrayList list=new ArrayList();
		List<Object[]> tenderList=dao.getAdministrationSanctionUploads(user);
		
		for(Object[] result : tenderList){
			map=new HashMap();
		    map.put("adminId", result[0]); 
		    map.put("sanctionno",result[1]); 
		    map.put("uploadfile", result[2]);
		    list.add(map);
		}
		return list;
	}
	
	public List getSchoolWorkList(String distcd,String intervention,String component) {
		//Map map = null;ArrayList list=new ArrayList();
		
		List workList = tenderRepo.getSchoolWorkLisFromTenders(distcd,intervention,component);
		
		//map = workList.stream().collect(Collectors.toMap(n -> n[0], n -> n[0]));
		return workList;
	}
	
	
	public List getTendersOnInterventionComponentSchool(String intervention,String component,String schcd,String stateID){
       Map map=null;ArrayList list=new ArrayList();
		List<Object[]> tenderDetails=dao.getTendersOnInterventionComponentSchool(intervention,component,schcd,stateID);
		for(Object[] result : tenderDetails){
				map=new HashMap();
			    map.put("tenderId", result[0]);
			    map.put("distName",result[1]);
			    map.put("mandalName",result[2]);
			    map.put("schcd", result[3]);
			    if("98".equals(result[3])) {
			    map.put("workname", result[4]);
			    }else {
			     map.put("workname", result[3]+"-"+result[4]);
			    }
			    map.put("intervention", result[5]);
			    map.put("component", result[6]);
			    map.put("sancAmpount",result[7]);
			    map.put("sancyear",result[8]);
			    map.put("unit",result[9]);
			    map.put("estAmount",result[10]);   
			    map.put("amountused",result[11]);
			    list.add(map);
		}
		return list;
	}

}
