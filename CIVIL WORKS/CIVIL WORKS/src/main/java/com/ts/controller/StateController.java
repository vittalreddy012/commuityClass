
package com.ts.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ts.model.DistrictExecutiveEngineerEditEntry;
import com.ts.model.TenderEntry;
import com.ts.service.DistrictExecutiveEngineerEntryService;
import com.ts.service.StateTenderEntryService;
import com.ts.util.CommonUtills;

@Controller
public class StateController {

	//private static final Logger log = LoggerFactory.getLogger(StateController.class);
	
	@Autowired
	private StateTenderEntryService service;
	
	@Autowired
	private DistrictExecutiveEngineerEntryService distservice;

	@GetMapping("/tenderregister")
	public String tenderReg(Model model, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String roleId = (String) ses.getAttribute("RoleId");
		if (roleId != null && "129".equalsIgnoreCase(roleId)) {
			Map distList = service.getDistrictList();
			model.addAttribute("distList", distList);
			// model.addAttribute("date", Calendar.getInstance().get(Calendar.YEAR));
		} else {
			return "sessionExpired";
		}
		return "withLogin/tenderRegistration";
	}

	@PostMapping("/tenderregister")
	public String insertReg(@ModelAttribute TenderEntry form, Model map, HttpServletRequest req) {
		try {
			HttpSession ses = req.getSession();
			String username = (String) ses.getAttribute("userName");
			
			if (username != null) {
				form.setCreatedby(username);
				form.setSystemip(CommonUtills.getSystemIp());
				Map distList = service.getDistrictList();
				map.addAttribute("distList", distList);
				String status = service.saveTenderDetails(form);
				map.addAttribute("message",
						"<font style='color:green'>Inserted Details Successfully with id :</font>" + status);
			} else {
				return "sessionExpired";
			}
		} catch (Exception e) {
			map.addAttribute("message", "<font style='color:red'>Insertion Failed .Please try again...</font>");
			e.printStackTrace();
		}
		return "withLogin/tenderRegistration";
	}

	@GetMapping("/tenderEdit")
	public String tenderEdit(Model model, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String roleId = (String) ses.getAttribute("RoleId");
		if (roleId != null && "129".equalsIgnoreCase(roleId)) {
          List list = service.getSchoolWorkList("0","ALL","ALL");
			if (list != null && list.size() > 0) {
				model.addAttribute("schoolWorklist", list);
			}
			
        } else {
			return "sessionExpired";
		}
		return "withLogin/tenderRegistrationEdit";
	}
	
