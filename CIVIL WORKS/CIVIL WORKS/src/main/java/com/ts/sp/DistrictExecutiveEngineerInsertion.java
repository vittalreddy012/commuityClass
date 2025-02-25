
package com.ts.sp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity

@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)

@NamedStoredProcedureQuery(name = "insertDistrictExecutiveEngineerEntry", procedureName = "CW_district_executive_engineer_Insert", resultClasses = DistrictExecutiveEngineerInsertion.class, parameters = {

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "dist_exec_eng_id"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "ecv"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "tender_discount"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "tcv"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "date_of_agreement"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "date_of_completion_work"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "site_handed_over_date"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "tentative_date_for_completion"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "expenditure_made_till_date"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "balence_expenditure_to_be_made"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "stage_ofwork"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "upload_one"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "upload_two"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "upload_three"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "upload_four"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "flooor_wise_remarks"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "delay_reasons"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "createdby"),

		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "Systemip"),

		@StoredProcedureParameter(mode = ParameterMode.OUT, type = String.class, name = "output"),

})
public class DistrictExecutiveEngineerInsertion {

	@Id
	private String distExecEngId;
}
