package com.ts.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ts.model.DistrictExecutiveEngineerEditEntry;
import com.ts.model.DistrictExecutiveEngineerFirstEntry;
import com.ts.model.DistrictExecutiveEngineerSecondEntry;
import com.ts.model.TenderEntry;
import com.ts.service.DistrictExecutiveEngineerEntryService;
import com.ts.service.StateTenderEntryService;
import com.ts.util.CommonUtills;

@Controller
public class DistrictExecutiveEngineerEntryController {

//	private static final Logger log = LoggerFactory.getLogger(DistrictExecutiveEngineerEntryController.class);

	/*
	 * @Autowired
	 * 
	 * @Qualifier("udiseDB") private EntityManager udiseDB;
	 */

	@Autowired
	private EntityManager em;

	@Autowired
	private StateTenderEntryService tenderser;

	@Autowired
	private DistrictExecutiveEngineerEntryService service;


	@RequestMapping("/DistrictExecutiveEngineerEntryForm")
	public String showPage() {

		return "withLogin/DistrictExecutiveEngineerFirstEntry";
	}

	@RequestMapping("/DistrictExecutiveEngineerEntryMain")
	public String mainPage(@ModelAttribute("tenderDetails") TenderEntry form, Model model, HttpServletRequest req,RedirectAttributes redirect) {
		HttpSession session = req.getSession();
		if(session!=null && session.getAttribute("userName")!=null){
		String districtId = "";
		
		String intervention = req.getParameter("intervention")!=null?req.getParameter("intervention"):"0";
		String component = req.getParameter("component")!=null?req.getParameter("component"):"0";
		
		if(!"0".equals(intervention) && !"0".equals(component) ){
		if (session.getAttribute("RoleId") != null) {
			districtId = (String) session.getAttribute("districtId");
		}
		List<Map<String, Object>> list = tenderser.getTenderEntryList(districtId, intervention, component);
		//System.out.println("list=="+list);
		if (list != null && list.size() > 0) {
			model.addAttribute("tenderlist", list);
		} else {
			model.addAttribute("msg", "No details Found");
		}
		model.addAttribute("intervention", intervention);
		model.addAttribute("component", component);
		}
		req.setAttribute("displayPage", "0");
		
		return "withLogin/DistrictExecutiveEngineermain";
		}else{
			return "sessionExpired";
		}
	}