	@RequestMapping("/deleteDistrictExecutiveEngineerFromStateEntry")
	public String deleteDistrictExecutiveEngineerStateEntry(RedirectAttributes model, HttpServletRequest req) throws IOException {
			
		String stateid = req.getParameter("tenderId");
		
		String succesMsg="";
		HttpSession ses = req.getSession();
		String roleId = (String) ses.getAttribute("RoleId");
        if (roleId != null && "129".equalsIgnoreCase(roleId)) {
        	String intervention=req.getParameter("intervention1").trim().replace("~", " ");;
        	String component =req.getParameter("component1").trim().replace("~", " ");;
        	String schcd=req.getParameter("schCode1").trim().replace("~", " ");;
        	
    	    String delres=distservice.deleteSecondInsertionRecordsById(stateid);	
    		if("1".equals(delres)) {
    			succesMsg = "<font style='color:green'>Records Deleted Successfully</font>";
    		}else {
    			succesMsg = "<font style='color:green'>Failed to Delete Records,Please try again..</font>";
    		}
        	
			/* Tender Entry List */
        	List<Map<String, Object>> list = service.getTendersOnInterventionComponentSchool(intervention,component,schcd,"ALL");
    	
    		if (list != null && list.size() > 0) { 
				model.addFlashAttribute("tenderlist", list);
			 } else { 
				 model.addFlashAttribute("msg", "No details Found");
				  }
			model.addFlashAttribute("message", succesMsg);
			
			model.addFlashAttribute("intervention1", intervention);
			model.addFlashAttribute("component1", component);
			model.addFlashAttribute("schCode1", schcd);
			
		} else {
			return "sessionExpired";
		}
        return "redirect:tenderEdit";
	}

	
	@RequestMapping("/tenderEditRedirectionPage")
	public String EditRedirectionPage( HttpServletRequest req, HttpServletResponse res) throws IOException, ParseException {
			
		String stateid = req.getParameter("testval");
		
		HttpSession ses = req.getSession();
		String roleId = (String) ses.getAttribute("RoleId");
        if (roleId != null && "129".equalsIgnoreCase(roleId)) {
        	String intervention=req.getParameter("intervention1").trim().replace("~", " ");;
        	String component =req.getParameter("component1").trim().replace("~", " ");;
        	String schcd=req.getParameter("schCode1").trim().replace("~", " ");;
        	
			/* Tender Entry List */
        	List<Map<String, Object>> list = service.getTendersOnInterventionComponentSchool(intervention,component,schcd,stateid);
			//System.out.println("list==="+list);
			  if (list != null && list.size() > 0) { 
				  req.setAttribute("tenderEditlist", list);
			  } else { req.setAttribute("msg", "No details Found"); }
			  
			  String InterventionInDb = distservice.getIntervention(stateid);
			//  System.out.println("InterventionInDb====="+InterventionInDb);
				 req.setAttribute("stateid", stateid); 
				 req.setAttribute("interventionfromdb", InterventionInDb);
				
			/* District First Entry Screen */
			  Map map = null;
				ArrayList firstEntryData = new ArrayList();
				List<Object[]> firstEntry = distservice.getDistrictFirstEntryList(stateid);
				if(firstEntry!=null && firstEntry.size()>0) {
				for (Object[] result : firstEntry) {
					//map = new HashMap();
								req.setAttribute("ecv", result[0]);
					req.setAttribute("tenderDiscount", result[1]);
					req.setAttribute("tcv", result[2]);
					req.setAttribute("dateOfAgreement", getParseDateToutilDate(result[3]!=null?result[3]+"":""));
					req.setAttribute("dateOfCompletionWork", getParseDateToutilDate(result[4]!=null?result[4]+"":""));
					req.setAttribute("siteHandedOverDate", getParseDateToutilDate(result[5]!=null?result[5]+"":""));
					req.setAttribute("firstEntry", "firstEntry");
					
				}
				}else {
					req.setAttribute("firstEntry", "");
				}
				/* District Second Entry Screen */
				Map map1 = null;
				ArrayList stageOfWorksDataList = null;
		        List<Object[]> stageOfWorkList = distservice.getStageOfWorkList(stateid);
		         if(stageOfWorkList!=null && stageOfWorkList.size()>0) {
		        	 stageOfWorksDataList=new ArrayList();
		        for (Object[] result : stageOfWorkList) {
					map1 = new HashMap();
					map1.put("stageOfwork", result[0]);
					map1.put("tentativeDateForCompletion", result[1]);
					map1.put("year", result[2]);
					map1.put("month",result[3]);
					map1.put("expenditureMadeTillDate", result[4]);
					map1.put("balenceExpenditureToBeMade", result[5]);
					map1.put("openingbalance", result[6]);
					map1.put("uploadOne", result[7]);
					map1.put("uploadTwo", result[8]);
					map1.put("uploadThree", result[9]);
					map1.put("uploadFour", result[10]);
					map1.put("stageOfworkId", result[11]);
					map1.put("floorwiseremarks", result[12]);
					map1.put("delayreasons", result[13]);
					stageOfWorksDataList.add(map1);
				}
		         }
		   req.setAttribute("SecondEntryData", stageOfWorksDataList);

			req.setAttribute("intervention1", intervention);
			req.setAttribute("component1", component);
			req.setAttribute("schCode1", schcd);
		} else {
			return "sessionExpired";
		}
		return "withLogin/tenderRegistrationEditPopup";
	}

