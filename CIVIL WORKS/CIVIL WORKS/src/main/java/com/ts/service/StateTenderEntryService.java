
package com.ts.service;

import java.io.IOException;
import java.util.List; import java.util.Map;

import com.ts.model.DistrictExecutiveEngineerEditEntry;
import com.ts.model.TenderEntry;

public interface StateTenderEntryService {

public Map<Integer, String> getDistrictList(); 
public Map<Integer, String> getMandalList(String distcode); 
public Map<Integer, String> getSchoolList(String mandalCode); 
public List getAdministrativeSanction(String intervention,String component) ;

public String saveTenderDetails(TenderEntry form)throws Exception; 
public String updateTenderDetails(DistrictExecutiveEngineerEditEntry form)throws Exception; 
public String getWorksList(String scCode); 
public List getTenderEntryList(String distid,String intervention,String component);
public List getTenderList(String id,String flag);
public List getTenderProforma(String id) ;

public String insertAdministrationUploads(TenderEntry frm) throws IOException;
public String deleteTenderDetails(String id);
public List<Map<String,Object>> getAdministrationSanctionUploads(String user) ;
public List getSchoolWorkList(String distcd,String intervention,String component) ;
public List getTendersOnInterventionComponentSchool(String intervention,String component,String schcd,String stateID);
public List getTendersProformaOnInterventionComponentSchcd(String intervention,String component,String schcd,String distictcd);
}
