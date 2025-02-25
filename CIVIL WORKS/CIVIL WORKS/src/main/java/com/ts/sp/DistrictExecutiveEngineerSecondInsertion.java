package com.ts.sp;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@NamedStoredProcedureQuery(name = "insertDistrictExecutiveEngineerSecondEntry", procedureName = "cw_dist_executive_engineer_second_insertion_Insert", resultClasses = DistrictExecutiveEngineerSecondInsertion.class, parameters = {
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "dist_exec_eng_id"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "tentativeDateForCompletion"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "expenditureMadeTillDate"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "balenceExpenditureToBeMade"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "stageOfwork"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "uploadOne"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "uploadTwo"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "uploadThree"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "uploadFour"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "flooorWiseRemarks"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "delayReasons"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "createdby"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "systemip"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "openingbalance"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "year"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "month"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "expenditureMadeTillPreviousMonth"),
		@StoredProcedureParameter(mode = ParameterMode.OUT, type = String.class, name = "output"),

})
public class DistrictExecutiveEngineerSecondInsertion {
	@Id
	private String distExecEngId;
}