	private static String getParseDateToutilDate(String dt) throws ParseException {
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat targetFormat = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date = originalFormat.parse(dt);
		String formattedDate = targetFormat.format(date); 
		return formattedDate;
	}
	
	@PostMapping(value = "/tenderDetailsEdit")
	public String gettenderDetailsEdit(RedirectAttributes model, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String roleId = (String) ses.getAttribute("RoleId");
        if (roleId != null && "129".equalsIgnoreCase(roleId)) {
        	String intervention=req.getParameter("intervention1");
        	String component =req.getParameter("component1");
        	String schcd=req.getParameter("schCode1");
        	List<Map<String, Object>> list = service.getTendersOnInterventionComponentSchool(intervention,component,schcd,"ALL");
			if (list != null && list.size() > 0) {
				model.addFlashAttribute("tenderlist", list);
			} else {
				model.addFlashAttribute("msg", "No details Found");
			}
			model.addFlashAttribute("intervention1", intervention);
			model.addFlashAttribute("component1", component);
			model.addFlashAttribute("schCode1", schcd);
		} else {
			return "sessionExpired";
		}
		return "redirect:tenderEdit";
	}

	@PostMapping("/tenderEdit")
	public String tenderUpdate(@ModelAttribute DistrictExecutiveEngineerEditEntry form, Model map, HttpServletRequest req) {
		try {
			HttpSession ses = req.getSession();
			String username = (String) ses.getAttribute("userName");
			if (username != null) {
				String intervention=req.getParameter("intervention1");
	        	String component =req.getParameter("component1");
	        	String schcd=req.getParameter("schCode1");
	        	
				form.setCreatedby(username);
				String status = service.updateTenderDetails(form);
				//System.out.println("status====="+status);
				//System.out.println("form.getDateOfAgreement()====="+form.getDateOfAgreement());
				if(!"0".equals(status) && form.getDateOfAgreement()!=null && form.getDateOfAgreement()!="") {
					status=	distservice.upadteDistrictEntryRecords(form);
				}
				
				if (!"0".equals(status)) {
					map.addAttribute("message",
							"<font style='color:green'>Updated Details Successfully</font>");
                 } else {
					map.addAttribute("message", "<font style='color:red'>Updation Failed .Please try again...</font>");
				}
				List<Map<String, Object>> list = service.getTendersOnInterventionComponentSchool(intervention,component,schcd,"ALL");
				 if (list != null && list.size() > 0) {
					map.addAttribute("tenderlist", list);
				} else {
					map.addAttribute("msg", "No details Found");
				}
                List worklist = service.getSchoolWorkList("0","ALL","ALL");
    			if (list != null && list.size() > 0) {
    				map.addAttribute("schoolWorklist", worklist);
    			}
    			map.addAttribute("intervention1", intervention);
    			map.addAttribute("component1", component);
    			map.addAttribute("schCode1", schcd);
			} else {
				return "sessionExpired";
			}
		} catch (Exception e) {
			map.addAttribute("message", "<font style='color:red'>Updation Failed .Please try again...</font>");
			e.printStackTrace();
		}
		return "withLogin/tenderRegistrationEdit";
	}

