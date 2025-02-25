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
@NamedStoredProcedureQuery(name = "insertDistrictExecutiveEngineerFirstEntry", procedureName = "cw_dist_executive_engineer_first_insertion_Insert", resultClasses = DistrictExecutiveEngineerFirstInsertion.class, parameters = {
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "ecv"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "tenderDiscount"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "tcv"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "dateOfAgreement"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "monthsTakenToCompletionWork"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "dateOfCompletionWork"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "siteHandedOverDate"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "stateid"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "createdby"),
		@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "Systemip"),
		@StoredProcedureParameter(mode = ParameterMode.OUT, type = String.class, name = "output"),

})
public class DistrictExecutiveEngineerFirstInsertion {
	@Id
	private String distExecEngId;
}