	@RequestMapping("/RedirectionPage")
	public String RedirectionPage(Model model, HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute DistrictExecutiveEngineerSecondEntry formData) throws IOException {

		String stateid = req.getParameter("testval");
		String intervention = req.getParameter("intervention").trim().replace("~", " ");
		String component = req.getParameter("component").trim().replace("~", " ");
		String estimatedCostInDb = service.SateEntryEStAmount(stateid);
		
		req.setAttribute("intervention", intervention);
		req.setAttribute("component", component);
		int count = service.countRecords(stateid);
		
		String RedirectionPage = new Integer(count).toString();
		String InterventionInDb = service.getIntervention(stateid);
		req.setAttribute("interventionfromdb", InterventionInDb);
		// RedirectionPage="1";
		if (RedirectionPage.equals("0")) {
			// model.addAttribute(stateid);
			req.setAttribute("stateid", stateid);
			return "withLogin/DistrictExecutiveEngineerFirstEntry";
		} else {
			String arr = "";
			List<Object[]> checkStageOfWork = service.CheckStageOfWork(stateid);
			if (checkStageOfWork != null && checkStageOfWork.size() > 0) {
				for (int j = 0; j < checkStageOfWork.size(); j++) {
					Object[] ob = checkStageOfWork.get(j);
					
					for (int i = 0; i < ob.length; i++) {
						arr = arr + ob[i] + ",";
					}
				}
			} else {
				arr = "0,0,0";
			}
			//stageofwork,year,month
			model.addAttribute("stageorder", arr.substring(0, arr.length() - 1));
			
			try {
			    
				
				
				String balance = service.balanceAmount(stateid);
				String OpeningAmount = service.OpeningAmount(stateid);
				String previousMonthAmount = service.previousMonthAmount(stateid);
				if (balance != null) {
					// String balanceInDb = new Integer(balance).toString();
					req.setAttribute("balanceInDb", balance.toString());
					req.setAttribute("OpeningAmountDb", OpeningAmount);
					req.setAttribute("previousMonthAmount", previousMonthAmount);
				} else {
					req.setAttribute("balanceInDb", "0");
					req.setAttribute("OpeningAmountDb", "0");
					req.setAttribute("previousMonthAmount", "0");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			Map map = null;
			ArrayList firstEntryData = new ArrayList();
			List<Object[]> firstEntry = service.getDistrictFirstEntryList(stateid);
			for (Object[] result : firstEntry) {
				map = new HashMap();
				map.put("ecv", result[0]);
				map.put("tenderDiscount", result[1]);
				map.put("tcv", result[2]);
				map.put("dateOfAgreement", result[3]);
				map.put("dateOfCompletionWork", result[4]);
				map.put("siteHandedOverDate", result[5]);
				firstEntryData.add(map);
			}

			Map map1 = null;
			ArrayList stageOfWorksDataList = new ArrayList();
            List<Object[]> stageOfWorkList = service.getStageOfWorkList(stateid);
             
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

				stageOfWorksDataList.add(map1);
			}

			model.addAttribute("firstEntryData", firstEntryData);
			model.addAttribute("stageOfWorksDataList", stageOfWorksDataList);
			req.setAttribute("stateid", stateid);
			req.setAttribute("estimatedCost", estimatedCostInDb);
			
			return "withLogin/DistrictExecutiveEngineerSecondEntry";
		}

	}
 
	
	@RequestMapping("/EditRedirectionPage")
	public String EditRedirectionPage(Model model, HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute DistrictExecutiveEngineerSecondEntry formData) throws IOException, ParseException {
		
	
		String stateid = req.getParameter("testval");
		String intervention = req.getParameter("intervention").trim().replace("~", " ");
		String component = req.getParameter("component").trim().replace("~", " ");
		
		String InterventionInDb = service.getIntervention(stateid);
		req.setAttribute("stateid", stateid);
		req.setAttribute("interventionfromdb", InterventionInDb);
		req.setAttribute("intervention", intervention);
		req.setAttribute("component", component);
		
		Map map = null;
		ArrayList firstEntryData = new ArrayList();
		List<Object[]> firstEntry = service.getDistrictFirstEntryList(stateid);
		for (Object[] result : firstEntry) {
			//map = new HashMap();
						req.setAttribute("ecv", result[0]);
			req.setAttribute("tenderDiscount", result[1]);
			req.setAttribute("tcv", result[2]);
			req.setAttribute("dateOfAgreement", getParseDateToutilDate(result[3]!=null?result[3]+"":""));
			req.setAttribute("dateOfCompletionWork", getParseDateToutilDate(result[4]!=null?result[4]+"":""));
			req.setAttribute("siteHandedOverDate", getParseDateToutilDate(result[5]!=null?result[5]+"":""));
			
		}
		
		Map map1 = null;
		ArrayList stageOfWorksDataList = null;
        List<Object[]> stageOfWorkList = service.getStageOfWorkList(stateid);
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
	return "withLogin/DistrictExecutiveEngineerEditEntry";
	}


	@RequestMapping(value = "/saveDistrictExecutiveEngineerFirstEntry", method = RequestMethod.POST)
//	@Transactional
	public String saveDistrictExecutiveEngineerFirstEntryDetails(
			@ModelAttribute DistrictExecutiveEngineerFirstEntry formData, Model model, HttpServletRequest req,
			RedirectAttributes redirect) throws ParseException {
		String intervention = req.getParameter("intervention");
		String component = req.getParameter("component");
		HttpSession session = req.getSession();
		
		String doa = formData.getDateOfAgreement();
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date1 = sdf1.parse(doa);
		java.sql.Date dateOfAgreement = new java.sql.Date(date1.getTime()); 
		
		
		String doc = formData.getDateOfCompletionWork();
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date2 = sdf2.parse(doc);
		java.sql.Date dateOfCompletion = new java.sql.Date(date2.getTime());
		
		
		String shod = formData.getSiteHandedOverDate();
		SimpleDateFormat sdf3 = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date3 = sdf3.parse(shod);
		java.sql.Date siteHandOverDate = new java.sql.Date(date3.getTime());
		
		String username= (String)session.getAttribute("userName");
		
		
		//System.out.println("saveDistrictExecutiveEngineerFirstEntry=="+component);
		String districtId = "";
		if (session.getAttribute("RoleId") != null) {
			districtId = (String) session.getAttribute("districtId");
		}
		String msg = "Insertion Failed..";
		String res ="0";
		try {
			{
				res = (String) em
						.createNamedStoredProcedureQuery("insertDistrictExecutiveEngineerFirstEntry")
				.setParameter("ecv", formData.getEcv())
				.setParameter("tenderDiscount", formData.getTenderDiscount())
				.setParameter("tcv", formData.getTcv())
				.setParameter("dateOfAgreement", dateOfAgreement.toString())
				.setParameter("monthsTakenToCompletionWork", "0")
				.setParameter("dateOfCompletionWork",dateOfCompletion.toString())
				.setParameter("siteHandedOverDate", siteHandOverDate.toString())
				.setParameter("createdby", username)
				.setParameter("Systemip", "10.138.135.39")
				.setParameter("stateid", formData.getDistExecEngId())
				.getOutputParameterValue("output");
//				spq.executeUpdate();

				// create a message
				msg = "Inserted Records Successfully";
			} // send to ui
			// model.addAttribute("map", map);
			List<Map<String, Object>> list = tenderser.getTenderEntryList(districtId, intervention, component);

			if (list != null && list.size() > 0) {
				redirect.addFlashAttribute("tenderlist", list);
			} else {
				redirect.addFlashAttribute("msg", "No details Found");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		 model.addAttribute("msg1", msg);
		// req.setAttribute("message", msg);

		redirect.addFlashAttribute("intervention", intervention);
		redirect.addFlashAttribute("component", component);
		redirect.addFlashAttribute("msg1", msg);
		// goto ui page back
		return "redirect:/DistrictExecutiveEngineerEntryMain";
	}


	@RequestMapping(value = "/saveDistrictExecutiveEngineerSecondEntry", method = RequestMethod.POST)
//	@Transactional
	public String saveDistrictExecutiveEngineerSecondEntryDetails(
			@ModelAttribute DistrictExecutiveEngineerSecondEntry formData, Model model, RedirectAttributes redirect,
			HttpServletRequest req, HttpServletResponse res) {

		String intervention = req.getParameter("intervention");
		String component = req.getParameter("component");
	
		HttpSession session = req.getSession();
		String districtId = "";
		if (session.getAttribute("RoleId") != null) {
			districtId = (String) session.getAttribute("districtId");
		}
		String msg = "Insertion Failed..";
		String stateid = formData.getDistExecEngId();
		
		String res1="0";
		String getDrivePath = CommonUtills.getDrivePath();
		boolean file1 = false, file2 = false, file3 = false, file4 = false;
		try {
			if(getDrivePath!=null) {
			if (formData.getUpload1()!=null && formData.getUpload1().getSize() > 0)
				file1 = CommonUtills.uploadDocuments(formData.getUpload1().getBytes(),
						formData.getUpload1().getOriginalFilename(),
						"civilworks" + "//" + stateid + "//" + formData.getStageOfwork()+"//"+formData.getYear()+"//"+formData.getMonth());
			if (formData.getUpload2()!=null &&formData.getUpload2().getSize() > 0)
				file2 = CommonUtills.uploadDocuments(formData.getUpload2().getBytes(),
						formData.getUpload2().getOriginalFilename(),
						"civilworks" + "//" + stateid + "//" + formData.getStageOfwork()+"//"+formData.getYear()+"//"+formData.getMonth());
			if (formData.getUpload3()!=null &&formData.getUpload3().getSize() > 0)
				file3 = CommonUtills.uploadDocuments(formData.getUpload3().getBytes(),
						formData.getUpload3().getOriginalFilename(),
						"civilworks" + "//" + stateid + "//" + formData.getStageOfwork()+"//"+formData.getYear()+"//"+formData.getMonth());
			if (formData.getUpload4()!=null &&formData.getUpload4().getSize() > 0)
				file4 = CommonUtills.uploadDocuments(formData.getUpload4().getBytes(),
						formData.getUpload4().getOriginalFilename(),
						"civilworks" + "//" + stateid + "//" + formData.getStageOfwork()+"//"+formData.getYear()+"//"+formData.getMonth());

			if (file1 || file2 || file3 || file4) {

				 res1 = (String)em
						.createNamedStoredProcedureQuery("insertDistrictExecutiveEngineerSecondEntry")
				.setParameter("dist_exec_eng_id", stateid)
				.setParameter("tentativeDateForCompletion", formData.getTentativeDateForCompletion())
				.setParameter("expenditureMadeTillDate", formData.getExpenditureMadeTillDate())
				.setParameter("balenceExpenditureToBeMade", formData.getBalenceExpenditureToBeMade())
				.setParameter("stageOfwork", formData.getStageOfwork())
				.setParameter("uploadOne", formData.getUpload1().getOriginalFilename())
				.setParameter("uploadTwo", formData.getUpload2().getOriginalFilename())
				.setParameter("uploadThree", formData.getUpload3().getOriginalFilename())
				.setParameter("uploadFour", formData.getUpload4().getOriginalFilename())
				.setParameter("flooorWiseRemarks", formData.getFlooorWiseRemarks())
				.setParameter("delayReasons", formData.getDelayReasons())
				.setParameter("createdby", "DEO")
				.setParameter("systemip", "10.138.135.39")
				.setParameter("openingbalance", formData.getOpeningBalance())
				.setParameter("year", formData.getYear())
				.setParameter("month", formData.getMonth())
				.setParameter("expenditureMadeTillPreviousMonth", formData.getExpenditureMadeTillPreviousMonth())
				.getOutputParameterValue("output");
//				spq.execute();
				
				msg = "Inserted Records Successfully";
			} 
			}
			List<Map<String, Object>> list = tenderser.getTenderEntryList(districtId, intervention, component);

			if (list != null && list.size() > 0) {
				redirect.addFlashAttribute("tenderlist", list);
			} else {
				redirect.addFlashAttribute("msg", "No details Found");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		// goto ui page back
		redirect.addFlashAttribute("intervention", intervention);
		redirect.addFlashAttribute("component", component);
		redirect.addFlashAttribute("msg1", msg);
		return "redirect:/DistrictExecutiveEngineerEntryMain";
	}

	@RequestMapping(value = "/UpdateDistrictExecutiveEngineerEntry", method = RequestMethod.POST)
	public String updateDistrictExecutiveEngineerSecondEntryDetails(
			@ModelAttribute  DistrictExecutiveEngineerEditEntry formData, Model model, RedirectAttributes redirect,
			HttpServletRequest req, HttpServletResponse res) {
		String intervention = req.getParameter("intervention");
		String component = req.getParameter("component");
		
		HttpSession session = req.getSession();
		String districtId = "";
		try {
		if (session.getAttribute("RoleId") != null) {
			districtId = (String) session.getAttribute("districtId");
		}
		//System.out.println("Entered Update controller");
		String result=service.upadteDistrictEntryRecords(formData);
		if("0".equals(result)) {
			redirect.addFlashAttribute("msg1", "<font style='color:red'>Updation Failed,Please Try Again..</font>");
		}else {
			redirect.addFlashAttribute("msg1", "<font style='color:green'>Updated Details Successfully</font>");
		}
		
		List<Map<String, Object>> list = tenderser.getTenderEntryList(districtId, intervention, component);
		if (list != null && list.size() > 0) {
			redirect.addFlashAttribute("tenderlist", list);
		} else {
			redirect.addFlashAttribute("msg", "No details Found");
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();
	}	
		redirect.addFlashAttribute("intervention", intervention);
		redirect.addFlashAttribute("component", component);
				return "redirect:/DistrictExecutiveEngineerEntryMain";
	}

	@PostMapping(value ="/deleteDistrictExecutiveEngineerEntry")
	public String DeleteDistrictExecutiveEngineerSecondEntryDetails(
			@ModelAttribute DistrictExecutiveEngineerEditEntry formData, Model model, RedirectAttributes redirect,
			HttpServletRequest req, HttpServletResponse res) {

		String intervention = req.getParameter("intervention");
		String component = req.getParameter("component");
		
		HttpSession session = req.getSession();
		String districtId = "";
		String msg = "";
		try {
		if (session.getAttribute("RoleId") != null) {
			districtId = (String) session.getAttribute("districtId");
		}
		
		String stateid = formData.getDistExecEngId();
	    String delres=service.deleteSecondInsertionRecordsById(stateid);	
		if("1".equals(delres)) {
			msg = "Records Deleted Successfully..";
		}else {
			msg = "Failed to Delete Records,Please try again..";
		}
			List<Map<String, Object>> list = tenderser.getTenderEntryList(districtId, intervention, component);
			
			if (list != null && list.size() > 0) {
				redirect.addFlashAttribute("tenderlist", list);
			} else {
				redirect.addFlashAttribute("msg", "No details Found");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		redirect.addFlashAttribute("intervention", intervention);
		redirect.addFlashAttribute("component", component);
		redirect.addFlashAttribute("msg1", msg);
		return "redirect:/DistrictExecutiveEngineerEntryMain";
	}
	@RequestMapping("/downloadImage")
	public void downloader(HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute DistrictExecutiveEngineerSecondEntry formData, Model model) throws IOException {

		String stateid = formData.getDistExecEngId();
		BufferedInputStream input = null;
		try {
			res.addHeader("Content-Disposition", "attachment; filename=" + formData.getUploadOne());
			File dirpath = new File(CommonUtills.getDrivePath() + "civilworks" + "//" + stateid + "//"
					+ formData.getStageOfwork() + "//" + formData.getUploadOne());
			//System.out.println("dirpath===downlaoding=Images======" + dirpath);
			if (dirpath.exists()) {
				input = new BufferedInputStream(new FileInputStream(dirpath));
				FileCopyUtils.copy(input, res.getOutputStream());
			} else {
				model.addAttribute("msg", "Selected File Not Available");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/getAjaxListPhotos")
	public String viewImageUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam("stageOfWork") String stageOfWork, @RequestParam("stateid") String stateid, @RequestParam("year") String year, @RequestParam("month") String month,
			@ModelAttribute DistrictExecutiveEngineerSecondEntry formData, Model model) throws Exception {
		String b64 = "";
		PrintWriter out = res.getWriter();
		@SuppressWarnings("unchecked")
		List<Object[]> imageList = service.getImagesist(stateid, stageOfWork);

		for (Object[] result : imageList) {

			String image1 = (String) result[0];
			String image2 = (String) result[1];
			String image3 = (String) result[2];
			String image4 = (String) result[3];

			String img1 = getImageInBase64Format(stateid, stageOfWork, image1,year,month);
			String img2 = getImageInBase64Format(stateid, stageOfWork, image2,year,month);
			String img3 = getImageInBase64Format(stateid, stageOfWork, image3,year,month);
			String img4 = getImageInBase64Format(stateid, stageOfWork, image4,year,month);

			b64 = img1 + "~~" + img2 + "~~" + img3 + "~~" + img4 + "~~";

		}

		out.println(b64);
		out.flush();
		return "withLogin/DistrictExecutiveEngineerSecondEntry";
	}

	@RequestMapping("/getAjaxListPhotoByFileName")
	public String viewSingleImageUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam("stageOfWork") String stageOfWork, @RequestParam("stateid") String stateid, @RequestParam("year") String year, @RequestParam("month") String month,
			@RequestParam("filename") String image) throws Exception {
       String b64 = "";
		PrintWriter out = res.getWriter();
		String img1 = getImageInBase64Format(stateid, stageOfWork, image,year,month);

		b64 = img1 + "~~";
        out.println(b64);
		out.flush();
		return null;
	}
	public String getImageInBase64Format(String stateid, String stageOfWork, String imageName, String year,String month ) throws Exception {

		String filepath = null;
		String b64 = "";
		ByteArrayOutputStream baos = null;
		BufferedImage image = null;

		try {

			filepath = CommonUtills.getDrivePath() + "civilworks" + "\\" + stateid + "\\" + stageOfWork +"\\"+year+"\\"+month+ "\\" + imageName;
			File file = new File(filepath);

			if (!file.exists()) {
				return "";
			}

			image = ImageIO.read(file);

			baos = new ByteArrayOutputStream();

			int lastIndex = file.getName().lastIndexOf('.');

			// get extension
			String extenstion = file.getName().substring(lastIndex);

			if (extenstion != null && extenstion.equalsIgnoreCase(".jpg")) {
				ImageIO.write(image, "jpg", baos);
			} else {
				ImageIO.write(image, "png", baos);
			}
			// ImageIO.write(image, "jpg", baos);
			baos.flush();
			byte[] imageInByteArray = baos.toByteArray();
			b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (baos != null) {
				baos.close();
			}

			if (image != null) {
			}
		}
		return b64;
	}
	
	private static String getFormatDate(String dt) throws ParseException {

		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date2 = sdf2.parse(dt);
		java.sql.Date frmtdate = new java.sql.Date(date2.getTime());
		return frmtdate.toString();
	}
	private static String getParseDateToutilDate(String dt) throws ParseException {
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat targetFormat = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date = originalFormat.parse(dt);
		String formattedDate = targetFormat.format(date); 
		return formattedDate;
	}
	
	

}