	@PostMapping("/deleteTender")
	public String deleteTenderDetails(@ModelAttribute TenderEntry form, RedirectAttributes model, HttpServletRequest req) {
		String status = "";
		try {
			String intervention=req.getParameter("intervention1");
        	String component =req.getParameter("component1");
        	String schcd=req.getParameter("schCode1");
        //	System.out.println("form.getTenderId()==="+form.getTenderId());
        	status = service.deleteTenderDetails(form.getTenderId());
			if (status.equals("1")) {
				model.addFlashAttribute("message", "<font style='color:green'>Deleted Record Successfully</font>");
			} else {
				model.addFlashAttribute("message", "<font style='color:red'>Deletion Failed..Please Try Again</font>");
			}
			List<Map<String, Object>> list = service.getTendersOnInterventionComponentSchool(intervention,component,schcd,"ALL");
			if (list != null && list.size() > 0) {
				model.addFlashAttribute("tenderlist", list);
			} else {
				model.addFlashAttribute("msg", "No details Found");
			}
			model.addFlashAttribute("intervention1", intervention);
			model.addFlashAttribute("component1", component);
			model.addFlashAttribute("schCode1", schcd);
		} catch (Exception e) {
			model.addFlashAttribute("message", "<font style='color:red'>Deletion Failed..Please Try Again</font>");
			e.printStackTrace();
		}
		return "redirect:tenderEdit";
	}


