


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository; import
org.springframework.data.jpa.repository.Query;
//import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.ts.model.TenderEntry;

public interface TenderEntryRepository extends JpaRepository<TenderEntry,Integer> {

@Query(value="select DISTCD,DISTNAME from Steps_District  order by DISTCD",nativeQuery=true)
List<Object[]> getDistrictList();

@Query(value="select BLKCD,BLKNAME from STEPS_BLOCK where  distcd=:distcd order by BLKCD",nativeQuery=true) 
List<Object[]> getMandalList(@Param("distcd") String distCode);

@Query(value="select SCHCD,SCHNAME from STEPS_SCHOOL where SCHCD like :mandalCode order by SCHCD",nativeQuery=true) 
List<Object[]> getSchoolList(@Param("mandalCode") String mandalCode);

@Query(value="select SCHNAME from STEPS_SCHOOL where SCHCD=:schoolcode order by SCHNAME",nativeQuery=true)
String getWorksList(@Param("schoolcode") String schoolcode);

@Query(value="select distinct sanction_amount from CW_tender_entry_details where (intervention=:intervention OR 'ALL' =:intervention) and (component=:component OR 'ALL' =:component) order by sanction_amount",nativeQuery=true)
List<String> getAdministrativeSanctionList(String intervention,String component);

@Query(value="select  distinct work_name from CW_tender_entry_details where (district_code=:distcd or '0'=:distcd)  and (intervention=:intervention OR 'ALL' =:intervention) and (component=:component OR 'ALL' =:component) order by work_name",nativeQuery=true)
List getSchoolWorkLisFromTenders(@Param("distcd") String distcd,@Param("intervention") String intervention,@Param("component") String component);

@Query(value="select SCHCD,SCHNAME from STEPS_SCHOOL where SCHCD like :mandalCode order by SCHCD",nativeQuery=true) 
List<Object[]> getTenderDetailsById(@Param("mandalCode") String mandalCode);

/*@Procedure(value = "cw_tender_entry_details_Insert")
void insertTenderEntryDetails(@Param("district_code") int district_code,@Param("mandal_code") int mandal_code,@Param("sch_code") String sch_code, @Param("work_name") String work_name,@Param("component") String component,@Param("intervention") String intervention,@Param("sanction_year") int sanction_year,@Param("units") int units,@Param("estimated_amount") String estimated_amount,@Param("sanction_amount") String sanction_amount,@Param("createdby") String createdby,@Param("systemip") String systemip);
*/
//@Query(value="call cw_tender_entry_details_Get(:distid)",nativeQuery=true)	
/*@Procedure(value="cw_tender_entry_details_Get")
List<Object[]> getTenderEntryDetails(@Param("distid") int distCode);	*/
	
}