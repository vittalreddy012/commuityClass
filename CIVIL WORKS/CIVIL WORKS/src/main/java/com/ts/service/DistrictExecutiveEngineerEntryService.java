package com.ts.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.ts.model.DistrictExecutiveEngineerEditEntry;

public interface DistrictExecutiveEngineerEntryService {

	List<Object[]> getDistrictFirstEntryList(String stateid);

//	List getCountOfRecords();

	int countRecords(String stateid);

	String SateEntryEStAmount(String stateid);
	
	String getIntervention(String stateid);
	
	List<Object[]> getStageOfWorkList(String stateid);

	String balanceAmount(String stateid);

	List<Object[]> CheckStageOfWork(String stateid);

	String OpeningAmount(String stateid);

	List<Object[]> getImagesist(String stateid, String stageOfWork);

	String previousMonthAmount(String stateid);

	String deleteSecondInsertionRecordsById(String stateid);
	
	String upadteDistrictEntryRecords(DistrictExecutiveEngineerEditEntry formData) throws IOException, ParseException ;
}