	@RequestMapping("/getAjaxListDetails")
	public String getAjaxDetails(HttpServletResponse res, @RequestParam("reqType") String type,
			@RequestParam("reqName") String code) {
		String ajaxList = "";
		try {
			
			PrintWriter out = res.getWriter();
			Map<Integer, String> map1 = null;

			if ("districtCode".equalsIgnoreCase(type)) {
				map1 = service.getMandalList(code);
			} else if ("mandalCode".equalsIgnoreCase(type))

			{
				map1 = service.getSchoolList(code);
			} else

			if ("schcd".equalsIgnoreCase(type)) {
				String schname = service.getWorksList(code);
                
				ajaxList = ajaxList + "<option value='" + schname + "'>" + schname + "</option>";
			}

			if (map1 != null) {
				for (Map.Entry<Integer, String> entry : map1.entrySet()) {
					ajaxList = ajaxList + "<option value='" + entry.getKey() + "'>" + entry.getValue() + "</option>";
				}
			}
			System.out.println("ajaxList==="+ajaxList);
			out.println(ajaxList);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping("/getTenderDetails")
	public String getTenderDetailsReportForm(@ModelAttribute("tenderDetails") TenderEntry form, Model map,
			HttpServletRequest req) {
		HttpSession ses = null;
		String roleId = null;

		String Dbflag = "0", DbId = "0", totalId = "", totalflag = "";
		String distcd = form.getDistrictCode() != null ? form.getDistrictCode() : "0";
		String flag = form.getFlag() != null ? form.getFlag() : "0";

		try {
			ses = req.getSession();
			roleId = (String) ses.getAttribute("RoleId");
			if (roleId != null && ("129".equalsIgnoreCase(roleId) || ("130".equalsIgnoreCase(roleId)))) {
				String districtCode=(ses.getAttribute("districtId") != null && !"NA".equals((String)ses.getAttribute("districtId"))) ? ses.getAttribute("districtId").toString() : "0";
				 List list = service.getSchoolWorkList(districtCode,"ALL","ALL");
					if (list != null && list.size() > 0) {
						map.addAttribute("schoolWorklist", list);
					}
							} else {
				return "sessionExpired";
			}
		} catch (Exception e) {
			map.addAttribute("message", "No Data Available");
			e.printStackTrace();
		}
		return "withLoginReports/tenderDetailsReport";
	}

	
	@PostMapping("/getTenderDetails")
	public String getTenderDetailsReport(@ModelAttribute("tenderDetails") TenderEntry form, Model map,
			HttpServletRequest req) {
		HttpSession ses = null;
		String roleId = null;
		
		String Dbflag = "0", DbId = "0", totalId = "", totalflag = "";
		String distcd = form.getDistrictCode() != null  ? form.getDistrictCode() : "0";
		String flag=form.getFlag()!=null?form.getFlag():"0";
		try {
			ses = req.getSession();
			roleId = (String) ses.getAttribute("RoleId");
			String intervention=req.getParameter("intervention1");
        	String component =req.getParameter("component1");
        	String schcd=req.getParameter("schCode1");
			
			if (roleId != null && ("129".equalsIgnoreCase(roleId) || ("130".equalsIgnoreCase(roleId)))) {
				String districtCode=(ses.getAttribute("districtId") != null && !"NA".equals((String)ses.getAttribute("districtId"))) ? ses.getAttribute("districtId").toString() : "0";
				System.out.println("flag====roleId Checking="+flag);
				if("ALL".equals(intervention)&&"ALL".equals(component)&&"ALL".equals(schcd)){
					
				if ("0".equals(flag)) {
					
					if ("129".equalsIgnoreCase(roleId) && distcd.trim().length() == 1) {
						totalId = "ALL";
						totalflag = "2";
					} else if ("130".equalsIgnoreCase(roleId) && distcd.trim().length() == 1) {
						DbId = districtCode;
						Dbflag = "1";
						totalId = DbId;
						totalflag = "2";
					} else {
						totalId = distcd;
						totalflag = "2";
						DbId = distcd;
						Dbflag = "2";
					}
				
					List<Map<String, Object>> distSchoolList = service.getTenderList(DbId, Dbflag);
					
//					log.info("distSchoolList======="+distSchoolList);
					// Disrtict and School List
					
					if (distSchoolList != null && distSchoolList.size() > 0) {
						if (distcd.trim().length() == 1) {
							map.addAttribute("distList", distSchoolList);
						} else {
							
							map.addAttribute("schoolList", distSchoolList);
						}
						map.addAttribute("totalid", totalId);
						map.addAttribute("totalflag", totalflag);
					} else {
						map.addAttribute("msg", "No details Found");
					}
					
				} else { // tender List and tender status report
					 if ("2".equalsIgnoreCase(flag)) {
						List tenderstatusDetailList = service.getTenderProforma(distcd);
						if (tenderstatusDetailList != null && tenderstatusDetailList.size() > 0) {
							
							map.addAttribute("tenderstatusDetailList", tenderstatusDetailList);
						} else {
							map.addAttribute("msg", "No details Found");
						}
						
					}
				}
			
				map.addAttribute("backAvail", 1);
             }else {
            	 List tenderstatusDetailList = service. getTendersProformaOnInterventionComponentSchcd(intervention,component,schcd,districtCode);
				
            	 if (tenderstatusDetailList != null && tenderstatusDetailList.size() > 0) {
						map.addAttribute("tenderstatusDetailList", tenderstatusDetailList);
					} else {
						map.addAttribute("msg", "No details Found");
					}
					map.addAttribute("backAvail", 0);
             }
             
			 List list = service.getSchoolWorkList(districtCode,"ALL","ALL");
				if (list != null && list.size() > 0) {
					map.addAttribute("schoolWorklist", list);
				}
            map.addAttribute("intervention1", intervention);
 			map.addAttribute("component1", component);
 			map.addAttribute("schCode1", schcd);
 			map.addAttribute("excelid" ,distcd);
			map.addAttribute("excelval", flag);
			} else {
				return "sessionExpired";
			}
		} catch (Exception e) {
			map.addAttribute("message", "No Data Available");
			e.printStackTrace();
		}
		return "withLoginReports/tenderDetailsReport";
	}

	@RequestMapping(value = "/downloadExcel", method = RequestMethod.POST)
	public String downloadExcel(@ModelAttribute("tenderDetails") TenderEntry form, Model map,
			HttpServletRequest req) {
		HttpSession ses = null;
		String roleId = null;

		String Dbflag = "0", DbId = "0", totalId = "", totalflag = "";
		String distcd = (form.getDistrictCode() != null && form.getDistrictCode() != "") ? form.getDistrictCode() : "0";
		String flag = (form.getFlag() != null && form.getFlag() != "") ? form.getFlag() : "0";

		try {
			ses = req.getSession();
			roleId = (String) ses.getAttribute("RoleId");
			String intervention=req.getParameter("intervention1");
        	String component =req.getParameter("component1");
        	String schcd=req.getParameter("schCode1");
			
			if (roleId != null && ("129".equalsIgnoreCase(roleId) || ("130".equalsIgnoreCase(roleId)))) {
				String districtCode=(ses.getAttribute("districtId") != null && !"NA".equals((String)ses.getAttribute("districtId"))) ? ses.getAttribute("districtId").toString() : "0";
				
				if("ALL".equals(intervention)&&"ALL".equals(component)&&"ALL".equals(schcd)){
				if ("0".equals(flag)) {
					if ("129".equalsIgnoreCase(roleId) && distcd.trim().length() == 1) {
						totalId = "ALL";
						totalflag = "2";
					} else if ("130".equalsIgnoreCase(roleId) && distcd.trim().length() == 1) {
						DbId = districtCode;
						Dbflag = "1";
						totalId = DbId;
						totalflag = "2";
					} else {
						totalId = distcd;
						totalflag = "2";
						DbId = distcd;
						Dbflag = "2";
					}
					List<Map<String, Object>> distSchoolList = service.getTenderList(DbId, Dbflag);
					// Disrtict and School List

					if (distSchoolList != null && distSchoolList.size() > 0) {
						if (distcd.trim().length() == 1) {
							map.addAttribute("distList", distSchoolList);
						} else {
							
							map.addAttribute("schoolList", distSchoolList);
						}
						map.addAttribute("totalid", totalId);
						map.addAttribute("totalflag", totalflag);
					} else {
						map.addAttribute("msg", "No details Found");
					}
					
				} else { // tender List and tender status report
					if ("1".equalsIgnoreCase(flag)) {
						List tenderDetailList = service.getTenderEntryList(distcd,"ALL","ALL");
						if (tenderDetailList != null && tenderDetailList.size() > 0) {
							map.addAttribute("tenderDetailList", tenderDetailList);
						} else {
							map.addAttribute("msg", "No details Found");
						}
					} else if ("2".equalsIgnoreCase(flag)) {
						List tenderstatusDetailList = service.getTenderProforma(distcd);
						if (tenderstatusDetailList != null && tenderstatusDetailList.size() > 0) {
							map.addAttribute("tenderstatusDetailList", tenderstatusDetailList);
						} else {
							map.addAttribute("msg", "No details Found");
						}
						
					}
				}
			
			 }else {
            	 List tenderstatusDetailList = service. getTendersProformaOnInterventionComponentSchcd(intervention,component,schcd,districtCode);
					if (tenderstatusDetailList != null && tenderstatusDetailList.size() > 0) {
						map.addAttribute("tenderstatusDetailList", tenderstatusDetailList);
					} else {
						map.addAttribute("msg", "No details Found");
					}
			 }
             
			List list = service.getSchoolWorkList(districtCode,"ALL","ALL");
				if (list != null && list.size() > 0) {
					map.addAttribute("schoolWorklist", list);
				}
           } else {
				return "sessionExpired";
			}
		} catch (Exception e) {
			map.addAttribute("message", "No Data Available");
			e.printStackTrace();
		}
		return "withLoginReports/tenderDetailsExcel";
	}
	
	
	@RequestMapping("/getWorkNamesListDetails")
	public String getWorkNameList(HttpServletRequest req,HttpServletResponse res,@RequestParam("intervention") String intervention,@RequestParam("component") String component) {
		String ajaxList = "";
		try {
			HttpSession ses=req.getSession();
			//System.out.println("getWorkNamesListDetails");
			String districtCode=(ses.getAttribute("districtId") != null && !"NA".equals((String)ses.getAttribute("districtId"))) ? ses.getAttribute("districtId").toString() : "0";
			PrintWriter out = res.getWriter();
			ajaxList = ajaxList+"<option value=''>--Select--</option><option value='ALL'>ALL</option>";
				List list = service.getSchoolWorkList(districtCode, intervention, component);
			      if(list!=null) {
			    	  for(int i=0;i<list.size();i++) {
			    	  ajaxList = ajaxList+"<option value='"+list.get(i)+"'>"+list.get(i)+"</option>";  
			      }
			      }
				out.println(ajaxList);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	@RequestMapping("/getSanctionDetails")
	public String getSanctionAjax(HttpServletResponse res,@RequestParam("intervention") String intervention,@RequestParam("component") String component) {
		String ajaxList = "";
		try {
			//System.out.println("getSanctionDetails");
			PrintWriter out = res.getWriter();
			ajaxList = ajaxList+"<option value='0'>--Select--</option>";
				List list = service.getAdministrativeSanction(intervention, component);
			      if(list!=null) {
			    	  for(int i=0;i<list.size();i++) {
			    	  ajaxList = ajaxList+"<option value='"+list.get(i)+"'>"+list.get(i)+"</option>";  
			      }
			      }
				out.println(ajaxList);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	
	@GetMapping("/uploadSanction")
	public String showUploadSanction(@ModelAttribute TenderEntry form, Model map, HttpServletRequest req) {
		try {
			HttpSession ses = req.getSession();
			String username = (String) ses.getAttribute("userName");
			if (username != null) {
			//	Map m = service.getAdministrativeSanction();
			//	map.addAttribute("sanList", m);
			} else {
				return "sessionExpired";
			}
		} catch (Exception e) {

		}
		return "withLogin/uploadAdministrationSanction";
	}

	@PostMapping("/uploadSanction")
	public String insertUploadSanction(@ModelAttribute TenderEntry form, Model map, HttpServletRequest req) {
		try {
			HttpSession ses = req.getSession();
			String username = (String) ses.getAttribute("userName");
			String status = "";
			form.setCreatedby(username);
			form.setSystemip(CommonUtills.getSystemIp());

			status = service.insertAdministrationUploads(form);
			
			if ("2".equals(status)) {
				map.addAttribute("message", "<font style='color:red'>Already Administrative Sanction Uploaded.</font>");
			} else if ("1".equals(status)) {
				map.addAttribute("message",
						"<font style='color:green'>Uploaded  Administrative Sanction Successfully</font>");
			} else {
				map.addAttribute("message", "<font style='color:red'>Uploaded Failed .Please try again...</font>");
			}
		} catch (Exception e) {
			map.addAttribute("message", "<font style='color:red'>Uploaded Failed .Please try again...</font>");
			e.printStackTrace();
		}
		return "withLogin/uploadAdministrationSanction";
	}

		@RequestMapping("/getAdminstrationSactionUploads")
	public String getAdminstrationSactionUploads(Model model, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String user = (String) ses.getAttribute("userName");
		if (user != null) {
			//System.out.println("user=="+user);
			List list = service.getAdministrationSanctionUploads(user);
			if (list != null && list.size() > 0) {
				model.addAttribute("uploadList", list);
			} else {
				model.addAttribute("message", "No Details Found");
			}
		} else {
			return "sessionExpired";
		}
		return "withLogin/admintrationSanctionUploads";
	}

	@RequestMapping("/downloadsanction")
	public void downloadSanction(@ModelAttribute TenderEntry form, HttpServletResponse response, Model model) {
		BufferedInputStream input = null;

		try {
			String r1=form.getTenderId().replaceAll("/", "~");
			String r2=r1.replaceAll(":", ";");
			response.addHeader("Content-Disposition", "attachment;filename=" + form.getFlag());
			File dirpath = new File(CommonUtills.getDrivePath() + "civilworks//AdministrationSanction//"+r2+ "//" + form.getFlag());
		//	System.out.println(dirpath);
			if (dirpath.exists()) {
				input = new BufferedInputStream(new FileInputStream(dirpath));
				FileCopyUtils.copy(input, response.getOutputStream());
			} else {
				model.addAttribute("msg", "Selected File Not Available");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
