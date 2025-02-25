package com.ts.dao;

import java.io.IOException;
import java.util.List;

import com.ts.model.DistrictExecutiveEngineerEditEntry;
import com.ts.model.TenderEntry;

public interface TenderEntryDetailsDao {
String insertTenderEntryDetails(TenderEntry form);
String updateTenderEntryDetails(DistrictExecutiveEngineerEditEntry form);
List<Object[]> getTenderEntryDetails(String distid,String intervention,String component);
List<Object[]> getTenderList(String id,String flag);
List<Object[]> getTenderProforma(String id);
public String insertAdministrationUploads(TenderEntry frm) throws IOException;
public String deleteTenderDetails(String id);
public List<Object[]> getAdministrationSanctionUploads(String user) ;
List<Object[]> getTendersOnInterventionComponentSchool(String intervention,String component,String schcd,String stateID);
public List<Object[]> getTendersProformaOnInterventionComponentSchcd(String intervention,String component,String schcd,String distictcd);
}
