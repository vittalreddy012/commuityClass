


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ts.model.DistrictExecutiveEngineerEntry;

@Repository
public interface DistrictExecutiveEngineerEntryRepository
		extends JpaRepository<DistrictExecutiveEngineerEntry, Integer> {
	
	@Query(value="select ecv,tenderDiscount,tcv, dateOfAgreement, dateOfCompletionWork, siteHandedOverDate from cw_dist_executive_engineer_first_insertion where  stateid =:stateid " ,nativeQuery=true)
	List<Object[]> getDistrictFirstEntryList(@Param("stateid") String stateid);

	@Query(value="select count(stateid) from cw_dist_executive_engineer_first_insertion where  stateid =:stateid ",nativeQuery=true)
	int countRecords(@Param("stateid") String stateid);

	@Query(value="select estimated_amount from cw_tender_entry_details where  dist_exec_eng_id =:stateid ",nativeQuery=true)
	String estimatedAmount(@Param("stateid") String stateid);
	
	@Query(value="select Intervention from cw_tender_entry_details where  dist_exec_eng_id =:stateid ",nativeQuery=true)
	String getIntervention(@Param("stateid") String stateid);
	
//	@Query(value="select stageOfwork,tentativeDateForCompletion,expenditureMadeTillDate,balenceExpenditureToBeMade,openingbalance from cw_dist_executive_engineer_second_insertion where  dist_exec_eng_id =:stateid " ,nativeQuery=true)
	@Query(value="select b.workstage stageofwork, tentativeDateForCompletion ,year,month,expenditureMadeTillDate,a.balenceExpenditureToBeMade,a.openingbalance,uploadOne,uploadTwo,uploadThree,uploadFour,a.stageOfwork as stageofWorkId ,flooorWiseRemarks,delayReasons from cw_dist_executive_engineer_second_insertion a inner join cw_StageOfWork b on b.id = a.stageOfwork where a.dist_exec_eng_id =:stateid",nativeQuery=true)
	List<Object[]> getStageOfWorkList(@Param("stateid") String stateid);
	
//	@Query(value="select top 1 balenceExpenditureToBeMade from cw_dist_executive_engineer_second_insertion  where  dist_exec_eng_id =:stateid order by createddate desc ",nativeQuery=true)
//	@Query(value ="select  sum(convert(int,balenceExpenditureToBeMade)) balenceExpenditureToBeMade from cw_dist_executive_engineer_second_insertion where  dist_exec_eng_id =:stateid" ,nativeQuery=true)
	@Query(value="select top 1 b.balenceExpenditureToBeMade from CW_tender_entry_details a inner join cw_dist_executive_engineer_second_insertion b on b.dist_exec_eng_id = a.dist_exec_eng_id where a.dist_exec_eng_id =:stateid order by b.balenceExpenditureToBeMade asc" ,nativeQuery=true)
	String balanceAmount(@Param("stateid") String stateid);

	@Query(value="select stageOfwork,year,month from cw_dist_executive_engineer_second_insertion where  dist_exec_eng_id =:stateid order by stageOfwork" ,nativeQuery=true)
	List<Object[]> getStageDataList(@Param("stateid") String stateid);

	@Query(value="select top 1 openingbalance from cw_dist_executive_engineer_second_insertion  where  dist_exec_eng_id =:stateid order by createddate desc ",nativeQuery=true)
	String openingBalance(String stateid);
	
	@Query(value="select sum(convert(bigint,expenditureMadeTillDate)) expenditureMadeTillDate from cw_dist_executive_engineer_second_insertion  where  dist_exec_eng_id =:stateid ",nativeQuery=true)
	String previousMonthAmount(@Param("stateid") String stateid);

	@Query(value="select uploadOne,uploadTwo,uploadThree,uploadFour from cw_dist_executive_engineer_second_insertion  where  dist_exec_eng_id =:stateid and stageOfwork =:stageOfWork",nativeQuery=true)
	List<Object[]> imagesList(@Param("stateid") String stateid, @Param("stageOfWork") String stageOfWork);
	
	@Query(value="delete from  cw_dist_executive_engineer_second_insertion  where  dist_exec_eng_id =:stateid",nativeQuery=true)
     void deleteSecondInsertionRecordsById(@Param("stateid") String stateid);
	
//	@Query(value="select stageOfwork from cw_dist_executive_engineer_second_insertion where  dist_exec_eng_id =:stateid " ,nativeQuery=true)
//	String checkStageOfWork(@Param("stateid") String stateid);


	
}
